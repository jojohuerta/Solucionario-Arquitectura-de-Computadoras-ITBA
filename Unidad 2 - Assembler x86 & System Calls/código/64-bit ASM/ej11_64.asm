section .text

GLOBAL _start
EXTERN strlen

_start:
    MOV RBP, RSP

    ; Skipping all arguments until the first NULL
    MOV R12, RBP        ; We use R12 as our iterator pointer
    ADD R12, 8          ; skip argc

.skip_argv_loop:
    MOV R13, [R12]      ; R13 --> Pointer to the current argument string
    
    ; If it's null, we reached the end of arguments
    TEST R13, R13
    JZ .found_first_null

    ADD R12, 8          ; Advance to the next pointer
    JMP .skip_argv_loop

.found_first_null:
    
    ;The environment variables start exactly 8 bytes after this NULL.
    ADD R12, 8          

    ; Printing of all environment variables

.print_env_loop:
    MOV R13, [R12]      ; R13 --> Pointer to the current environment string
    
    ; If it's null, we reached the end of the environment variables
    TEST R13, R13
    JZ .exit

    MOV RDI, R13
    CALL strlen         ; Returns in RAX the length of the string

    ; Printing of the environment string
    MOV RDX, RAX        ; Length returned by strlen
    MOV RAX, 1          ; sys_write
    MOV RDI, 1          ; stdout
    MOV RSI, R13        ; Pointer to the string
    SYSCALL

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, newline
    MOV RDX, 1
    SYSCALL

    ;Advancing to the next pointer and repeat
    ADD R12, 8
    JMP .print_env_loop

.exit:
    ; Exit
    MOV RAX, 60
    MOV RDI, 0
    SYSCALL

section .data
    newline DB 10