GLOBAL main
EXTERN puts

section .rodata
    test_msg db "Testing custom puts function...", 0

section .text
main:
    push ebp
    mov ebp, esp
    and esp, -16    ; 16-byte stack alignment

    push test_msg
    call puts
    add esp, 4      ; Stack cleanup

    xor eax, eax    ; Return 0
    mov esp, ebp
    pop ebp
    ret