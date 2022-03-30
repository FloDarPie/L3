#include <stdbool.h>
#include <stdio.h>


int fac (int n) {
  int res;
  res = 1;

  while (n > 1) {
    res = res * n;
    n = n - 1;
  }
  return(res) ;
}

/* Comment in, then compile with:
  gcc -o fac fac.c
*/

/* 
int main () {
  printf("%d\n", fac(5));
}
 */

