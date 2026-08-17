;ej1.asm

GLOBAL main
EXTERN printf

section .rodata
    fmt db "Cantidad de argumentos: %d", 10, 0
    ARG_FMT DB "%s", 10, 0

section .text

main:
    ;Stack frame setup
    push ebp          
    mov ebp, esp
    PUSH EBX    ;Safe register. We're going to use it for storing ARGC
    PUSH ESI    ;Safe register. We're going to use it for storing the ARGV_BASE
    PUSH EDI    ;Safe register. We're going to use it for storing the ARRAY_OFFSET

    ;Printing of argc
    push dword [ebp+8]
    push fmt
    call printf
    add esp, 2*4

    MOV EBX, [EBP+8]    ; ARGC = argc
    MOV ESI, [EBP+12]   ; ARGV_BASE = char ** argv
    XOR EDI, EDI        ; ARRAY_OFFSET = 0

.loop:
    TEST EBX, EBX
    JZ .end             ; Check if ARGC is 0. It it is, we're done.
    
    MOV ECX,[ESI + EDI] ;ARGUMENT_STRING = [ARGV_BASE + ARRAY_OFFSET]
    PUSH ECX
    PUSH ARG_FMT 
    CALL printf
    ADD ESP, 8          ; Cleanup of parameters

    ADD EDI, 4          ; ARRAY_OFFSET += 4
    DEC EBX             ; ARGC--
    JMP .loop
.end:

    ;Restoration of registers
    POP EDI
    POP ESI
    POP EBX

    ;Stack frame cleanup
    mov esp, ebp
    pop ebp

    XOR EAX, EAX
    ret
