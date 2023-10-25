section .text
global make_negative

; Función para cambiar el signo de un número
make_negative:
    test rdi, rdi ; Comprueba si el número es no negativo (>= 0)
    js .already_negative ; Si el número es negativo, salta a .already_negative
    neg rdi ; Si el número es no negativo, cambia el signo
.already_negative:
    mov rax, rdi ; Retorna el resultado en rax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
