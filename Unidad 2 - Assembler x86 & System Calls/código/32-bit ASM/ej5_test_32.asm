section .text

GLOBAL _start
EXTERN multiplos

_start:
    MOV EAX, 4                  ; system call for write
    MOV EBX, 1                  ; STDOUT
    MOV ECX, test_msg          
    MOV EDX, test_msg_len
    INT 80h

    ; Calling of the multiplos function
    PUSH 20                     ; Argument 2: K
    PUSH 3                      ; Argument 1: N
    CALL multiplos              ; Execute the external function
    ADD ESP, 8                  ; Clean up the stack after the function call

    MOV EAX, 1                  ; system call for exit (32 bit)
    MOV EBX, 0                  
    INT 80h

section .data
    test_msg DB "If the multiplos function works, it should print the numbers '3', '6', '9', '12', '15', '18' and '21'", 10
    test_msg_len EQU $ - test_msg
section .bss
    placeholder resb 32