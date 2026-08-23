; ej_debug_2.asm
;===============================================================================

GLOBAL main
EXTERN puts, sprintf
section .rodata
fmt db "%d",0
number dd 1234567890
section .text
main:
     PUSH EBP            ;Fix: Stack frame setup
     MOV EBP, ESP      
     AND ESP, -16        ;Fix: Stack frame alignment

     SUB ESP, 4          ;Fix: alignment of stack frame when pushing arguments
     push dword [number]
     push fmt
     push buffer
     call sprintf
     ADD esp, 4*4        ;Fix: Replaced AND with ADD. Also updated its value so it follows our stack alignment policy  
     
     SUB ESP, 12         ;Fix: alignment of stack frame when pushing arguments
     push buffer
     call puts
     add esp, 16         ;Fix: updated it so its value so it follows our stack alignment policy  

     XOR EAX, EAX        ;Fix: explicit return value

     MOV ESP, EBP        ;Fix: Stack frame teardown
     POP EBP
     ret

section .bss
buffer resb 40
