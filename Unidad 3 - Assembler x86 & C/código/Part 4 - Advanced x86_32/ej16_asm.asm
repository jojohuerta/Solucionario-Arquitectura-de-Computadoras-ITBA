;checkLong: calculates the difference between the supposed strlen and the actual strlen
;   Arguments:
;       [EBP+8]  - 1st Argument - String
;       [EBP+12] - 2nd Argument - Expected length of said string
;   Returns:
;       EAX: The difference between the supposed length of the string and the real one
;               In case that they are equal, it returns 0
;               In case that the calculated value is greater than the expected length, it returns the positive difference
;               In case that the calculated value is lesser than the expected length, it returns the negative difference

section .text
GLOBAL checkLong
GLOBAL msg

checkLong:
    PUSH EBP
    MOV EBP, ESP
    AND ESP, -16

    PUSH EBX
    PUSH ESI

    MOV ESI, [EBP+8] ; ESI = pointer to vector start
    XOR EAX, EAX     ; EAX = 0 = length counter

.loop:
    CMP BYTE [ESI], 0 
    JE .end_loop
    INC EAX           ; length++
    INC ESI           ; Next char
    JMP .loop

.end_loop:
    ; ESI points to the byte '0'
    ; If we make ESI+1, we will read the value that's exactly after the end of the string.
    MOVZX EBX, BYTE [ESI+1] ; EBX = value next to the end of the string
    
    SUB EAX, [EBP+12]

    POP ESI
    POP EBX

    MOV ESP, EBP
    POP EBP
    RET

section .data
    msg: db "Hola Mundo", 0
    len: db 10