;multiplos - given the number N and K, it prints the numbers that are multiples of N that are between 1 and K.
;Parameters:
;   RDI - the number to find multiples of (N)
;   RSI - the upper limit to check for said multiples (K)
;Output: Void

section .text
GLOBAL multiplos
EXTERN num2str

multiplos:
    PUSH RBP
    MOV RBP, RSP

    ; Save registers that we will use and modify    
    PUSH RBX
    PUSH R12
    PUSH R13
    SUB RSP, 8  ; Stack alignment for 16 bytes --> CALL multiplos + RBP + RBX + R12 + R13 = 5*8 = 40 bytes
                ; which is not a multiple of 16. We need to add 8 more bytes to make it 48 bytes, which is a multiple of 16.

    MOV R12, RDI    ;Save N in R12
    MOV R13, RSI    ;Save K in R13
    MOV RBX, 1      ;CURRENT_NUMBER = 1

.loop:
    CMP RBX, R13    ;CURRENT_NUMBER > K (R13)
    JG .end_loop    ;If CURRENT_NUMBER is indeed greater than K, exit the loop

    MOV RAX, RBX    ;Move CURRENT_NUMBER to RAX for division
    XOR RDX, RDX    ;Clear RDX to use it for division
    DIV R12         ;Divide CURRENT_NUMBER by N (R12)
    TEST RDX, RDX   ;Check if the remainder is 0
    JNZ .loop_continue 

    ;If we reached this point, it means that CURRENT_NUMBER is a multiple of N and is smaller than or equal to K, so we print it
    
    MOV RDI, RBX ;CURRENT_NUMBER to RDI for num2str
    MOV RSI, placeholder
    CALL num2str

    ;printing of za number
    MOV RDX, RAX    ;strlen
    MOV RAX, 1      ;sys_write
    MOV RDI, 1      ;stdout
    MOV RSI, placeholder
    SYSCALL
    
    MOV RAX, 1      ;sys_write
    MOV RDI, 1      ;stdout
    MOV RSI, newline
    MOV RDX, 1      ;length of newline
    SYSCALL

.loop_continue:
    INC RBX         ;CURRENT_NUMBER++
    JMP .loop      

.end_loop:
    ADD RSP, 8      ; Restore stack alignment
    POP R13         ; Restore registers
    POP R12
    POP RBX

    MOV RSP, RBP
    POP RBP         ;Restoration of the base pointer
    RET

section .data
    newline db 10

section .bss
placeholder resb 32