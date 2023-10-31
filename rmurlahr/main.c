/*
Complete the function/method so that it returns the url with anything after the anchor (#) removed.
*/

#include <stdio.h>

// Declaration of the assembly function
extern void rmurlahr(char *);

int main() {
    char url1[] = "www.codewars.com#about";
    char url2[] = "www.codewars.com?page=1";

    // Call to the assembly function for url1
    rmurlahr(url1);
    printf("URL1: %s\n", url1);

    // Call to the assembly function for url2
    rmurlahr(url2);
    printf("URL2: %s\n", url2);

    return 0;
}
