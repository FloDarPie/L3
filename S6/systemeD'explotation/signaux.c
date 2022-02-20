#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>

void traite_signal(int signum) {
    printf("Reception du signal %d\n", signum);
}

int main () {
    int i;
    int signaux[] = {SIGINT, SIGSTOP, SIGALRM, SIGTSTP};
    for (i=0; i < sizeof(signaux)/sizeof(int); i++) {
        if (signal(signaux[i], &traite_signal) == SIG_ERR) {
            printf("%2d: signal %2d non captable !\n", i, signaux[i]);
        } else {
            printf("%2d: signal %2d ok.\n", i, signaux[i]);
        }
    }
    printf("PID: %d\n", getpid());
    while (1) {
        if (pause() == -1) {perror("fin de pause");}
    }
}



//gcc -Wall -o name file
