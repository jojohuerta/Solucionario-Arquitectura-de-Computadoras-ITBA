;ex1_main.asm

GLOBAL main
EXTERN hello_world

section .text

main:
    call hello_world

    ;exit with code 0
    mov eax, 1
    mov ebx, 0
    int 80h