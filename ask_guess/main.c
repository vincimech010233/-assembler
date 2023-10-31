#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern int ask_guess();  // Declaramos la función de Assembly

int main() {
    srand(time(0));
    int random_number = (rand() % 10) + 1;
    int guess;

    printf("Adivina el número entre 1 y 10: ");
    fflush(stdout);  // Forzar la salida del búfer para mostrar el mensaje inmediatamente
    guess = ask_guess();  // Llamamos a la función de Assembly para obtener el número del usuario

    if (guess == random_number) {
        printf("¡Correcto! El número era %d.\n", random_number);
    } else {
        printf("Incorrecto. El número era %d.\n", random_number);
    }

    return 0;
}
