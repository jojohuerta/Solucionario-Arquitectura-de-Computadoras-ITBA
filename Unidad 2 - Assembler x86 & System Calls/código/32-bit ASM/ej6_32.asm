;factorial -
;Parameters:
;   (EBP + 8) 1st parameter - the number N of which we want to calculate the factorial
;Output: 
;   (EAX) the factorial of N

section .text

GLOBAL factorial

factorial:
    PUSH EBP
    MOV EBP, ESP

    PUSH EBX
    PUSH EDI
    PUSH ESI

    ;we take the parameters and store em on our safe registers
    MOV EDI, [EBP + 8]

    ;first we check if N is 0
    TEST EDI, EDI
    JNZ .factorial_not_zero

    ;Congratulations! If we reached this point it means that N is equal to zero
    ;This is the easy part : )

    MOV EAX, 1;
    JMP .finish

.factorial_not_zero:
    MOV EBX, EDI
    DEC EDI
    PUSH EDI
    CALL factorial
    ADD ESP, 4 ; We "clean" the stack

    ;Final calculations
    IMUL EAX, EBX

.finish:

    POP ESI
    POP EDI
    POP EBX

    MOV ESP, EBP
    POP EBP
    RET

section .data

section .bss
    placeholder RESB 32