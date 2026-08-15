; num2str - Converts a positive integer to a string.
; Arguments:
;   EDI: Integer to convert
;   ESI: Pointer to the memory buffer where the null-terminated string will be stored
; Returns:
;   EAX: Length of the converted string (excluding the null terminator)
;   ESI: Pointer to the memory buffer where the null-terminated string will be stored

SECTION .text

GLOBAL num2str

num2str:
    PUSH ECX            ; Preserve the registers we are going to modify
    PUSH EDX
    PUSH EBX            ; We use EBX as our divisor instead of R8
    PUSH ESI

    MOV EAX, EDI        ; Move the number to convert into EAX (required for 32-bit DIV)
    MOV EBX, 10         ; Store our divisor (10) in EBX
    XOR ECX, ECX        ; Initialize ECX to 0. We will use it as a counter for the length of the number.

.divide_loop:
    XOR EDX, EDX        ; 32-bit DIV divides EDX:EAX. We strictly must clear EDX.
    DIV EBX             ; After the operation, EAX stores the quotient, EDX stores the remainder
    
    ADD EDX, 0x30       ; Add 0x30 to the remainder in order to make it a character
    PUSH EDX            ; Push the character onto the stack
    INC ECX             ; Add 1 to our digit counter
    
    TEST EAX, EAX       ; Check if the quotient has reached 0
    JNZ .divide_loop    ; If it is not zero, there are still numbers left

    MOV EAX, ECX        ; Save the total string length into EAX before the write loop destroys ECX.

.write_loop:
    POP EDX             ; Pop the character from the top of the stack
    MOV BYTE [ESI], DL  ; Store the byte (DL is the lowest part of EDX) into memory
    INC ESI             ; Advance the memory pointer by 1 byte
    DEC ECX             ; Decrease the digit counter by 1
    JNZ .write_loop     ; If the counter hasn't reached 0, keep popping from the stack

.finish:
    MOV BYTE [ESI], 0   ; Add the null terminator (0x00) at the end of the string

    POP ESI             ; Restore all registers to their original state
    POP EBX
    POP EDX
    POP ECX
    
    RET                 ; Return from the function