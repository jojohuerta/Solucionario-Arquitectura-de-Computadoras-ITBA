;strlen - given a string, it determines its length
;Parameters:
;   RDI - Argument 1 - String that is going to be measured
;Returns: length of a string in RAX

section .text

GLOBAL strlen

strlen:
    PUSH RBP
    MOV RBP, RSP

    PUSH RBX        ;We're going to use it to analyse the characters
    PUSH RCX        ;We're going to use it to iterate
    PUSH RDX        ;We're going to use it as a counter
    
    XOR RDX, RDX    ;LEN = 0
    MOV RCX, RDI    ;RCX = string 
.loop:
    MOV BL, BYTE [RCX]
    TEST BL, BL
    JZ .end

    INC RDX
    INC RCX
    JMP .loop

.end:
    MOV RAX, RDX    ; Return value goes in RAX
    
    ; Restoration of registers
    POP RDX
    POP RCX
    POP RBX

    MOV RSP, RBP    
    POP RBP
    RET

section .data

section .bss
    placeholder RESB 32