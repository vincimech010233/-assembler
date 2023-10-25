section .data
    red_dot db 0xF0, 0x9F, 0x94, 0xB4, 0 ; Carácter Unicode para un punto rojo (U+1F534)

section .text
    global _start

_start:
    ; Escribir el punto rojo en la terminal
    mov rax, 1            ; Llamada al sistema para write
    mov rdi, 1            ; Descriptor de archivo para la salida estándar (STDOUT)
    mov rsi, red_dot      ; Puntero al mensaje (punto rojo)
    mov rdx, 4            ; Longitud del mensaje
    syscall

    ; Salir del programa
    mov rax, 60           ; Llamada al sistema para exit
    xor rdi, rdi          ; Código de salida 0 (éxito)
    syscall
