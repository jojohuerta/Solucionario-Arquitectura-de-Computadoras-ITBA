section .text

GLOBAL _start
EXTERN main

_start: 
    PUSH EBP
    MOV EBP, ESP    ;Stack frame setup
    AND ESP, -16    ;Stack alignment

    CALL main

    MOV ESP, EBP    ;Stack frame teardown
    POP EBP

    MOV EBX, EAX    ;We will return what main returned
    MOV EAX, 1      ;1 is Sys_exit
    INT 80h  


section .data

section .bss
    placeholder RESB 32