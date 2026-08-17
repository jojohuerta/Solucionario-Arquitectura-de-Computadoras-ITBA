;puts - given a string, it prints it and then prints a newline (LF)
;Parameters:
;   EBP + 8 - Argument 1 - String that is going to be printed
;Returns: a positive, in this implementation, what returned the strlen function

section .text

EXTERN strlen
GLOBAL puts

puts:
    ;Stack frame set-up
    PUSH EBP
    MOV EBP, ESP

    AND ESP, -16    ; Align stack to 16 bytes
    
    PUSH EBX        ;EBX preservation (Callee saved)
    
    MOV EBX, [EBP+8]
    PUSH EBX
    CALL strlen
    ADD ESP, 4

    PUSH EAX    ;We preserve what strlen returned

    MOV EDX, EAX
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, [EBP+8]
    INT 80h

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    INT 80h

    POP EAX     ;We pop the original value back in order to return it

    POP EBX

    ;Stack frame cleaning
    MOV ESP, EBP    
    POP EBP
    RET

section .data
    newline DB 10

section .bss
    placeholder RESB 32