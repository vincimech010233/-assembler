section .data
    hello db 'Hello, World!', 0

section .text
    global _start

_start:
    ; Escribir "Hello, World!" en la salida estándar (stdout)
    mov rax, 1             ; Número de llamada al sistema para sys_write (1)
    mov rdi, 1             ; Descriptor de archivo para stdout (1)
    mov rsi, hello         ; Puntero al búfer de datos (dirección de la cadena)
    mov rdx, 13            ; Longitud de la cadena
    syscall                ; Realizar llamada al sistema

    ; Salir del programa
    mov rax, 60            ; Número de llamada al sistema para sys_exit (60)
    xor rdi, rdi           ; Código de salida (0)
    syscall                ; Realizar llamada al sistema
