section .bss
    vendor_buf resb 13

section .text
    GLOBAL print_vendor

print_vendor:
    PUSH EBP
    MOV EBP, ESP
    AND ESP, -16
        
    PUSH EBX            ; Preserve register

    MOV EAX, 0          ; Request vendor ID
    CPUID

    MOV [vendor_buf], EBX
    MOV [vendor_buf + 4], EDX
    MOV [vendor_buf + 8], ECX
    MOV byte [vendor_buf + 12], 10 ; LF

    MOV EBX, 1          ; STDOUT
    MOV ECX, vendor_buf 
    MOV EDX, 13         ; 12 bytes of vendor + 1 newline
    MOV EAX, 4          
    INT 80h

    POP EBX             ; Restore register

    MOV ESP, EBP
    POP EBP
    RET