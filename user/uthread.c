#include "types.h"
#include "stat.h"
#include "user.h"
#include "uthread.h"

#define PGSIZE 4096

int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2) {
  // allocate a user stack for the new thread
  void *stack = malloc(PGSIZE);
  if(stack == 0) return -1;

  // align to page boundary (defensive)
  if((uint)stack % PGSIZE) stack = (void*)(((uint)stack + PGSIZE) & ~(PGSIZE-1));

  int pid = clone(start_routine, arg1, arg2, stack);
  if(pid < 0) {
    free(stack);
    return -1;
  }
  return pid;
}

int thread_join(void) {
  void *stack;
  int pid = join(&stack);
  if(pid >= 0 && stack) free(stack);
  return pid;
}
