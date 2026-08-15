;menor - Receives both a numerical array (whose numbers are made by 4 bytes) and the length of this one. Returns the position of the smallest number of the array.
;Parameters:
;   EBP + 8   - 1st Argument: Pointer to the 1st element of the array
;   EBP + 12  - 2nd Argument: Length of the array indicated in RDI
;Returns:
;   EAX: The index of the lowest number in the array

section .text

GLOBAL menor

menor: 
    PUSH EBP        ;Setup of stack frame and preservation of registers
    MOV EBP, ESP

    PUSH EBX
    PUSH EDI        
    PUSH ESI        
    PUSH ECX
    PUSH EDX

    MOV EDX, [EBP+8]    ;EDX = Pointer to the array
    XOR EDI, EDI        ;MIN_INDEX = 0
    XOR ESI, ESI        ;CURRENT_INDEX = 0

    ;Initial Check if the length of the array is 0

    CMP DWORD [EBP + 12], 0 ;INDICAR DWORD
    JLE .end        ;JLE = Jump if Less or Equal
                    ;When we make this jump, MIN_INDEX is 0
    
    ; If we make it here, it means that the length of the array is a positive value
    

    ;MIN_INDEX_VALUE = ARRAY[0]
    MOV EBX, [EDX]   
                            

.loop:
    CMP DWORD [EBP + 12], 0 ;INDICAR DWORD
    JLE .end

    MOV ECX, [EDX]      ;We move ARRAY[CURRENT_INDEX] to ECX
    CMP EBX, ECX        ;We compare MIN_INDEX_VALUE with ARRAY[CURRENT_INDEX]
                        ;Remember, CMP value1, value 2 really does value1 - value2
    
    JLE .loop_continue  ;If the result of MIN_INDEX_VALUE - ARRAY[CURRENT_INDEX] is 0 (they are equal) or is negative (value2 is greater than value1)
                        ;This means that ARRAY[CURRENT_INDEX] is the same or LARGER than MIN_INDEX_VALUE, so we just skip it. 

    ;If we reach this point, it means that the ARRAY[CURRENT_INDEX] < MIN_INDEX_VALUE

    MOV EBX, ECX        ;MIN_INDEX_VALUE = ARRAY[CURRENT_INDEX]
    MOV EDI, ESI        ;MIN_INDEX = CURRENT_INDEX

.loop_continue:
    INC ESI                 ;CURRENT_INDEX++
    DEC DWORD [EBP+12]      ;ARRAY_LEN--
    ADD EDX, 0x4            ;We advance throughout the array
    JMP .loop

.end:
    MOV EAX, EDI     ;We return MIN_INDEX, aka EDI

    ;Restoration of registers
    POP EDX
    POP ECX
    POP ESI
    POP EDI
    POP EBX

    MOV ESP, EBP
    POP EBP
    RET

section .data


section .bss
    placeholder RESB 32


