#include "types.h"
#include "stat.h"
#include "user.h"

#define MAX_LINE 256
#define MAX_KEYS 16


int contains(char *line, char *pattern) 
{
  int i, j;
  for(i = 0; line[i] != 0; i++){
    for(j = 0; pattern[j] != 0; j++){
      if(line[i + j] == 0) break;
      if(line[i + j] != pattern[j]) break;
    }
    if(pattern[j] == 0) return 1; 
  }
  return 0;
}

int main(int argc, char *argv[])
{
  if(argc < 3){
    printf(2, "Usage: search keyword1 keyword2 ... filename\n");
    exit();
  }

  int numKeys = argc - 2;
  char *filename = argv[argc-1];

  int fd = open(filename, 0);
  if(fd < 0){
    printf(2, "search: cannot open %s\n", filename);
    exit();
  }

  char line[MAX_LINE];
  int idx = 0;
  char c;
  int n;

  while((n = read(fd, &c, 1)) == 1){
    if(c != '\n' && idx < MAX_LINE - 1){
      line[idx++] = c;
    } else {
      line[idx] = 0;


      int ok = 1;
      for(int k = 1; k <= numKeys; k++){
        if(!contains(line, argv[k])){
          ok = 0;
          break;
        }
      }

      if(ok) 
        printf(1, "%s\n", line);

      idx = 0;
    }
  }

  close(fd);
  exit();
}
