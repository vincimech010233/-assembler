#include <stdio.h> 
#include <stdlib.h>

// Declaración de la función ensamblador
extern long make_negative(long number); 

int main(int argc, char *argv[]) {
    // Verifica si se proporciona el número correcto de argumentos
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number>\n", argv[0]); 
        return 1; // Devuelve 1 para indicar un error
    }

    // Convierte el argumento de línea de comandos en un número largo
    long num = atol(argv[1]); 

    // Llama a la función ensamblador para cambiar el signo del número
    long result = make_negative(num); 

    // Imprime el resultado
    printf("%ld\n", result); 

    return 0; // Devuelve 0 para indicar éxito
}
