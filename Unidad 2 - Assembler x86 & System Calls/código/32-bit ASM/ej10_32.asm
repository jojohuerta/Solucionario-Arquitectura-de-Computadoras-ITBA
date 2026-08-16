section .text

GLOBAL _start
EXTERN num2str
EXTERN strlen

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
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message2
    MOV EDX, message2_len
    INT 80h

    ;We now start printing all the arguments

    MOV EDI, EBP        ; We're gonna use EDI to iterate
    ADD EDI, 4          ; There's ARGC in EBP

.loop:
    
    MOV ESI, [EDI]      ; ESI --> String of current argument 
    
    ;If it's null, we reached the end of arguments
    TEST ESI, ESI
    JZ .loop_end

    PUSH ESI
    CALL strlen     ; Returns in EAX the length of a string
    ADD ESP, 4

    ;Argument printing
    MOV EDX, EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    INT 80h

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    INT 80h

    ADD EDI, 4
    JMP .loop

.loop_end:
    
    ;Exit
    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
    message DB "Number of arguments:"
    message_len EQU $-message

    newline DB 10

    message2 DB "Arguments:", 10
    message2_len EQU $-message2

section .bss
    placeholder RESB 32