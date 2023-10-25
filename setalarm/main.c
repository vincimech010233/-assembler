#include <stdio.h>
#include <stdbool.h>

extern bool setalarm(bool employed, bool vacation);

int main() {
    bool result;

    result = setalarm(true, true);
    printf("Resultado 1: %d\n", result);

    result = setalarm(true, false);
    printf("Resultado 2: %d\n", result);

    result = setalarm(false, true);
    printf("Resultado 3: %d\n", result);

    result = setalarm(false, false);
    printf("Resultado 4: %d\n", result);

    return 0;
}
