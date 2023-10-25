section .text
global neutralize

; <-- void neutralize (const char *s1, const char *s2, char *s3);  -->
; s1 := rdi
; s2 := rsi
; s3 := rdx

neutralize:
    xor rcx, rcx   ; Inicializar el índice a 0

.loop:
    ; Cargar un carácter desde s1 y s2
    mov al, [rdi + rcx]  ; al = s1[rcx]
    mov bl, [rsi + rcx]  ; bl = s2[rcx]

    ; Comprobar si hemos llegado al final de las cadenas
    test al, al
    jz .end_loop
    test bl, bl
    jz .end_loop

    ; Comparar los caracteres y escribir en s3
    cmp al, bl
    je .same
    mov byte [rdx + rcx], '0'
    jmp .next
.same:
    mov [rdx + rcx], al

.next:
    ; Incrementar el índice y continuar
    inc rcx
    jmp .loop

.end_loop:
    ; Asegurarse de que la cadena de salida esté terminada por null
    mov byte [rdx + rcx], 0
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
