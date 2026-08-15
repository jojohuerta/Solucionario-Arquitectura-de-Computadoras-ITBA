SECTION .text
    GLOBAL _start
    EXTERN suma              ; Declare the external function from ej4_64.asm

_start:
    MOV RAX, 1                  ; system call for write
    MOV RDI, 1                  ; STDOUT
    MOV RSI, test_msg          
    MOV RDX, test_msg_len
    SYSCALL

    ; Calling of the suma function
    MOV RDI, 5                  ; Argument 1: The integer N
    CALL suma                   ; Execute the external function

    MOV RAX, 1                 
    MOV RDI, 1 
    MOV RSI, newline 
    MOV RDX, 1                  ; length of 1 byte
    SYSCALL

    MOV RAX, 60                 ; system call for exit (sys_exit)
    MOV RDI, 0                  ; exit code 0
    SYSCALL

SECTION .data
    test_msg DB "If the suma function works, it should print the number '15'", 10
    test_msg_len EQU $ - test_msg
    
    newline DB 10               ; Line Feed character

SECTION .bss
    buffer RESB 64