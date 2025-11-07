// user/t_thread_stress.c
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "ulock.h"
#include "uthread.h"  // for clone/join syscall prototypes

#define PGSIZE 4096
#define MAX_T  32

static volatile int counter = 0;
static lock_t lk;

// track (aligned_stack -> raw_base) so we free the right pointer
struct stack_map {
  void *aligned;
  void *raw;
} smap[MAX_T];

static void *alloc_aligned_stack(void **raw_out) {
  // allocate 2 pages, then align to page boundary
  void *raw = malloc(PGSIZE * 2);
  if(raw == 0){
    printf(1, "t_thread_stress: malloc failed for stack\n");
    *raw_out = 0;
    return 0;
  }
  uint addr = (uint)raw;
  uint aligned = (addr + (PGSIZE - 1)) & ~(PGSIZE - 1);
  *raw_out = raw;
  return (void*)aligned;
}

static void
worker(void *a1, void *a2)
{
  int tid   = (int)(uint)a1;
  int loops = (int)(uint)a2;

  printf(1, "[T%d] start; loops=%d\n", tid, loops);
  for(int i = 0; i < loops; i++){
    lock_acquire(&lk);
    int before = counter;
    counter = before + 1;
    lock_release(&lk);
  }
  printf(1, "[T%d] done\n", tid);
}

int
main(int argc, char *argv[])
{
  int n = 6;        // default #threads
  int loops = 2000; // default work per thread

  if(argc >= 2) n     = atoi(argv[1]);
  if(argc >= 3) loops = atoi(argv[2]);
  if(n < 1) n = 1;
  if(n > MAX_T) n = MAX_T;
  if(loops < 0) loops = 0;

  printf(1, "t_thread_stress: nthreads=%d, loops=%d\n", n, loops);

  lock_init(&lk);

  // create threads with page-aligned user stacks via raw clone()
  int created = 0;
  for(int i = 0; i < n; i++){
    void *raw = 0;
    void *stk = alloc_aligned_stack(&raw);
    if(stk == 0){
      printf(1, "clone skipped: stack alloc failed at i=%d\n", i);
      break;
    }
    smap[i].aligned = stk;
    smap[i].raw = raw;

    int pid = clone(worker, (void*)(uint)i, (void*)(uint)loops, stk);
    if(pid < 0){
      printf(1, "clone failed for i=%d\n", i);
      free(raw);
      smap[i].aligned = 0;
      smap[i].raw = 0;
      break;
    }
    created++;
  }

  // join threads via raw join(), which returns the aligned stack we passed
  for(int j = 0; j < created; j++){
    void *ustack = 0;
    int rc = join(&ustack);
    if(rc < 0){
      printf(1, "join failed at j=%d\n", j);
      continue;
    }
    // find & free the raw base corresponding to returned aligned stack
    int found = 0;
    for(int k = 0; k < created; k++){
      if(smap[k].aligned == ustack){
        free(smap[k].raw);
        smap[k].aligned = 0;
        smap[k].raw = 0;
        found = 1;
        break;
      }
    }
    if(!found){
      printf(1, "warn: could not match stack to free (ustack=%p)\n", ustack);
    }
  }

  int expect = created * loops;
  printf(1, "t_thread_stress: FINAL counter=%d (expect %d)\n", counter, expect);
  exit();
}
