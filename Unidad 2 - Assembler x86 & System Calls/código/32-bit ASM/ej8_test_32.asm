section .text

GLOBAL _start
GLOBAL array_print
EXTERN selection_sort
EXTERN num2str

_start:

    ; message1 print
    MOV EAX, 4              ; sys_write
    MOV EBX, 1              ; stdout
    MOV ECX, message1
    MOV EDX, message1_len
    INT 80h

    ; message2 print
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message2
    MOV EDX, message2_len
    INT 80h

    ; Sorting of the array
    PUSH DWORD array_len    ; 2nd argument: array length
    PUSH array              ; 1st argument: array
    CALL selection_sort
    ADD ESP, 8              ; Stack restoration

    ; Printing of the array
    PUSH DWORD array_len    ; 2nd argument: array length
    PUSH array              ; 1st argument: array
    CALL array_print    
    ADD ESP, 8              ; Stack restoration

    ; message3 print
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message3
    MOV EDX, message3_len
    INT 80h

    ; Exit syscall
    MOV EAX, 1              ; sys_exit
    MOV EBX, 0              ; exit code
    INT 80h 

array_print:
    ; prints an array
    ; Parameters 
    ;   [EBP+8]  - 1st Argument - An address pointing to the start of the array 
    ;   [EBP+12] - 2nd Argument - The length of said array
    ; Output: void

    PUSH EBP
    MOV EBP, ESP

    ; Register preservation
    PUSH EBX
    PUSH ESI
    PUSH EDI

    MOV ESI, [EBP+8]        ; ESI = Current pointer of the array
    MOV EDI, [EBP+12]       ; EDI = Remaining length

    CMP EDI, 0              ; If it's empty, we jump
    JLE .end_print

.print_loop:
    ; Number extraction and conversion
    PUSH placeholder        ; 2nd argument for num2str - buffer
    PUSH DWORD [ESI]        ; 1st argument for num2str - number
    CALL num2str
    ADD ESP, 8              ; Stack restoration

    ; Number print
    MOV EDX, EAX            ; num2str returns length in EAX
    MOV EAX, 4              ; sys_write
    MOV EBX, 1              ; stdout
    MOV ECX, placeholder
    INT 80h

    ; Array advance
    ADD ESI, 4              ; Advance 4 bytes (DoubleWord size)
    DEC EDI                 

    ; Last element check
    CMP EDI, 0
    JLE .end_print

   ;comma_space printing
    MOV EAX, 4              ; sys_write
    MOV EBX, 1              ; stdout
    MOV ECX, comma_space
    MOV EDX, 2              ; Comma + space length
    INT 80h

    JMP .print_loop

.end_print:
    ; Register restoration
    POP EDI              
    POP ESI
    POP EBX

    MOV ESP, EBP
    POP EBP
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