section .text

GLOBAL seven

seven:
    PUSH EBP        ;Stack Frame setup
    MOV EBP, ESP

    AND ESP, -16    ;Stack alignment

    MOV EAX, 7

    MOV ESP, EBP    ;Stack frame teardown
    POP EBP
    RET

section .data

section .bss
    placeholder RESB 32