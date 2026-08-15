section .text

GLOBAL _start

_start: 

;First, we want to print the message to the screen using the write system call.

    MOV EAX, 4                  ; system call for write in 64 bit architecture.
    MOV EBX, 1                  ; file descriptor 1 is STDOUT.
    MOV ECX, string             ; address of string to output.
    MOV EDX, string_length      ; number of bytes to be printed.
    INT 80h                     ; invoke operating system to do the write.

;We will implement the pseudo-code that was described in the comprehensive solutions manual of Unit 2.
;First, in order to loop, we'll need to define the label in where we will jump back to. In this case, we will call it "loop_start".

    mov AL, BYTE [ECX]
.loop_start:
    TEST AL, AL                  ; check if the current character is null terminator (0x00)
    JZ .loop_end                 ; were it to be the case, we jump to the end of the loop
    ;Now we will check if the current character is a lowercase letter. If it is, we will convert it to uppercase.
    CMP AL, 0x61                 ; compare the current character with 'a' (0x61)
    JL .not_lowercase            ; if the current character is less than 'a', it is not a lowercase letter, so we jump to the next iteration of the loop
    CMP AL, 0x7A                 ; compare the current character with 'z' (0x7A)
    JG .not_lowercase            ; if the current character is greater than 'z', it is not a lowercase letter, so we jump to the next iteration of the loop

    ;If we reached this point, it means that the current character is a lowercase letter. We will convert it to uppercase by subtracting 32 (0x20) from its ASCII value.

    SUB AL, 0x20                   ; convert lowercase letter to uppercase
    MOV [ECX], AL                  ; store the converted character back into the string

.not_lowercase:
    ADD ECX, 1                      ; move to the next character in the string
    MOV AL, [ECX]                   ; load the next character into AL
    JMP .loop_start                 ; jump back to the start of the loop to process the next character

.loop_end:
;Lastly, we want to print the new string and then exit the program using the exit system call.

    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, string
    MOV EDX, string_length
    INT 80h

    MOV EAX, 1                    ; system call for exit in 32 bit architecture.
    MOV EBX, 0                    ; exit code 0.
    INT 80h                     ; invoke operating system to do the exit.

section .data

string db "h4ppy c0d1ng", 10, 0
string_length equ $ - string

section .bss

placeholder resb 32