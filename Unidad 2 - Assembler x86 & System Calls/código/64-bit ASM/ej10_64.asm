section .text

GLOBAL _start
EXTERN num2str
EXTERN strlen

_start:
    MOV RBP, RSP

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message
    MOV RDX, message_len
    SYSCALL

    ;printing of number of arguments
    MOV RDI, [RBP]
    MOV RSI, placeholder
    CALL num2str ;Returns in RAX the length of the string
    
    ;printing of the number of arguments
    MOV RDX, RAX
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, placeholder
    SYSCALL 

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, newline
    MOV RDX, 1
    SYSCALL
    
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message2
    MOV RDX, message2_len
    SYSCALL

    ;We now start printing all the arguments

    MOV R12, RBP        ; We're gonna use R12 to iterate
    ADD R12, 8          ; There's ARGC in EBP

.loop:
    
    MOV R13, [R12]      ; R13 --> String of current argument 
    
    ;If it's null, we reached the end of arguments
    TEST R13, R13
    JZ .loop_end

    MOV RDI, R13
    CALL strlen     ; Returns in EAX the length of a string

    ;Argument printing
    MOV RDX, RAX
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, R13
    SYSCALL

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, newline
    MOV RDX, 1
    SYSCALL

    ADD R12, 8
    JMP .loop

.loop_end:

    ;Exit
    MOV RAX, 60
    MOV RDI, 0
    SYSCALL

section .data
    message DB "Number of arguments: "
    message_len EQU $-message

    newline DB 10
    
    message2 DB "Arguments:", 10
    message2_len EQU $-message2


section .bss
    placeholder RESB 32