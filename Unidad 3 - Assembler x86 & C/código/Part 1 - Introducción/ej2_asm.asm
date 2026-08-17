;ej2_asm.asm

GLOBAL main
EXTERN printf

section .rodata
    fmt db “Cantidad de argumentos: %d\n”, 0

section .text

main:
    ;Armado de stack frame
    push ebp
    mov ebp, esp

    
    push dword [ebp+8]
    push fmt
    call printf
    add esp, 2*4

    mov eax, 0
    ;Desarmado de stack frame
    mov esp, ebp
    pop ebp
    ret

