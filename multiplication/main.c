#include <stdio.h>

extern long long int simple_multiplication(long long int n);  // Declara la función de ensamblador

int main() {
    long long int n = 5;
    long long int result = simple_multiplication(n);
    long long int m = 6;
    long long int result2 = simple_multiplication(m);
    printf("Result: %lld\n", result);
    printf("Result2: %lld\n", result2);
    return 0;
}
