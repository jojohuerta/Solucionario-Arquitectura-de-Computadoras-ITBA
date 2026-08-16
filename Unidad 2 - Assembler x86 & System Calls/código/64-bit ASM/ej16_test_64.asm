section .text

GLOBAL _start
EXTERN to_upper_case

_start:
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message1
    MOV RDX, message1_len
    SYSCALL

    MOV RAX, 0          ; sys_read
    MOV RDI, 0          ; STDIN 
    MOV RSI, BUFFER    
    MOV RDX, BUFFER_SIZE
    SYSCALL

    ; Insertion of Null terminated over the LF at the end of the string
    DEC RAX                             ; '\n' counts as a read character and is the last one.  
    MOV R8, RAX                         ; R8 now has the length of the written characters in the BUFFER
    MOV [BUFFER + R8], BYTE 0x00        ; We overwrite the '\n' with '\0' 

    ; Function to_upper_case
    MOV RDI, BUFFER                    
    CALL to_upper_case

    ; Printing of modified string
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, BUFFER
    MOV RDX, R8                         ; We use R8 which holds the length
    SYSCALL

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, newline
    MOV RDX, 1
    SYSCALL

    ;exit
    MOV RAX, 60
    MOV RDI, 0
    SYSCALL

section .data
    message1 DB "(64-bit) Ingrese texto para convertir en mayuscula. Como maximo puede ingresar 128 caracteres:", 10
    message1_len EQU $-message1

    newline DB 10

    BUFFER_SIZE EQU 128

section .bss
    ; 128 bytes + 1 extra byte for NULL terminated
    BUFFER RESB BUFFER_SIZE + 1 
    placeholder RESB 32