#include <stdio.h>

extern char* uglify_word(char*);

int main() {
    char myString[] = "Hello World";
    printf("Before: %s\n", myString);

    char* modifiedString = uglify_word(myString);
    printf("After: %s\n", modifiedString);

    return 0;
}
