section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV RBP, RSP

    ; Printing of initial message
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message1
    MOV RDX, message1_len
    SYSCALL

    MOV RAX, 39
    SYSCALL         ;Returns PID in RAX

    MOV RSI, BUFFER
    MOV RDI, RAX
    CALL num2str

    ;number print
    MOV RDX, RAX
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, BUFFER
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
    message1 DB "(64-bit) PID de este proceso: "
    message1_len EQU $-message1

    newline DB 10

section .bss
    placeholder RESB 32
    BUFFER RESB 64