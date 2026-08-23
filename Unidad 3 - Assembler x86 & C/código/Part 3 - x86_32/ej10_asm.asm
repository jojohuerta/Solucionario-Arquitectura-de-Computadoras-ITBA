;Fibonacci - Returns the fibonacci value of a specified number  
;   Arguments:
;       1st Argument - Number to calculate its fibonacci value
;   Returns:
;       EAX - Fibonacci value of said number

section .text

GLOBAL fibonacci

fibonacci:
    PUSH EBP
    MOV EBP, ESP    ;Stack frame setup

    AND ESP, -16    ;Stack alignment

    PUSH EBX        ;Preservation of persistent registers
    PUSH ESI
    PUSH EDI

    MOV EBX, [EBP+8] ;EBX = N  
    
    ;First we test if it's lesser or equal to zero
    TEST EBX, EBX    ;We use TEST because it's what the compiler would do for optimization
    JLE .fibo0

    ;Then we test if it's equal to one
    CMP EBX, 1
    JE .fibo1

    ;If it's neither of them we calculate recursively the value
    MOV ESI, EBX
    DEC ESI
    PUSH ESI        ;Since it's our 4th push to the stack, it's aligned with 16
                    ;Alas, there's no need to realign the stack again.
    CALL fibonacci
    ADD ESP, 4      ;Restoration of the stack to state previous to call of function
    MOV ESI, EAX    ;We store the value of Fibonacci(N-1) in persistent register ESI

    MOV EDI, EBX
    SUB EDI, 2
    PUSH EDI        ;Again, it's our 4th push, so it's unnecesary to realign the stack
    CALL fibonacci

    ADD ESP, 4      ;Restoration of the stack to state previous to call of function
    MOV EDI, EAX    ;We store the value of Fibonacci(N-2) in persistent register EDI

    MOV EAX, ESI
    ADD EAX, EDI    ;EAX now haws ESI + EDI, which is Fibonacci(N-1) + Fibonacci(N-2)
    JMP .end

.fibo0:
    XOR EAX, EAX
    JMP .end

.fibo1:
    MOV EAX, 1
    JMP .end

.end: 
    POP EDI
    POP ESI
    POP EBX         ;Restoration of persistent registers

    MOV ESP, EBP    ;Stack frame teardown
    POP EBP
    RET

section .data

section .bss
    placeholder RESB 32