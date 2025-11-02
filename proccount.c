#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void)
{
  int n = getprocs();
  printf(1, "procs=%d\n", n);
  exit();
}
