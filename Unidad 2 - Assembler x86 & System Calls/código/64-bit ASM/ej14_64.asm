section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV RBP, RSP

    MOV RAX, 57
    SYSCALL         ;Returns PID in EAX
                    ;If it's 0, it's the child process
                    ;If it's negative, it failed
                    ;If it's positive, it's the parent process

    ;If we reached this line and EAX is NOT NEGATIVE, there are 2 processes running this program

    TEST RAX, RAX
    JZ .child_process
    JS .error       ;JS = Jump if Sign (= negative). It only makes the Jump if the negative Flag is up.

    ;If we reached this part of the code, it means that we are the parent process and nothing failed
.parent_process:
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message2
    MOV RDX, message2_len
    SYSCALL

    JMP .end


.child_process:
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message1
    MOV RDX, message1_len
    SYSCALL

    JMP .end

.error:
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message3
    MOV RDX, message3_len
    SYSCALL

    JMP .end

.end:
    ;Exit
    MOV RAX, 60
    MOV RDI, 0
    SYSCALL

section .data
    message1 DB "Soy el proceso hijo.", 10
    message1_len EQU $-message1

    message2 DB "Soy el proceso padre.", 10
    message2_len EQU $-message2

    message3 DB "Soy el proceso padre, pero algo salio mal", 10
    message3_len EQU $-message3

section .bss
    placeholder RESB 32