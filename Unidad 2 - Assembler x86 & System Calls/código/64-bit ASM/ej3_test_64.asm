SECTION .text
    GLOBAL _start
    EXTERN num2str              ; Declare the external function from ej3_64.asm

_start:
    MOV RAX, 1                  ; system call for write
    MOV RDI, 1                  ; file descriptor 1 is STDOUT
    MOV RSI, test_msg           ; address of the message to output
    MOV RDX, test_msg_len       ; number of bytes to print
    SYSCALL

    ; Calling of the num2str function
    MOV RDI, 532199             ; Argument 1: The integer to convert
    MOV RSI, buffer             ; Argument 2: Pointer to the destination buffer
    CALL num2str                ; Execute the external function and returns the string length in RAX

    MOV RDX, RAX                ; Move the string length (returned in RAX) into RDX for sys_write
    
    MOV RAX, 1                  ; system call for write (sys_write)
    MOV RDI, 1                  ; file descriptor 1 is STDOUT
    MOV RSI, buffer             ; address of our converted string
    SYSCALL

    MOV RAX, 1                 
    MOV RDI, 1 
    MOV RSI, newline 
    MOV RDX, 1                  ; length of 1 byte
    SYSCALL

    MOV RAX, 60                 ; system call for exit (sys_exit)
    MOV RDI, 0                  ; exit code 0
    SYSCALL

SECTION .data
    test_msg DB "If the num2str function works, it should print the number '532199'", 10
    test_msg_len EQU $ - test_msg
    
    newline DB 10               ; Line Feed character

SECTION .bss
    buffer RESB 64