section .text

GLOBAL _start
EXTERN factorial
EXTERN num2str

_start:

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message
    MOV EDX, message_len
    INT 80h

    PUSH 9
    CALL factorial
    ADD ESP, 4

    MOV EBX, placeholder
    PUSH EBX
    PUSH EAX
    CALL num2str
    ADD ESP, 8

    MOV EDX, EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, placeholder
    INT 80h

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    INT 80h

    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
    
    message DB "If the factorial function does indeed work, it'll return 362880", 10
    message_len EQU $-message

    newline DB 10

section .bss
    placeholder RESB 32