section .text

GLOBAL strlen

strlen:
    PUSH EBP
    MOV EBP, ESP

    PUSH EBX        ;We're going to use it to analyse the characters
    PUSH ECX        ;We're going to use it to iterate
    PUSH EDX        ;We're going to use it as a counter
    
    XOR EDX, EDX    ;LEN = 0
    MOV ECX, [EBP+8];ECX = string 
.loop:
    MOV BL, BYTE [ECX]
    TEST BL, BL
    JZ .end

    INC EDX
    INC ECX
    JMP .loop

.end:

    MOV EAX, EDX
    POP EDX
    POP ECX
    POP EBX

    MOV ESP, EBP    
    POP EBP
    RET

section .data

section .bss
    placeholder RESB 32