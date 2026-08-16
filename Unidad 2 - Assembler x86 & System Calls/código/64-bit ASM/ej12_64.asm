section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV RBP, RSP
    MOV R14, RBP    ; R14 : PUNTERO_ACTUAL = RSP
    XOR R15, R15    ; R15: TOTAL_BYTES = 0

    ;Printing of initial message
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message1
    MOV RDX, message1_len
    SYSCALL

.loop:
    
    MOV R12, [R14]  ; R12 : DATO = *PUNTERO_ACTUAL 
    
    ADD R15, 8      ; TOTAL_BYTES += 8
    
    MOV RDI, R15    ; RDI - 1st parameter --> TOTAL_BYTES
    MOV RSI, BUFFER ; RSI - 2nd parameter --> Buffer
    CALL num2str

    MOV R13, RAX    ;We store RAX in R13 because we'll neeed to print something before printing the amount of bytes
    
    ;printing
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, message2
    MOV RDX, message2_len
    SYSCALL

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, BUFFER
    MOV RDX, R13
    SYSCALL

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, newline
    MOV RDX, 1
    SYSCALL

    ADD R14, 8      ;PUNTERO_ACTUAL += 8
    JMP .loop

section .data
    message1 DB "Vamos a intentar ver hasta donde nos deja acceder en el stack",10
    message1_len EQU $-message1

    message2 DB "Cantidad de bytes leidos hasta ahora: "
    message2_len EQU $-message2

    newline DB 10

section .bss
    placeholder RESB 32
    BUFFER RESB 64