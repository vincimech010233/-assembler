#include <stdio.h>

extern void encode(char* str);
extern void decode(char* str);

int main() {
    char str1[] = "hello";
    encode(str1);
    printf("Encoded: %s\n", str1);  // Output: h2ll4

    char str2[] = "h3 th2r2";
    decode(str2);
    printf("Decoded: %s\n", str2);  // Output: hi there

    return 0;
}
