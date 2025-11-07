#ifndef UTHREAD_H
#define UTHREAD_H
#include "types.h"

// Thread API you call from user programs
int thread_create(void (*start_routine)(void*,void*), void *arg1, void *arg2);
int thread_join(void);

// Kernel thread syscalls we wrap:
int clone(void (*fn)(void*,void*), void *arg1, void *arg2, void *stack);
int join(void **stack);

#endif
