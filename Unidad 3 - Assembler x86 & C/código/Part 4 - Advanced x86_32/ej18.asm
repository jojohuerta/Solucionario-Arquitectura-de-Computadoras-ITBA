;imprime_pantalla : Writes in the screen the specified characters in the string, ONLY THE BOTTOM
;   Arguments:
;       [EBP+8]:  1st Argument - (encabezado) String with what to write at the top   [UNUSED]
;       [EBP+12]: 2nd Argument - (tam_enc) length of what to write at the top     [UNUSED]
;       [EBP+16]: 3rd Argument - (pie) String with what to write at the bottom
;       [EBP+20]: 4th Argument - (tam_pie) length of what to write at the top
;   Returns:
;       EAX: 0 if everything went OK, else 1.

section .text
GLOBAL imprime_pantalla

imprime_pantalla:
    PUSH EBP
    MOV EBP, ESP
    
    AND ESP, -16

    PUSH EBX                ; Preservation of persistent registers
    PUSH ESI
    PUSH EDI

    ; tam_pie validation
    MOV ECX, [EBP+20]       
    
    CMP ECX, 1
    JL .error               ; If lesser than 1, error
    
    CMP ECX, 80
    JG .error               ; If greater than 80, error

    ;If we reached this point, we can safely write the characters

    MOV ESI, [EBP+16]       ; ESI = pie
    MOV EDI, 0xA0000000+5*80; EDI = starting position of last row. 
                            ; Remember that we're going to write on the last row, so we have 
                            ; to add to the base address the offset of the 5 rows

.loop:    
    ; We now iterate and copy the characters manually
    TEST ECX, ECX
    JZ .loop_end

    MOV AL, BYTE [ESI]
    MOV [EDI], AL

    INC EDI
    INC ESI
    DEC ECX
    JMP .loop

.loop_end:
    ; If we reached this point, it means that everything went OK, so we return 0
    XOR EAX, EAX
    JMP .end

.error:
    MOV EAX, 1              ; We return 1 in case of an error

.end:
    ; Restoration of registers
    POP EDI
    POP ESI
    POP EBX

    MOV ESP, EBP
    POP EBP
    RET