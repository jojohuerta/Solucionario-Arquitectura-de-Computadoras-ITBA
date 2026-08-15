SECTION .text
    GLOBAL _start
    EXTERN suma                 ; Declare the external function from ej4_32.asm

_start:
    MOV EAX, 4                  ; system call for write
    MOV EBX, 1                  ; STDOUT
    MOV ECX, test_msg          
    MOV EDX, test_msg_len
    INT 0x80                    ; Invoke system call in 32-bit

    ; Calling of the suma function
    PUSH 4                      ; Argument 1: The integer N (pushed onto the stack per cdecl)
    CALL suma                   ; Execute the external function
    ADD ESP, 4                  ; Clean the stack (1 argument of 4 bytes) 

    MOV EAX, 4                 
    MOV EBX, 1 
    MOV ECX, newline 
    MOV EDX, 1                  ; length of 1 byte
    INT 0x80                    ; Invoke system call in 32-bit

    MOV EAX, 1                  ; system call for exit (sys_exit)
    MOV EBX, 0                  ; exit code 0
    INT 0x80                    ; Invoke system call in 32-bit

SECTION .data
    test_msg DB "If the suma function works, it should print the number '10'", 10
    test_msg_len EQU $ - test_msg
    
    newline DB 10               ; Line Feed character

SECTION .bss
    buffer RESB 64