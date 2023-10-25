SECTION .text
global simple_multiplication

; Multiplies and returns the argument by 8 if the argument is even, else 9 if the argument is odd.
; arg0         = (int64_t) The argument to multiply in rdi
; return value = (int64_t) The result in rax
simple_multiplication:
    ; Mover el valor del argumento al registro rax
    mov rax, rdi
    
    ; Verificar si el número es par (bit más bajo es 0)
    test rdi, 1
    jnz .is_odd
    
.is_even:
    ; Multiplicar por 8
    shl rax, 3  ; Equivalente a rax *= 8
    jmp .end

.is_odd:
    ; Multiplicar por 9
    lea rax, [rdi + rdi*8]  ; Equivalente a rax = rdi * 9

.end:
    ; El resultado ya está en rax, simplemente retorne
    ret
