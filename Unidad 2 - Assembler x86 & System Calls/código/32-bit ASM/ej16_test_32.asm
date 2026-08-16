section .text

GLOBAL _start
EXTERN to_upper_case

section .data
    message1 DB "Ingrese texto para convertir en mayuscula. Como maximo puede ingresar 128 caracteres", 10
    message1_len EQU $-message1

    BUFFER_SIZE EQU 128

section .bss
    ; 128 bytes + 1 extra byte for NULL terminated
    BUFFER RESB BUFFER_SIZE + 1 
    placeholder RESB 32