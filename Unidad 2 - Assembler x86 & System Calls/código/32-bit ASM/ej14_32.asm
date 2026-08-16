section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV EBP, ESP

    MOV EAX, 2
    INT 80h         ;Returns PID in EAX
                    ;If it's 0, it's the child process
                    ;If it's negative, it failed
                    ;If it's positive, it's the parent process

    ;If we reached this line and EAX is NOT NEGATIVE, there are 2 processes running this program

    TEST EAX, EAX
    JZ .child_process
    JS .error       ;JS = Jump if Sign (= negative). It only makes the Jump if the negative Flag is up.

    ;If we reached this part of the code, it means that we are the parent process and nothing failed
.parent_process:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message2
    MOV EDX, message2_len
    INT 80h

    JMP .end


.child_process:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message1
    MOV EDX, message1_len
    INT 80h

    JMP .end

.error:
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message3
    MOV EDX, message3_len
    INT 80h

    JMP .end

.end:
    ;Exit
    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
    message1 DB "Soy el proceso hijo.", 10
    message1_len EQU $-message1

    message2 DB "Soy el proceso padre.", 10
    message2_len EQU $-message2

    message3 DB "Soy el proceso padre, pero algo salio mal", 10
    message3_len EQU $-message3

section .bss
    placeholder RESB 32