section .text

GLOBAL _start
EXTERN menor
EXTERN num2str

_start:

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message
    MOV RDX, message_len
    SYSCALL

    MOV RDI, array
    MOV RSI, array_len
    CALL menor

    MOV RDI, RAX            
    MOV RSI, placeholder    
    CALL num2str            ;We want to obtain a string with the number. Also, in RAX the length of said string is returned.

    ;Printing of the number
    MOV RDX, RAX            
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, placeholder
    SYSCALL

    ; Printing of a newline (LF)
    MOV RAX, 1      
    MOV RDI, 1
    MOV RSI, newline
    MOV RDX, 1
    SYSCALL

    MOV RAX, 60     ; Exit syscall
    MOV RDI, 0
    SYSCALL 

section .data
    
    message DB "If the menor function does indeed work, it'll return 42 (the answer to life, the universe, and everything)", 10
    message_len EQU $-message

    newline DB 10

    array DW 67, 69, 99, 124, 42, 88, 77, 66, 55, 44
    array_len EQU 10

section .bss
    placeholder RESB 32