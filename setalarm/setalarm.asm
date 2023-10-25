section .text
global setalarm

; <--- bool setalarm(bool empl, bool vac) --->
; empl -> dil (parte baja de rdi)
; vac  -> sil (parte baja de rsi)
; Retorno -> al (parte baja de rax)

setalarm:
    xor al, al      ; Inicializar AL a 0 (false)

    test dil, dil   ; Si empl es false (0), salta a .end
    jz .end

    test sil, sil   ; Si vac es true (1), salta a .end
    jnz .end

    mov al, 1       ; empl es true y vac es false, retornar true (1)

.end:
    ret            ; Retorna el valor en al

section .note.GNU-stack noalloc noexec nowrite progbits