section .data
even_msg db "Even", 0     ; Cadena "Even" (par)
odd_msg  db "Odd", 0      ; Cadena "Odd" (impar)

section .text
global even_or_odd
; input: edi = number
; output: rax (a pointer to a statically allocated C-string, will not be freed by tests)
; callee saved registers: rbx, rsp, rbp, r12-r15
even_or_odd:
    ; Verificar si el número es par o impar
    test edi, 1          ; Comprobar el bit menos significativo
    jz .is_even           ; Si es cero (par), salta a la etiqueta .is_even

.is_odd:
    ; El número es impar, cargar la dirección de la cadena "Odd"
    mov rax, odd_msg
    ret

.is_even:
    ; El número es par, cargar la dirección de la cadena "Even"
    mov rax, even_msg
    ret
