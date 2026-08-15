section .text

GLOBAL _start
GLOBAL array_print
EXTERN selection_sort
EXTERN num2str

_start:

    ;message1 print
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message1
    MOV RDX, message1_len
    SYSCALL

    ;message2 print
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message2
    MOV RDX, message2_len
    SYSCALL

    ;Sorting of the array
    MOV RDI, array
    MOV RSI, array_len
    CALL selection_sort


    ;Printing of the array
    MOV RDI, array
    MOV RSI, array_len
    CALL array_print    

    ;message3 print
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message3
    MOV RDX, message3_len
    SYSCALL

    MOV RAX, 60     ; Exit syscall
    MOV RDI, 0
    SYSCALL 

array_print:
    ;prints an array
    ;Parameters 
    ;   RDI - 1st Argument - An address pointing to the start of the array 
    ;   RSI - 2nd Argument - The length of said array
    ;Output: void

    PUSH RBP
    MOV RBP, RSP

    PUSH RBX
    PUSH R12
    PUSH R13
    SUB RSP, 8          ; Stack alignment to 16 bytes before CALL

    MOV R12, RDI        ; R12 = Current pointer of the array
    MOV R13, RSI        ; R13 = Remaining length

    CMP R13, 0          ; If it's empty, we jump
    JLE .end_print

.print_loop:
    ;Number extraction and conversion
    XOR EDI, EDI
    MOV EDI, DWORD [R12]  ; We read 4 bytes
    MOV RSI, placeholder
    CALL num2str

    ;Number print
    MOV RDX, RAX        ; RAX: length of the number
    MOV RAX, 1          ; sys_write
    MOV RDI, 1          
    MOV RSI, placeholder
    SYSCALL

    ;Array advance
    ADD R12, 4          
    DEC R13             

    ; Last element check
    CMP R13, 0
    JLE .end_print

    MOV RAX, 1        
    MOV RDI, 1         
    MOV RSI, comma_space
    MOV RDX, 2          ; Comma + space
    SYSCALL

    JMP .print_loop

.end_print:
    ADD RSP, 8          ; Stack alignment rollback
    POP R13             
    POP R12
    POP RBX

    MOV RSP, RBP
    POP RBP
    RET


section .data
    
    array DD 0, 4, 1, 9, 2, 7, 8, 3, 6, 5
    array_len EQU 10

    message1 DB "Original Array: {0, 4, 1, 9, 2, 7, 8, 3, 6, 5}", 10
    message1_len EQU $-message1

    message2 DB "Sorted Array: {"
    message2_len EQU $-message2

    message3 DB "}", 10
    message3_len EQU $-message3

    comma_space DB ", "

section .bss
    placeholder RESB 32