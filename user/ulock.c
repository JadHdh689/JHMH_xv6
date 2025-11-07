// user/ulock.c
#include "types.h"
#include "ulock.h"

// Simple user-space spinlock using GCC builtins.
// Works with your 32-bit toolchain and static linking.
void lock_init(lock_t *l) {
  l->locked = 0;
}

void lock_acquire(lock_t *l) {
  // spin until we acquire (returns previous value)
  while (__sync_lock_test_and_set(&l->locked, 1) != 0) ;
  // full barrier after acquiring
  __sync_synchronize();
}

void lock_release(lock_t *l) {
  // full barrier before releasing
  __sync_synchronize();
  __sync_lock_release(&l->locked);   // atomic store 0 with release semantics
}
