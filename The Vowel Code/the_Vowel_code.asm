section .text
global encode, decode

encode:
    mov rsi, rdi  ; Copia el puntero de la cadena a rsi
.encode_loop:
    mov al, byte [rsi]  ; Lee el carácter actual
    test al, al  ; Chequea si hemos llegado al final de la cadena
    jz .end_encode  ; Si es el fin de la cadena, termina
    ; Chequea cada vocal y reemplaza según corresponda
    cmp al, 'a'
    je .is_a
    cmp al, 'e'
    je .is_e
    cmp al, 'i'
    je .is_i
    cmp al, 'o'
    je .is_o
    cmp al, 'u'
    je .is_u
    jmp .next_char  ; Si no es una vocal, pasa al siguiente carácter
.is_a:
    mov byte [rsi], '1'
    jmp .next_char
.is_e:
    mov byte [rsi], '2'
    jmp .next_char
.is_i:
    mov byte [rsi], '3'
    jmp .next_char
.is_o:
    mov byte [rsi], '4'
    jmp .next_char
.is_u:
    mov byte [rsi], '5'
.next_char:
    inc rsi  ; Avanza al siguiente carácter
    jmp .encode_loop
.end_encode:
    ret

decode:
    mov rsi, rdi  ; Copia el puntero de la cadena a rsi
.decode_loop:
    mov al, byte [rsi]  ; Lee el carácter actual
    test al, al  ; Chequea si hemos llegado al fin de la cadena
    jz .end_decode  ; Si es el fin de la cadena, termina
    ; Chequea cada número y reemplaza según corresponda
    cmp al, '1'
    je .is_1
    cmp al, '2'
    je .is_2
    cmp al, '3'
    je .is_3
    cmp al, '4'
    je .is_4
    cmp al, '5'
    je .is_5
    jmp .next_char_decode  ; Si no es un número, pasa al siguiente carácter
.is_1:
    mov byte [rsi], 'a'
    jmp .next_char_decode
.is_2:
    mov byte [rsi], 'e'
    jmp .next_char_decode
.is_3:
    mov byte [rsi], 'i'
    jmp .next_char_decode
.is_4:
    mov byte [rsi], 'o'
    jmp .next_char_decode
.is_5:
    mov byte [rsi], 'u'
.next_char_decode:
    inc rsi  ; Avanza al siguiente carácter
    jmp .decode_loop
.end_decode:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits