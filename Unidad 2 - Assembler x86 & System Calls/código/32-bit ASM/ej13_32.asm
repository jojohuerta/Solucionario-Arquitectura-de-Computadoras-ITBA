section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV EBP, ESP

    ; Printing of initial message
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message1
    MOV EDX, message1_len
    INT 80h

    MOV EAX, 20
    INT 80h         ;Returns PID in EAX

    MOV EBX, BUFFER
    PUSH EBX
    PUSH EAX
    CALL num2str
    ADD ESP, 8

    ;number print
    MOV EDX, EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, BUFFER
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
    message1 DB "PID de este proceso: "
    message1_len EQU $-message1

    newline DB 10

section .bss
    placeholder RESB 32
    BUFFER RESB 64