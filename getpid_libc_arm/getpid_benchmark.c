#include <stdio.h>
#include <stdint.h> 
#include <stdlib.h>
#include <unistd.h>


#define NUM_TIMES 10000


static inline unsigned long int ccnt_read (void)
{
  unsigned long int cc = 0;
  __asm__ volatile ("mrc p15, 0, %0, c9, c13, 0":"=r" ((long int)cc));
  return cc;
}

int main() {
  unsigned long int tsc,pid;
  double t_libc;

  tsc = ccnt_read();
  for(int i = 0; i < NUM_TIMES; i++){
    pid =getpid();
  } 
  t_libc = (double) (ccnt_read() - tsc) /NUM_TIMES;

  printf("Timing libc %f \n", t_libc);
  
}
