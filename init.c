// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char *argv[] = { "sh", 0 };

int
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr

 char username[32], password[32];

  while(1){
    printf(1, "Username: ");
    gets(username, sizeof(username));
    username[strlen(username)-1] = 0; // strip newline

    printf(1, "Password: ");
    gets(password, sizeof(password));
    password[strlen(password)-1] = 0;

    if(strcmp(username, "user") == 0 && strcmp(password, "1234") == 0){
      printf(1, "Login successful!\n");
      break; // exit login loop
    } else {
      printf(1, "Login failed. Try again.\n");
    }
  }

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
}
