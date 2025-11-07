#include "types.h"
#include "stat.h"
#include "user.h"
#include "ulock.h"    // <-- gives lock_t + lock_*()
#include "uthread.h"  // <-- gives thread_create/join

static lock_t lk;
static int counter = 0;

void worker(void *a1, void *a2) {
  (void)a1; (void)a2;
  lock_acquire(&lk);
  int tmp = counter;
  // simulate work
  for(volatile int i=0;i<100000;i++);
  counter = tmp + 1;
  lock_release(&lk);
  exit();
}

int
main(int argc, char *argv[]) {
  (void)argc; (void)argv;

  lock_init(&lk);
  int t1 = thread_create(worker, 0, 0);
  int t2 = thread_create(worker, 0, 0);
  if(t1 < 0 || t2 < 0){
    printf(1, "thread_create failed\n");
    exit();
  }

  thread_join();
  thread_join();

  printf(1, "counter=%d (expect 2)\n", counter);
  exit();
}
