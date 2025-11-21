// kthread_sbrk.c
// Test that a thread can call sbrk() and both threads
// see the same new memory (shared address space).

#include "types.h"
#include "stat.h"
#include "user.h"

#define PGSIZE 4096

char *global_ptr = 0;

// helper: one page-aligned stack
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

// Thread function:
// - calls sbrk() to get a page
// - writes a magic value into it
// - stores pointer in global_ptr
void
sbrk_thread(void *arg1, void *arg2)
{
  (void)arg1;
  (void)arg2;

  char *p = sbrk(PGSIZE);
  if (p == (char*)-1) {
    printf(1, "kthread_sbrk: sbrk in thread failed\n");
    exit();
  }

  global_ptr = p;
  global_ptr[0] = 123;
  global_ptr[PGSIZE - 1] = 77;

  // done
  exit();
}

int
main(int argc, char *argv[])
{
  printf(1, "kthread_sbrk: starting test\n");

  void *stack = alloc_stack();
  if (stack == 0) {
    printf(1, "kthread_sbrk: alloc_stack failed\n");
    exit();
  }

  int pid = clone(sbrk_thread, 0, 0, stack);
  if (pid < 0) {
    printf(1, "kthread_sbrk: clone failed\n");
    exit();
  }

  void *joined_stack;
  if (join(&joined_stack) < 0) {
    printf(1, "kthread_sbrk: join failed\n");
    exit();
  }

  // Now global_ptr should be valid and visible in the main thread
  if (global_ptr == 0) {
    printf(1, "kthread_sbrk: global_ptr is NULL (FAIL)\n");
    exit();
  }

  if (global_ptr[0] != 123 || global_ptr[PGSIZE - 1] != 77) {
    printf(1, "kthread_sbrk: memory contents wrong (%d, %d) (FAIL)\n",
           global_ptr[0], global_ptr[PGSIZE - 1]);
    exit();
  }

  printf(1, "kthread_sbrk: PASS\n");
  exit();
}
