section .text

GLOBAL _start
EXTERN menor
EXTERN num2str

_start:

    ;printing of message
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message
    MOV EDX, message_len
    INT 80h

    PUSH array_len
    PUSH array
    CALL menor
    ADD ESP, 8

    ;We want to have Array[EAX]
    MOV EDX, [array + 4 * EAX]

    ;And pass it to the num2str function
    MOV EBX, placeholder
    PUSH EBX
    PUSH EDX
    CALL num2str
    ADD ESP, 8

    ;Printing of the minimum number of the array
    MOV EDX, EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, placeholder
    INT 80h

    ;Printing of newline (LF)
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    INT 80h

    ;EXIT
    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
    
    message DB "If the menor function does indeed work, it'll return 42 (the answer to life, the universe, and everything)", 10
    message_len EQU $-message

    newline DB 10

    array DD 67, 69, 99, 124, 42, 88, 77, 66, 55, 44 ;WARNING: DD is Define DoubleWord (4 bytes). DW is DefineWord (2 bytes).
    array_len EQU 10


section .bss
    placeholder RESB 32