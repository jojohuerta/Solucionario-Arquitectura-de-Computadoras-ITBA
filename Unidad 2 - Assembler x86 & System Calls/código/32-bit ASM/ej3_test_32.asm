SECTION .text
    GLOBAL _start
    EXTERN num2str              ; Declare the external function from ej3_32.asm

_start:
    MOV EAX, 4                  ; system call for write in 32-bit
    MOV EBX, 1                  ; file descriptor 1 is STDOUT
    MOV ECX, test_msg           ; address of the message to output
    MOV EDX, test_msg_len       ; number of bytes to print
    INT 80H

    ; Calling of the num2str function
    MOV EDI, 252544             ; Argument 1: The integer to convert
    MOV ESI, buffer             ; Argument 2: Pointer to the destination buffer
    CALL num2str                ; Execute the external function and returns the string length in EAX


    MOV EDX, EAX                ; Move the string length (returned in EAX) into EDX for sys_write
    
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, buffer
    INT 80H


    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline 
    MOV EDX, 1                  ; length of 1 byte
    INT 80H

    MOV EAX, 1                  ; system call for exit (sys_exit in 32-bit)
    MOV EBX, 0                  ; exit code 0
    INT 80H

SECTION .data
    test_msg DB "If the num2str function works, it should print the number '252544'", 10
    test_msg_len EQU $ - test_msg
    
    newline DB 10               ; Line Feed character

SECTION .bss
    buffer RESB 64