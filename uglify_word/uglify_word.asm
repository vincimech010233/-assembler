section .text
    global uglify_word

uglify_word:
    ; rdi contains address of the string
    ; Initialize flag to 1
    xor r8d, r8d
    inc r8d

    ; point rsi to the string
    mov rsi, rdi

.loop:
    ; Load byte from string into al
    movzx rax, byte [rsi]

    ; Test for end of string
    test al, al
    jz .end

    ; Check if it's an alphabet character
    cmp al, 'a'
    jb .check_upper
    cmp al, 'z'
    ja .not_alpha

    ; If flag is 1, convert to upper case
    test r8d, 1
    jz .convert_to_lower
    sub al, 0x20
    jmp .update_char

.check_upper:
    cmp al, 'A'
    jb .not_alpha
    cmp al, 'Z'
    ja .not_alpha

.convert_to_lower:
    ; If flag is 1, convert to lower case
    test r8d, 1
    jz .convert_to_upper
    add al, 0x20
    jmp .update_char

.convert_to_upper:
    sub al, 0x20

.update_char:
    ; update the char in string
    mov [rsi], al

    ; toggle the flag
    not r8d

    ; move to next char
    inc rsi
    jmp .loop

.not_alpha:
    ; set flag to 1
    mov r8d, 1

    ; move to next char
    inc rsi
    jmp .loop

.end:
    ; return the modified string
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite progbits