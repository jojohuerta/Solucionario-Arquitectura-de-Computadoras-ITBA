;This function will print the sum of the first N natural numbers
;Arguments:
;   RDI: N
;Returns: nothing

section .text

GLOBAL _start
EXTERN num2str

_start:
    PUSH RAX            ;SUM
    PUSH RDI            ;N
    PUSH RSI            ;CURRENT_NUMBER
    PUSH RDX

    MOV RAX, 0          ; Initialize sum to 0
    MOV RSI, 1          ; Initialize CURRENT_NUMBER to 1    
.loop: 
    TEST RDI, RDI        ; Check if N is 0
    JZ .done             ; If N is 0, we are done
    ADD RAX, RSI        ; SUM += CURRENT_NUMBER
    DEC RDI             ; N--
    INC RSI             ; CURRENT_NUMBER++

.done
    ;NUM2STR(SUM)
    MOV RDI, RAX        ; Move the sum into RDI for using the num2str function
    MOV RSI, placeholder ; Move the address of the placeholder buffer into RSI
    CALL num2str        ; Call the num2str function to convert the sum to a string

    ;Printing of the value
    MOV RDX, RAX        ; Move the length of the string (returned in RAX) into RDX for sys_write
    MOV RAX, 1          ; system call for write
    MOV RDI, 1          ; file descriptor 1 is STDOUT
    MOV RSI, placeholder ; Move the address of the placeholder buffer into RSI
    SYSCALL             ; Call the kernel to perform the write operation

    POP RDX             ; Restore original value of RDX
    POP RSI             ; Restore CURRENT_NUMBER
    POP RDI             ; Restore N
    POP RAX             ; Restore SUM
    RET

section .data

section .bss
placeholder resb 64