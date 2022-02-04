#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
	int main() {
		pid_t pid_child;

	printf("Bonjour\n");
	pid_child = fork();
	if (pid_child == -1) {perror("fork() impossible"); exit(1);}
	if (pid_child == 0) {
		sleep(1);
		printf("... je suis le processus enfant\n");
	} else {
		printf("... je suis le processus parent\n");
	}
	return 0;
}
