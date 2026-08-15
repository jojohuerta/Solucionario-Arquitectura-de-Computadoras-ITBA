section .text

GLOBAL _start
EXTERN factorial
EXTERN num2str

_start:

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message
    MOV RDX, message_len
    SYSCALL

    MOV RDI, 6
    CALL factorial

    MOV RDI, RAX
    MOV RSI, placeholder
    CALL num2str

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

    MOV RAX, 60
    MOV RDI, 0
    SYSCALL 

section .data
    
    message DB "If the factorial function does indeed work, it'll return 720", 10
    message_len EQU $-message

    newline DB 10

section .bss
    placeholder RESB 32