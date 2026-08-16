section .text

GLOBAL _start
EXTERN strlen

_start:
    MOV EBP, ESP

    ; Skipping all arguments until the first NULL
    MOV ESI, EBP        ; We use ESI as our iterator pointer
    ADD ESI, 4          ; skip argc

.skip_argv_loop:
    MOV EDI, [ESI]      ; EDI --> Pointer to the current argument string
    
    ; If it's null, we reached the end of arguments
    TEST EDI, EDI
    JZ .found_first_null

    ADD ESI, 4          ; Advance to the next pointer
    JMP .skip_argv_loop

.found_first_null:
    
    ;The environment variables start exactly 4 bytes after this NULL.
    ADD ESI, 4          

    ; Printing of all environment variables

.print_env_loop:
    MOV EDI, [ESI]      ; EDI --> Pointer to the current environment string
    
    ; If it's null, we reached the end of the environment variables
    TEST EDI, EDI
    JZ .exit

    PUSH EDI
    CALL strlen         ; Returns in RAX the length of the string

    ; Printing of the environment string
    MOV EDX, EAX        ; Length returned by strlen
    MOV EAX, 4          ; sys_write
    MOV EBX, 1          ; stdout
    MOV ECX, EDI        ; Pointer to the string
    INT 80h

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    INT 80h

    ;Advancing to the next pointer and repeat
    ADD ESI, 4
    JMP .print_env_loop

.exit:
    ; Exit
    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
    newline DB 10