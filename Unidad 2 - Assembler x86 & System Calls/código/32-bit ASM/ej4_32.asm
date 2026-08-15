;This function will print the sum of the first N natural numbers
;Arguments:
;   RDI: N
;Returns: nothing

section .text

GLOBAL suma
EXTERN num2str

suma:

    PUSH EBP                ; Preservation of the base pointer
    MOV EBP, ESP            ; Stack frame setup


    PUSH EAX            ;SUM
    PUSH EDI            ;N
    PUSH ESI            ;CURRENT_NUMBER
    PUSH EDX

    MOV EDI, [EBP+8]    ; Capturamos 'N' (el primer parámetro) desde la pila

    MOV EAX, 0          ; Initialize sum to 0
    MOV ESI, 1          ; Initialize CURRENT_NUMBER to 1  
.loop: 
    TEST EDI, EDI        ; Check if N is 0
    JZ .done             ; If N is 0, we are done
    ADD EAX, ESI        ; SUM += CURRENT_NUMBER
    DEC EDI             ; N--
    INC ESI             ; CURRENT_NUMBER++
    JMP .loop           ; Repeat the loop

.done:
    ;NUM2STR(SUM)
    PUSH placeholder     ; Move the address of the placeholder buffer into RSI
    PUSH EAX             ; Move the sum into RDI for using the num2str function
    CALL num2str        ; Call the num2str function to convert the sum to a string
    ADD ESP, 8          ; Stack cleaning after pushing two arguments (placeholder and sum)

    ;Printing of the value
    MOV EDX, EAX        ; Move the length of the string returned in EAX into EDX for sys_write
    MOV EAX, 4          ; system call for write (4 in 32 bit architecture)
    MOV EBX, 1          ; STDOUT
    MOV ECX, placeholder
    INT 0x80            ; Call the kernel to perform the write operation

    POP EDX             ; Restore original value of RDX
    POP ESI             ; Restore CURRENT_NUMBER
    POP EDI             ; Restore N
    POP EAX             ; Restore SUM

    MOV ESP, EBP        ; Restoriation of the stack pointer and base pointer
    POP EBP           
    RET

section .data

section .bss
placeholder resb 64