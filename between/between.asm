section .text
global between

; void between(int a, int b, int *integers)
; a -> edi, b -> esi, *integers -> rdx
between:
    ; Inicializar rcx como índice para la matriz y ponerlo en cero
    xor rcx, rcx

.loop:
    ; Comprobar si a > b
    cmp edi, esi
    jg .end_loop

    ; Asignar a al array
    mov [rdx + rcx*4], edi ; *integers[rcx] = edi

    ; Incrementar a y el índice
    inc edi
    inc rcx

    ; Continuar con el bucle
    jmp .loop

.end_loop:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
