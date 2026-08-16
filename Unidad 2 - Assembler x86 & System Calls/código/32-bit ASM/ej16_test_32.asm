section .text

GLOBAL _start
EXTERN to_upper_case

_start:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message1
    MOV EDX, message1_len
    INT 80h

    MOV EAX, 3 ;sys_read
    MOV EBX, 0 ;STDIN 
    MOV ECX, BUFFER    
    MOV EDX, BUFFER_SIZE
    INT 80h

    ;Insertion of Null terminated over the LF at the end of the string
    DEC EAX                             ; '\n' counts as a read character and is the last one.  
    MOV EDI, EAX                        ;EDI now has the length of the written characters in the BUFFER
    MOV [BUFFER + EDI + 1], BYTE 0x00   ;We overwrite the '\n' with '\0'

    ;Function to_upper_case
    MOV EAX, BUFFER
    PUSH EAX
    CALL to_upper_case
    ADD ESP, 4

    ;Printing of modified string
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, BUFFER
    MOV EDX, EDI
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
    message1 DB "Ingrese texto para convertir en mayuscula. Como maximo puede ingresar 128 caracteres", 10
    message1_len EQU $-message1

    newline DB 10

    BUFFER_SIZE EQU 128

section .bss
    ; 128 bytes + 1 extra byte for NULL terminated
    BUFFER RESB BUFFER_SIZE + 1 
    placeholder RESB 32