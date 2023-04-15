#include <stdint.h> 
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <ctype.h>
#include <sys/utsname.h>

#define NUM_TIMES 10000

static inline unsigned long long ccnt_read (void)
{
	unsigned long long cc = 0;
	__asm__ volatile ("mrc p15, 0, %0, c9, c13, 0":"=r" ((long long)cc));
	return cc;
}

int main() {
	struct utsname buffer;
	errno = 0;
	if (uname(&buffer) != 0) {
	    perror("uname");
	    exit(EXIT_FAILURE);
	}

	printf("system name = %s\n", buffer.sysname);
	printf("node name   = %s\n", buffer.nodename);
	printf("release     = %s\n", buffer.release);
	printf("version     = %s\n", buffer.version);
	printf("machine     = %s\n", buffer.machine);

	unsigned long long tsc;
	unsigned int pid;
	double t_libc;

	tsc = ccnt_read();
	for(int i = 0; i < NUM_TIMES; i++){
	  pid =getpid();
	} 
	t_libc = (double) (ccnt_read() - tsc) /NUM_TIMES;

	printf("Cyle average count on libc getpid :  %f \n", t_libc);
	int incre_value = 0;
	tsc = ccnt_read();
	for(int i = 0; i < NUM_TIMES; i++){
	 incre_value++; 
	} 
	doube average_count = (double) (ccnt_read() - tsc) /NUM_TIMES;

	printf("Cyle average count on post increment:  %f \n", average_count);
}
