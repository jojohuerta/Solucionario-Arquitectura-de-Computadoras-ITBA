section .text

GLOBAL _start

_start:
    ; 1. Imprimimos un mensaje avisando que nos vamos a dormir
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, msg_start
    MOV EDX, msg_start_len
    INT 80h

    ;nanosleep
    MOV EAX, 162            ; ID system call sys_nanosleep = 162
    MOV EBX, time_struct    ; Pointer to struct defining the time
    XOR ECX, ECX            ; NULL 
    INT 80h

    ;Printing msg after waking up
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, msg_end
    MOV EDX, msg_end_len
    INT 80h

    MOV EAX, 1
    MOV EBX, 0
    INT 80h

section .data
    msg_start DB "Me voy a dormir por 5 segundos, buenas noches...", 10
    msg_start_len EQU $-msg_start

    msg_end DB "¡Me desperte!", 10
    msg_end_len EQU $-msg_end

    ; "STRUCT TIMESPEC"
    time_struct:
        DD 5    ; tv_sec  (Seconds)
        DD 0    ; tv_nsec (Nanoseconds)