; num2str - Converts a positive integer to a string.
; Arguments:
;   RDI: Integer to convert
;   RSI: Pointer to the memory buffer where the null-terminated string will be stored

SECTION .text

GLOBAL num2str

num2str:
    PUSH RAX            ; Preserve the registers we are going to modify
    PUSH RCX
    PUSH RDX
    PUSH R8
    PUSH RSI

    MOV RAX, RDI        ; Move the number to convert into RAX (required for DIV)
    MOV R8, 10          ; Store our divisor (10) in R8
    XOR RCX, RCX        ; Initialize RCX to 0. We will use it as a counter for the length of the number.

.divide_loop:
    XOR RDX, RDX        ; 64-bit DIV divides RDX:RAX. We strictly must clear RDX.
    DIV R8              ; After the operation, RAX stores the quotient, RDX stores the remainder
    
    ADD RDX, 0x30       ; Add 0x30 to the remainder in order to make it a character
    PUSH RDX            ; Push the character onto the stack
    INC RCX             ; Add 1 to our digit counter
    
    TEST RAX, RAX       ; Check if the quotient has reached 0
    JNZ .divide_loop    ; If it is not zero, there are still numbers left

.write_loop:
    POP RDX             ; Pop the character from the top of the stack
    MOV BYTE [RSI], DL  ; Store the byte (DL is the lowest part of RDX) into memory
    INC RSI             ; Advance the memory pointer by 1 byte
    DEC RCX             ; Decrease the digit counter by 1
    JNZ .write_loop     ; If the counter hasn't reached 0, keep popping from the stack

.finish:
    MOV BYTE [RSI], 0   ; Add the null terminator (0x00) at the end of the string

    POP RSI             ; Restore all registers to their original state
    POP R8
    POP RDX
    POP RCX
    POP RAX
    
    RET                 ; Return from the function