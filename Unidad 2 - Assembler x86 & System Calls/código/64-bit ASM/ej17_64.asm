;to_upper_case - edits a string, making all the lowercase letters uppercase
;Parameters
;   RDI - 1st Parameter - String that ends with null terminated
;Returns: void

section .text

GLOBAL to_upper_case
    
to_upper_case:
    PUSH RBP
    MOV RBP, RSP
    PUSH RAX
    PUSH RCX

    XOR RAX, RAX
    MOV RCX, RDI                 ; RCX now has the string (pointer passed in RDI)
    MOV AL, BYTE [RCX]           ; AL has the character

.loop_start:
    TEST AL, AL                  ; check if the current character is null terminator (0x00)
    JZ .loop_end

    ;Is it a lowercase letter? If it is, we will convert it to uppercase.
    CMP AL, 0x61                 ; compare the current character with 'a' (0x61)
    JL .not_lowercase            ; if the current character is less than 'a', it is not a lowercase letter, so we jump to the next iteration of the loop
    CMP AL, 0x7A                 ; compare the current character with 'z' (0x7A)
    JG .not_lowercase            ; if the current character is greater than 'z', it is not a lowercase letter, so we jump to the next iteration of the loop

    ;If we reached this point, it means that the current character is a lowercase letter. We will convert it to uppercase by subtracting 32 (0x20) from its ASCII value.

    SUB AL, 0x20                 ; convert lowercase letter to uppercase
    MOV [RCX], AL                ; store the converted character back into the string

.not_lowercase:
    ADD RCX, 1                   ; move to the next character in the string
    MOV AL, BYTE [RCX]           ; load the next character into AL
    JMP .loop_start              ; jump back to the start of the loop to process the next character

.loop_end:
    POP RCX
    POP RAX
    MOV RSP, RBP
    POP RBP
    RET

section .data

section .bss
    placeholder RESB 32