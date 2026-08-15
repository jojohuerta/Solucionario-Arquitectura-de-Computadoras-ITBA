;selection_sort - sorts the elements of an array. The technique used is Selection Sort.
;Parameters
;   [EBP + 8]  - 1st Argument - An address pointing to the start of the array 
;   [EBP + 12] - 2nd Argument - The length of said array
;Output: void

section .text

GLOBAL selection_sort
EXTERN menor

selection_sort:
    
    PUSH EBP
    MOV EBP, ESP
 
    PUSH EBX        ;AUX1
    PUSH ECX        ;AUX2   
    PUSH ESI        ;We will use ESI to keep track of the Array Pointer
    PUSH EDI        ;We will use EDI to keep track of the Array Length

    MOV ESI, [EBP + 8]  ;Load initial Array Pointer
    MOV EDI, [EBP + 12] ;Load initial Array Length

    CMP EDI, 1
    JLE .end

.loop:
    
    CMP EDI, 1
    JLE .end

    ;ESI still is the address pointing to the start of the array
    ;EDI still is the length of said array

    ;We push the arguments to the stack before calling 'menor'
    PUSH EDI        ;2nd argument: length
    PUSH ESI        ;1st argument: array pointer
    CALL menor
    ADD ESP, 8      ;Stack restoration
 
    ;Now we have in EAX the index of the lowest value.
    ;EAX = MIN_INDEX
    
    XOR EBX, EBX
    XOR ECX, ECX

    MOV EBX, DWORD [ESI]                ;AUX1 = ARRAY[0]
    MOV ECX, DWORD [ESI + 4 * EAX]      ;AUX2 = ARRAY[MIN_INDEX]

    MOV [ESI + 4 * EAX], EBX            ;ARRAY[MIN_INDEX] = AUX1
    MOV [ESI], ECX                      ;ARRAY[0] = AUX2

    ADD ESI, 4                  ;"ARRAY++". Remember in order to advance one space we need to increment by 4 because the array contains 4-byte numbers
    DEC EDI                     ;ARRAY_LEN--
    JMP .loop

 .end: 
    
    ;Restoration of registers
    POP EDI
    POP ESI
    POP ECX
    POP EBX

    MOV ESP, EBP
    POP EBP
    RET

section .data

section .bss
    placeholder RESB 32