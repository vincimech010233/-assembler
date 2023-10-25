#include <stdio.h>

// Declaración de la función externa
extern void between(int a, int b, int *integers);

int main() {
    int a = 1;
    int b = 4;
    int integers[b - a + 1]; // crear un array de tamaño (b - a + 1)

    // Llamar a la función en ensamblador
    between(a, b, integers);

    // Imprimir el resultado
    printf("Result: [");
    for (int i = 0; i < b - a + 1; ++i) {
        printf("%d", integers[i]);
        if (i < b - a) {
            printf(", ");
        }
    }
    printf("]\n");

    return 0;
}
