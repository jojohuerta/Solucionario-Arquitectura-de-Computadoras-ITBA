section .text

GLOBAL _start
EXTERN multiplos

_start:
    MOV RAX, 1                  ; system call for write
    MOV RDI, 1                  ; STDOUT
    MOV RSI, test_msg          
    MOV RDX, test_msg_len
    SYSCALL

    ; Calling of the multiplos function
    MOV RDI, 3                  ; Argument 1: The integer N
    MOV RSI, 20                 ; Argument 2: The integer K
    CALL multiplos              ; Execute the external function

    MOV RAX, 60                 ; system call for exit
    MOV RDI, 0                  ; exit code 0
    SYSCALL

section .data
    test_msg DB "If the multiplos function works, it should print the numbers '3', '6', '9', '12', '15', '18'", 10
    test_msg_len EQU $ - test_msg

section .bss
    placeholder resb 32