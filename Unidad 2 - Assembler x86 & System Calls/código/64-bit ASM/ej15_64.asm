section .text

GLOBAL _start

_start:

    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, msg_start
    MOV RDX, msg_start_len
    SYSCALL

    ;nanosleep
    MOV RAX, 35             ; ID system call sys_nanosleep = 35
    MOV RDI, time_struct    ; Pointer to struct defining the time
    XOR RSI, RSI            ; NULL 
    SYSCALL

    ;Printing msg after waking up
    MOV RAX, 1
    MOV RDI, 1
    MOV RSI, msg_end
    MOV RDX, msg_end_len
    SYSCALL

    MOV RAX, 60
    MOV RDI, 0
    SYSCALL

section .data
    msg_start DB "(64-bit) Me voy a dormir por 5 segundos, buenas noches...", 10
    msg_start_len EQU $-msg_start

    msg_end DB "¡Me desperte!", 10
    msg_end_len EQU $-msg_end

    ; "STRUCT TIMESPEC"
    time_struct:
        DQ 5    ; tv_sec  (Seconds)
        DQ 0    ; tv_nsec (Nanoseconds)