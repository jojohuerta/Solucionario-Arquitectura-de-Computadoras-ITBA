section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV EBP, ESP

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message
    MOV EDX, message_len
    INT 80h

    ;printing of number of arguments
    MOV EBX, placeholder
    PUSH EBX
    PUSH DWORD [EBP]
    CALL num2str ;Returns in EAX the length of the string
    ADD ESP, 8 ;Cleaning of the Stack

    ;printing of the number of arguments
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
    
    ;Exit
    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
    message DB "Number of arguments:"
    message_len EQU $-message

    newline DB 10

section .bss
    placeholder RESB 32