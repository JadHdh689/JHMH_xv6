#include "types.h"
#include "stat.h"
#include "user.h"

#define MAX_LINE 128


int readline(int fd, char *buf, int max) {
  int i = 0, n;
  char c;
  while (i + 1 < max) {
    n = read(fd, &c, 1);
    if (n < 1) break;
    buf[i++] = c;
    if (c == '\n') break;
  }
  buf[i] = '\0';
  return i;
}

int
main(int argc, char *argv[])
{
  if (argc != 3) {
    printf(1, "Usage: diff file1 file2\n");
    exit();
  }

  int fd1 = open(argv[1], 0);
  int fd2 = open(argv[2], 0);

  if (fd1 < 0 || fd2 < 0) {
    printf(1, "diff: cannot open files\n");
    if (fd1 >= 0) close(fd1);
    if (fd2 >= 0) close(fd2);
    exit();
  }

  char buf1[MAX_LINE], buf2[MAX_LINE];
  int line = 1, r1, r2;

  while (1) {
    r1 = readline(fd1, buf1, sizeof(buf1));
    r2 = readline(fd2, buf2, sizeof(buf2));

    if (r1 <= 0 && r2 <= 0)
      break;

    if (strcmp(buf1, buf2) != 0)
      printf(1, "Line %d differs:\n< %s> %s\n", line, buf1, buf2);

    line++;

    if (r1 <= 0 || r2 <= 0)
      break;
  }

  close(fd1);
  close(fd2);
  exit();
}
