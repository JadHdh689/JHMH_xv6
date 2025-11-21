// kthread_join_empty.c
// Simple test: join() with no threads should return -1.

#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  void *stack;

  printf(1, "kthread_join_empty: calling join() with no threads\n");
  int pid = join(&stack);

  if (pid == -1) {
    printf(1, "kthread_join_empty: PASS (join returned -1 as expected)\n");
  } else {
    printf(1, "kthread_join_empty: FAIL (join returned %d, expected -1)\n", pid);
  }

  exit();
}
