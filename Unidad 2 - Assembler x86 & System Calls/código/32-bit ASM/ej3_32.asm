;num2str - Converts a positive integer to a string.
; Arguments (passed via stack):
;   [EBP+8] : Integer to convert (1st argument)
;   [EBP+12]: Pointer to the memory buffer where the null-terminated string will be stored (2nd argument)
; Returns:
;   EAX: Length of the converted string (excluding the null terminator)

SECTION .text

GLOBAL num2str

num2str:
    PUSH EBP                ; Stack frame setup
    MOV EBP, ESP

    PUSH ECX                
    PUSH EDX
    PUSH EBX            
    PUSH ESI

    MOV EAX, [EBP+8]        ; Argument 1 (Integer to convert) --> EAX
    MOV ESI, [EBP+12]       ; Argument 2 (Buffer pointer) --> ESI
    
    MOV EBX, 10        
    MOV ECX, 0            ; Length counter

.divide_loop:
    MOV EDX, 0            ; 32-bit DIV divides EDX:EAX. Thus, we clear EDX to ensure it doesn't affect the division.
    DIV EBX                 ; After the operation, EAX stores the quotient, EDX stores the remainder
    
    ADD EDX, 0x30           ; Add 0x30 to the remainder in order to make it a character
    PUSH EDX                ; Push the character onto the stack
    INC ECX                 ; Add 1 to our digit counter
    
    TEST EAX, EAX           ; Check if the quotient has reached 0
    JNZ .divide_loop        ; If it is not zero, there are still numbers left

    MOV EAX, ECX            ; Save the total string length into EAX before the write loop destroys ECX.

.write_loop:
    POP EDX                 ; Pop the character from the top of the stack
    MOV BYTE [ESI], DL      ; Store the byte (DL is the lowest part of EDX) into memory
    INC ESI                 ; Advance the memory pointer by 1 byte
    DEC ECX                 ; Decrease the digit counter by 1
    JNZ .write_loop         ; If the counter hasn't reached 0, keep popping from the stack

.finish:
    MOV BYTE [ESI], 0       ; Add the null terminator (0x00) at the end of the string

    POP ESI                 ; Restore all registers to their original state
    POP EBX
    POP EDX
    POP ECX
    
    MOV ESP, EBP            ; Restoration of the stack pointer and original base poitner
    POP EBP          
    
    RET