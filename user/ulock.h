#ifndef ULOCK_H
#define ULOCK_H
#include "types.h"

// simple user-space spin lock (test&set)
typedef struct { volatile uint locked; } lock_t;

void lock_init(lock_t *l);
void lock_acquire(lock_t *l);
void lock_release(lock_t *l);

#endif
