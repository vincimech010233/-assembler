section .text
global ask_guess

ask_guess:
    ; Reservar espacio para la entrada
    sub rsp, 4

    ; Leer entrada del usuario
    mov rax, 0          ; syscall number para sys_read
    mov rdi, 0          ; file descriptor (stdin)
    mov rsi, rsp        ; puntero al búfer
    mov rdx, 4          ; número de bytes a leer
    syscall

    ; Convertir ASCII a entero (restar '0')
    movzx rax, byte [rsp]  ; movzx para cero-llenar el registro
    sub al, '0'

    ; Limpiar la pila y retornar
    add rsp, 4
    ret

section .note.GNU-stack noalloc noexec nowrite progbits 
