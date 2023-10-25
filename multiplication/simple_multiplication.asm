SECTION .text
global simple_multiplication

; Multiplies and returns the argument by 8 if the argument is even, else 9 if the argument is odd.
; arg0         = (int64_t) The argument to multiply in rdi
; return value = (int64_t) The result in rax
simple_multiplication:
    mov rax, rdi
    test rdi, 1
    jnz .is_odd
    
.is_even:
    shl rax, 3
    jmp .end

.is_odd:
    lea rax, [rdi + rdi*8]

.end:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
