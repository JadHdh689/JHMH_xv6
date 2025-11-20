#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

static void
make_outname(char *dst, int dstsz, char *base, int idx)
{
  int i = 0;


  while(i < dstsz - 1 && base[i]){
    dst[i] = base[i];
    i++;
  }


  if(i < dstsz - 1){
    dst[i++] = '_';
  }


  char tmp[16];
  int j = 0;
  if(idx == 0){
    tmp[j++] = '0';
  } else {
    while(idx > 0 && j < sizeof(tmp)){
      tmp[j++] = '0' + (idx % 10);
      idx /= 10;
    }
  }

  
  while(j > 0 && i < dstsz - 1){
    dst[i++] = tmp[--j];
  }

  dst[i] = 0;
}

int
main(int argc, char *argv[])
{
  if(argc != 3){
    printf(1, "Usage: split <file> <chunk_size>\n");
    exit();
  }

  char *filename = argv[1];
  int chunk_size = atoi(argv[2]);

  if(chunk_size <= 0){
    printf(1, "split: chunk_size must be > 0\n");
    exit();
  }

  int fd = open(filename, O_RDONLY);
  if(fd < 0){
    printf(1, "split: cannot open %s\n", filename);
    exit();
  }

  char buf;
  int count = 0;
  int chunk = 0;
  int outfd = -1;
  char outname[64];

   
  while(read(fd, &buf, 1) == 1){
    if(count == 0){
      
      make_outname(outname, sizeof(outname), filename, chunk);
      outfd = open(outname, O_CREATE | O_WRONLY);
      if(outfd < 0){
        printf(1, "split: cannot create %s\n", outname);
        close(fd);
        exit();
      }
    }

    
    if(write(outfd, &buf, 1) != 1){
      printf(1, "split: write error on %s\n", outname);
      close(fd);
      close(outfd);
      exit();
    }

    count++;


    if(count >= chunk_size){
      close(outfd);
      outfd = -1;
      chunk++;
      count = 0;
    }
  }

  if(outfd >= 0)
    close(outfd);
  close(fd);
  exit();
}
