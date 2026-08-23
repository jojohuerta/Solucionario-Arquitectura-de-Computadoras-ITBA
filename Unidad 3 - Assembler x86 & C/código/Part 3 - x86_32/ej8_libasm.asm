;Library
;
; exit - Ends the program with an Exit code.
; Arguments:
;   - 1st argument: Exit code
;
; fd_read - Reads from a File Descriptor
; Arguments:
;   - 1st argument: FD
;   - 2nd argument: pointer to the buffer
;   - 3rd argument: max amount of bytes to read
; Returns:
;   EAX: # of bytes read
;
; fd_write - Writes to a File Descriptor
; Arguments:
;   - 1st argument: FD
;   - 2nd argument: pointer to the text
;   - 3rd argument: amount of bytes to write
; Returns:
;   EAX: number of bytes written
; 
; file_open - Opens a file_open
; Arguments:
;   - 1st argument: Null terminated string with the path to the file
;   - 2nd argument: Flags
;   - 3rd argument: Mode 
; Returns:
;   EAX: File Descriptor of said file
;
; file_close - Closes a file
; Arguments:
;   - 1st argument: FD from file we want to close
; Returns:
;   EAX: zero on success, -1 on error.

section .text

GLOBAL exit
GLOBAL fd_read
GLOBAL fd_write
GLOBAL file_open
GLOBAL file_close

exit:
    PUSH EBP
    MOV EBP, ESP
    AND ESP, -16        ; Stack alignment

    MOV EBX, [EBP+8]    ; 1st arg: exit code
    MOV EAX, 1          ; sys_exit
    INT 80h

    MOV ESP, EBP        ; Teardown
    POP EBP
    RET

fd_read:
    PUSH EBP
    MOV EBP, ESP
    AND ESP, -16        ; Stack alignment
    
    PUSH EBX            ; Preservation of callee-saved register

    MOV EBX, [EBP+8]    ; 1st arg: FD
    MOV ECX, [EBP+12]   ; 2nd arg: buffer pointer
    MOV EDX, [EBP+16]   ; 3rd arg: max bytes
    MOV EAX, 3          ; sys_read
    INT 80h

    POP EBX             ; Restoration of callee-saved register

    MOV ESP, EBP
    POP EBP
    RET

fd_write:
    PUSH EBP
    MOV EBP, ESP
    AND ESP, -16        ; Stack alignment
    
    PUSH EBX            ; Preservation of callee-saved register

    MOV EBX, [EBP+8]    ; 1st arg: FD
    MOV ECX, [EBP+12]   ; 2nd arg: text pointer
    MOV EDX, [EBP+16]   ; 3rd arg: bytes to write
    MOV EAX, 4          ; sys_write
    INT 80h

    POP EBX             ; Restoration of callee-saved register

    MOV ESP, EBP
    POP EBP
    RET

file_open:
    PUSH EBP
    MOV EBP, ESP
    AND ESP, -16        ; Stack alignment
    
    PUSH EBX            ; Preservation of callee-saved register

    MOV EBX, [EBP+8]    ; 1st arg: string path pointer
    MOV ECX, [EBP+12]   ; 2nd arg: flags
    MOV EDX, [EBP+16]   ; 3rd arg: mode
    MOV EAX, 5          ; sys_open
    INT 80h

    POP EBX             ; Restoration of callee-saved register

    MOV ESP, EBP
    POP EBP
    RET

file_close:
    PUSH EBP
    MOV EBP, ESP
    AND ESP, -16        ; Stack alignment
    
    PUSH EBX            ; Preservation of callee-saved register

    MOV EBX, [EBP+8]    ; 1st arg: FD
    MOV EAX, 6          ; sys_close
    INT 80h

    POP EBX             ; Restoration of callee-saved register

    MOV ESP, EBP
    POP EBP
    RET