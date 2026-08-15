;;multiplos - given the number N and K, it prints the numbers that are multiples of N that are between 1 and K.
;Parameters:
;   1st parameter - the number to find multiples of (N)
;   2nd parameter - the upper limit to check for said multiples (K)
;Output: Void

section .text
GLOBAL multiplos
EXTERN num2str

multiplos:
    PUSH EBP
    MOV EBP, ESP

    ; Save registers that we will use and modify
    PUSH EBX
    PUSH ESI
    PUSH EDI

    MOV EDI, [EBP+8]    ;N --> EDI
    MOV ESI, [EBP+12]   ;K --> ESI
    MOV EBX, 1          ;CURRENT_NUMBER = 1

.loop:
    CMP EBX, ESI        ;CURRENT_NUMBER > K (ESI)
    JG .loop_end        ;If CURRENT_NUMBER is indeed greater than K, exit the loop
    MOV EAX, EBX        ;Move CURRENT_NUMBER to EAX for division
    XOR EDX, EDX
    DIV EDI             ;Divide CURRENT_NUMBER by N (EDI)
    TEST EDX, EDX       ;Check if the remainder is 0
    JNZ .loop_continue  ;If not, continue the loop
.loop_print:
    ;if we reached this point, it means that CURRENT_NUMBER is a multiple of N and is smaller than or equal to K, so we print it
    PUSH EBX
    PUSH placeholder
    CALL num2str
    ADD ESP, 8      ;Restore stack after num2str call. 

    ;printing of a number
    MOV EDX, EAX    ;strlen
    MOV EAX, 4      ;sys_write
    MOV EBX, 1      ;stdout
    MOV ECX, placeholder
    INT 80h

    ;printing of newline (LF)
    MOV EAX, 4      ;sys_write
    MOV EBX, 1      ;stdout
    MOV ECX, newline
    MOV EDX, 1      ;length of newline
    INT 80h

.loop_continue:
    INC EBX         ;CURRENT_NUMBER++
    JMP .loop

.loop_end:
    POP EDI
    POP ESI
    POP EBX

    MOV ESP, EBP
    POP EBP
    RET

section .data
    newline db 10
    
section .bss
    placeholder resb 32