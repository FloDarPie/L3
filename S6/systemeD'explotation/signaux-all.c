#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>

void traite_signal(int signum) {
    printf("Reception du signal %d\n", signum);
}

int main () {
    int i;
    for (i=1; i < 65 ; i++) {
        if (signal(i, &traite_signal) == SIG_ERR) {
            printf("%2d: signal %2d non captable !\n", i, i);
        } else {
            printf("%2d: signal %2d ok.\n", i, i);
        }
    }
    printf("PID: %d\n", getpid());
    while (1) {
        if (pause() == -1) {perror("fin de pause");}
    }
}



//gcc -Wall -o name file
