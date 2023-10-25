#include <stdio.h>

int main() {
    int a = 5, b = 10, resultado;

    asm ("addl %%ebx, %%eax;"  // Instrucción de ensamblador para sumar ebx y eax
         : "=a"(resultado)    // Salida: resultado se guarda en la variable "resultado"
         : "a"(a), "b"(b)     // Entradas: a se carga en eax, b se carga en ebx
        );

    printf("La suma de %d y %d es %d\n", a, b, resultado);
    return 0;
}
