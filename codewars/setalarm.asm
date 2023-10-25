section .text
global setalarm

; <--- bool setalarm(bool empl, bool vac) --->
; empl -> dil (parte baja de rdi)
; vac  -> sil (parte baja de rsi)
; Retorno -> al (parte baja de rax)

setalarm:
    ; Inicializar AL a 0 (false)
    xor al, al

    ; Si empl es false (0), salta a .end
    test dil, dil
    jz .end

    ; Si vac es true (1), salta a .end
    test sil, sil
    jnz .end

    ; Si llegamos aquí, empl es true y vac es false.
    ; Por lo tanto, necesitamos configurar una alarma (return true).
    mov al, 1

.end:
    ; Retorna el valor en al
    ret
