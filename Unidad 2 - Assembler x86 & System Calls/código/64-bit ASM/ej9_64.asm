section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV RBP, RSP

    ; Bonus track: Advanced 16 RSP alignment
    ; Since we already saved the OS stack in RBP, we can safely round down RSP
    ;AND RSP, -16 ;<-- Stack alignment to 16 bytes before any CALL

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message
    MOV RDX, message_len
    SYSCALL

    ;printing of number of arguments
    MOV RDI, [RBP]
    MOV RSI, placeholder
    CALL num2str ;Returns in RAX the length of the string
    
    ;printing of the number of arguments
    MOV RDX, RAX
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, placeholder
    SYSCALL 

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, newline
    MOV RDX, 1
    SYSCALL
    
    ;Exit
    MOV RAX, 60
    MOV RDI, 0
    SYSCALL

section .data
    message DB "Number of arguments: "
    message_len EQU $-message

    newline DB 10

section .bss
    placeholder RESB 32