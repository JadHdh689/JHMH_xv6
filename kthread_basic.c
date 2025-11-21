// kthread_basic.c
// Basic functionality test for clone() and join().
// - Creates NTHREADS threads.
// - Each thread increments its own slot in a shared array.
// - Main thread joins all of them and checks the results.

#include "types.h"
#include "stat.h"
#include "user.h"

#define NTHREADS 4
#define STACKSIZE 4096
#define PGSIZE 4096

int shared_array[NTHREADS];   // shared between all threads (same address space)

struct thread_info {
  void *stack;
  int pid;
};

// helper: allocate one page-aligned stack
void*
alloc_stack(void)
{
  void *mem = sbrk(2 * PGSIZE);
  if (mem == (void*)-1)
    return 0;

  uint addr = (uint)mem;
  addr = (addr + PGSIZE - 1) & ~(PGSIZE - 1);
  return (void*)addr;
}

// Thread start function:
// arg1 = (void*)tid (0..NTHREADS-1)
// arg2 = (void*)loops
void
worker(void *arg1, void *arg2)
{
  int tid   = (int)arg1;
  int loops = (int)arg2;
  int i;

  // Each thread updates a different element: no races
  for (i = 0; i < loops; i++) {
    shared_array[tid]++;

    // Give scheduler a chance to switch between threads
    if (i % 100 == 0)
      sleep(1);
  }

  // IMPORTANT: finish the thread with exit().
  // Returning from worker() is not safe.
  exit();
}

int
main(int argc, char *argv[])
{
  int i;
  int loops = 1000;
  struct thread_info threads[NTHREADS];

  printf(1, "kthread_basic: starting %d threads\n", NTHREADS);

  // init shared array
  for (i = 0; i < NTHREADS; i++)
    shared_array[i] = 0;

  // Create threads
  for (i = 0; i < NTHREADS; i++) {
    void *stack = alloc_stack();
    if (stack == 0) {
      printf(1, "kthread_basic: alloc_stack() failed for thread %d\n", i);
      exit();
    }

    int pid = clone(worker, (void*)i, (void*)loops, stack);
    if (pid < 0) {
      printf(1, "kthread_basic: clone failed for thread %d\n", i);
      exit();
    }

    threads[i].stack = stack;
    threads[i].pid   = pid;
    // printf(1, "kthread_basic: created thread %d (pid %d)\n", i, pid);
  }

  // Join all threads
  for (i = 0; i < NTHREADS; i++) {
    void *joined_stack;
    int pid = join(&joined_stack);
    if (pid < 0) {
      printf(1, "kthread_basic: join failed (returned %d)\n", pid);
      exit();
    }

    // find which thread this was (optional, just to show stack is returned)
    int j;
    for (j = 0; j < NTHREADS; j++) {
      if (threads[j].stack == joined_stack) {
        // in a nicer world we might free() this stack, but we used sbrk().
        // It's OK to just ignore it for this test.
        threads[j].stack = 0;
        break;
      }
    }
    // printf(1, "kthread_basic: joined thread pid %d\n", pid);
  }

  // Check results
  int ok = 1;
  for (i = 0; i < NTHREADS; i++) {
    if (shared_array[i] != loops) {
      printf(1, "kthread_basic: shared_array[%d] = %d (expected %d)\n",
             i, shared_array[i], loops);
      ok = 0;
    }
  }

  if (ok)
    printf(1, "kthread_basic: PASS\n");
  else
    printf(1, "kthread_basic: FAIL\n");

  exit();
}
