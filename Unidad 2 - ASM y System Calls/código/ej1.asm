;===============================================================================
; This program prints a message to standard output (STDOUT), 
; which is "Hello World!" followed by a line feed (LF).
; This program uses system calls: one to print (write) and another to exit.
;===============================================================================

section .text

GLOBAL _start

_start: 

    ; First, we want to print the message to the screen using the write system call.
    ; To do this, we need to pass the following parameters to the system call:
    ; rax = 1 (the system call number for sys_write in 64-bit)
    ; rdi = 1 (the file descriptor for standard output)
    ; rsi = memory address of the message to print
    ; rdx = length of the message to print
    ; Remember, we MUST USE THESE EXACT REGISTERS, because the system call 
    ; interface is defined to use these registers for these parameters.

    mov rax, 1                  ; system call for write. This is how the operating system knows which system call we want to invoke.
    mov rdi, 1                  ; file handle 1 is STDOUT. This is how the operating system knows where we want to write the message.
    mov rsi, message            ; address of string to output. This is how the operating system knows what we want to write.
    mov rdx, message_length     ; number of bytes. This is how the operating system knows how many bytes we want to write.
    
    syscall                     ; invoke operating system to do the write. This is how we actually invoke the system call.
                                ; It is equivalent to using the instruction INT 0x80 in 32-bit mode, but in 64-bit mode we use the syscall instruction.

    mov rax, 60                 ; We indicate the system call we want to use is EXIT (60 in 64-bit)
    mov rdi, 0                  ; We set the exit code to 0
    syscall                     ; invoke operating system to execute the exit system call.


section .data
    message db "Hello World!", 10           ; Remember that using db + string is syntactic sugar,
                                            ; as explained in the "Fuentes" introductory guide solution manual of Unit 2.
                                            ; The 10 appended at the end represents the decimal value 10 from the ASCII table,
                                            ; which is the LF (line feed) character.

    message_length equ $ - message          ; This is a way to calculate the length of the character string.

section .bss
    placeholder resb 32