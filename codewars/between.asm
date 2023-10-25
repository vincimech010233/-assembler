section .text
global between

; void between(int a, int b, int *integers)
; a -> edi, b -> esi, *integers -> rdx
between:
    ; Guardar estado de los registros que vamos a modificar
    push rbx
    push rcx
    
    ; Inicializar rbx con el valor de a (edi) y rcx como el índice de la matriz (iniciando en 0)
    mov ebx, edi
    xor rcx, rcx

.loop:
    ; Comprobar si hemos terminado (a > b)
    cmp ebx, esi
    jg .end_loop

    ; Almacenar el valor actual de a (ebx) en la posición rcx del array integers
    mov [rdx + rcx*4], ebx

    ; Incrementar a (ebx) y el índice de la matriz (rcx)
    inc ebx
    inc rcx

    ; Repetir
    jmp .loop

.end_loop:
    ; Restaurar estado de los registros y regresar
    pop rcx
    pop rbx
    ret
