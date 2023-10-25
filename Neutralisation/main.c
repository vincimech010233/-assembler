#include <stdio.h>
#include <string.h>

// Declaración de la función externa
extern void neutralize(const char *s1, const char *s2, char *s3);

int main() {
    const char *s1 = "--++--";
    const char *s2 = "++--++";
    char s3[strlen(s1) + 1]; // +1 para el carácter null al final

    // Llamar a la función en ensamblador
    neutralize(s1, s2, s3);

    // Imprimir el resultado
    printf("Resultado: %s\n", s3); // Resultado: 000000

    return 0;
}
