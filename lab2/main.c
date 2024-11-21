#include <stdio.h>

extern long long int fib(long long int n);

int main(){
	long long int n = 4;
	printf("Fibonacci 4 = %lld\n",fib(n));
	return 0;
}

