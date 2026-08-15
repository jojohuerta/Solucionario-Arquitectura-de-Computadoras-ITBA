;menor - Receives both a numerical array (whose numbers are made by 4 bytes) and the length of this one. Returns the position of the smallest number of the array.
;Parameters:
;   RDI - 1st Argument: Pointer to the 1st element of the array
;   RSI - 2nd Argument: Length of the array indicated in RDI
;Returns:
;   RAX: The index of the lowest number in the array

section .text

GLOBAL menor

menor: 
    PUSH RBP        ;Setup of stack frame and preservation of registers
    MOV RBP, RSP 
    PUSH RSI
    PUSH RDI
    PUSH RBX
    PUSH R9
    PUSH R10
    PUSH RCX

    XOR R9, R9      ;MIN_INDEX = 0
    XOR R10, R10    ;CURRENT_INDEX = 0

    ;Initial Check if the length of the array is 0
    CMP RSI, 0
    JLE .end        ;JLE = Jump if Less or Equal
                    ;When we make this jump, MIN_INDEX is 0
    
    ; If we make it here, it means that the length of the array is a positive value
    
    MOV EBX,[RDI]   ;EBX --> 32 bit part of the register RBX
                    ;MIN_INDEX_VALUE = ARRAY[0]    

.loop:
    CMP RSI, 0
    JLE .end

    MOV ECX, [RDI]
    CMP EBX, ECX    
    JGE .loop_continue

    ;If we reach this point, it means that the ARRAY[CURRENT_INDEX] < MIN_INDEX_VALUE

    MOV EBX, [RDI] ;MIN_INDEX_VALUE = ARRAY[CURRENT_INDEX]
    MOV R9, R10

.loop_continue:
    INC R10         ;CURRENT_INDEX++
    DEC RSI         ;ARRAY_LEN--
    ADD RDI, 0x4    ;We advance throughout the array
    JMP .loop

.end:
    MOV RAX, R9     ;We return MIN_INDEX, aka R9
    ;Restoration of registers
    POP RCX
    POP R10
    POP R9
    POP RBX
    POP RDI         
    POP RSI
    MOV RSP, RBP
    POP RBP
    RET

section .data


section .bss
    placeholder RESB 32


