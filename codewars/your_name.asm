section .data
    text1 db "What is your name? ", 0  ; Definimos la cadena de texto de la pregunta con un carácter nulo al final
    text2 db "Hello, "

section .bss
    name resb 16  ; Reservamos 16 bytes en memoria para almacenar el nombre del usuario

section .text
    global _start

_start:
    call _printText1   ; Llamamos a la función para imprimir text1
    call _getName      ; Llamamos a la función para obtener el nombre del usuario
    call _printText2   ; Llamamos a la función para imprimir text2
    call _printName    ; Llamamos a la función para imprimir el nombre del usuario

    ; Terminamos el programa
    mov rax, 60         ; Código de syscall para salir
    xor rdi, rdi        ; Establecemos el código de retorno en 0
    syscall

_getName:
    ; Lee hasta 15 caracteres (16 bytes) como máximo
    mov rax, 0          ; syscall para leer (número 0)
    mov rdi, 0          ; Descriptor de archivo estándar de entrada (stdin)
    mov rsi, name       ; Puntero al buffer (donde se almacena el nombre)
    mov rdx, 15         ; Longitud máxima del nombre
    syscall
    ret

_printText1:
    mov rax, 1          ; syscall para escribir (número 1)
    mov rdi, 1          ; Descriptor de archivo estándar de salida (stdout)
    mov rsi, text1      ; Puntero a la cadena text1
    mov rdx, 19         ; Longitud de text1
    syscall
    ret

_printText2:
    mov rax, 1          ; syscall para escribir (número 1)
    mov rdi, 1          ; Descriptor de archivo estándar de salida (stdout)
    mov rsi, text2      ; Puntero a la cadena text2
    mov rdx, 7          ; Longitud de text2
    syscall
    ret

_printName:
    mov rax, 1          ; syscall para escribir (número 1)
    mov rdi, 1          ; Descriptor de archivo estándar de salida (stdout)
    mov rsi, name       ; Puntero al nombre del usuario
    mov rdx, 15         ; Longitud máxima del nombre
    syscall
    ret