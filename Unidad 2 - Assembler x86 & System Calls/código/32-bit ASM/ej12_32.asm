section .text

GLOBAL _start
EXTERN num2str

_start:
    MOV EBP, ESP

    MOV ESI, EBP    ; ESI : PUNTERO_ACTUAL = ESP
    XOR EDI, EDI    ; EDI : TOTAL_BYTES = 0

    ; Printing of initial message
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message1
    MOV EDX, message1_len
    INT 80h

.loop:
    
    MOV ECX, [ESI]  ; DATO = *PUNTERO_ACTUAL 

    ADD EDI, 4      ; TOTAL_BYTES += 4
    
    PUSH BUFFER     ; 2nd parameter --> Buffer
    PUSH EDI        ; 1st parameter --> TOTAL_BYTES
    CALL num2str    
    ADD ESP, 8      

    ;We store EAX in order to print 
    PUSH EAX        
    
    ; printing
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, message2
    MOV EDX, message2_len
    INT 80h

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, BUFFER
    POP EDX
    INT 80h

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, newline
    MOV EDX, 1
    INT 80h

    ADD ESI, 4      ; PUNTERO_ACTUAL += 4
    JMP .loop

section .data
    message1 DB "Vamos a intentar ver hasta donde nos deja acceder en el stack", 10
    message1_len EQU $-message1

    message2 DB "Cantidad de bytes leidos hasta ahora: "
    message2_len EQU $-message2

    newline DB 10

section .bss
    placeholder RESB 32
    BUFFER RESB 64