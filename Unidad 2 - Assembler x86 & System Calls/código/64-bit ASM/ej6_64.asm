;factorial -
;Parameters:
;   (RDI) 1st parameter - the number N of which we want to calculate the factorial
;Output: 
;   (RAX) the factorial of N

section .text

GLOBAL factorial
EXTERN num2str

factorial:
    PUSH RBP
    MOV RBP, RSP

    ; Save registers that we will use and modify
    PUSH RBX
    PUSH R12
    PUSH R13

    MOV R12, RDI    ;Save N in R12
    CMP R12, 0      ;Check if N is 0
    JNE .factorial_not_zero 

    ;If we reach this point, it means that N is 0, so we return 1 as the factorial of 0 is 1
    MOV RAX, 1
    JMP .finish

.factorial_not_zero:
    MOV RDI, R12 ;We copy N to RDI
    DEC RDI

    SUB RSP, 8 ;(4 pushes + original call --> we need to sub 8)

    CALL factorial
    ADD RSP, 8
    ;R12 = Original N
    ;RAX = factorial(N-1)

    IMUL RAX, R12 ; RAX = RAX * R12

.finish:
    ;Restore registers
    POP R13
    POP R12
    POP RBX

    MOV RSP, RBP
    POP RBP
    RET

section .data

section .bss
    placeholder resb 32