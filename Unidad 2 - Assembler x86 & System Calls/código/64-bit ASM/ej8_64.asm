;selection_sort - sorts the elements of an array. The technique used is Selection Sort.
;Parameters
;   RDI - 1st Argument - An address pointing to the start of the array 
;   RSI - 2nd Argument - The length of said array
;Output: void

section .text:

GLOBAL selection_sort
EXTERN menor

selection_sort:
    
    PUSH RBP
    MOV RBP, RSP
 
    PUSH R9     ;AUX1   
    PUSH R10    ;AUX2

    CMP RSI, 1
    JLE .end

.loop
    
    CMP RSI, 1
    JLE .end

    ;RDI still is the address pointing to the start of the array
    ;RSI still is the length of said array

    ;Also, since there only is in the stack the CALL of selection_sort and the RBP, R9 and R10, 8 + 24 = 32
    ;So, the stack aligns with 16. 

    CALL menor
    ;Now we have in RAX the index of the lowest value.
    ;RAX = MIN_INDEX
    
    MOV R9, [RDI]               ; AUX1 = ARRAY[0]
    MOV R10, [RDI + 4 * RAX]    ; AUX2 = ARRAY[MIN_INDEX]

    MOV [RDI + 4 * RAX], R9     ;ARRAY[MIN_INDEX] = AUX1
    MOV [RDI], R10              ;ARRAY[0] = AUX2

    ADD RDI, 4                  ;"ARRAY++". Remember in order to advance one space we need to increment by 4 because the array contains 4-byte numbers
    DEC RSI                     ;ARRAY_LEN--
    JMP .loop

 .end: 
    
    ;Restoration of registers
    POP R10
    POP R9

    MOV RSP, RBP
    POP RBP
    RET

section .data:

section .bss:
    placeholder resb 32