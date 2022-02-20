#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>

int flag = 1;
void handler(int sig) {flag = 0;}

int main(void) {
  pid_t pid_enfant;
  int i;
  if (signal(SIGUSR1, handler) == SIG_ERR) {perror("signal"); exit(1);}
  if ((pid_enfant = fork()) == -1) {perror("fork"); exit(1);}
  if (pid_enfant == 0) {// l'enfant
    pid_t pid_parent = getppid();
    for (i = 1; i <= 20; i += 2) {
      printf("ping\n");
      kill(pid_parent, SIGUSR1);
      if (flag) {pause();} flag = 1;
    }
  } else {// le parent
    for (i = 2; i <= 20; i += 2) {
      if (flag) {pause();} flag = 1;
      printf("pong\n");
      kill(pid_enfant, SIGUSR1);
    }
  }
  return 0;
}
