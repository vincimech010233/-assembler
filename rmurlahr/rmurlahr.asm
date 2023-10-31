section .text                  ; Section containing executable code
global rmurlahr                ; Make rmurlahr accessible from other files

; Input: RDI contains the address of the source string
; Output: RAX will contain the address of the modified string
rmurlahr:
    mov rax, rdi               ; Initialize RAX with the source string address (RDI)
    
    loop_start:                ; Label for the start of the main loop
        mov al, [rdi]          ; Load a byte from the source string into AL (low part of RAX)
        
        test al, al            ; Perform an AND operation between AL and AL to update flags
        jz done                ; Jump to 'done' if AL is 0 (null terminator)
        
        cmp al, 0x23           ; Compare AL with 0x23 (ASCII for '#')
        je null_terminate      ; Jump to 'null_terminate' if '#' is found
        
        inc rdi                ; Increment RDI to point to the next character of the string
        jmp loop_start         ; Go back to the start of the loop
        
    null_terminate:            ; Label for null-termination action
        mov byte [rdi], 0      ; Place a 0 at the current position to null-terminate the string
        
    done:                      ; Label to indicate we are done
        ret                    ; Return to the calling code

section .note.GNU-stack noalloc noexec nowrite progbits 
; This section is used to specify stack attributes in ELF files
; noalloc: This section will not be allocated in the output file
; noexec: Mark the stack as non-executable
; nowrite: Mark the stack as read-only
; progbits: Contains program-defined information
