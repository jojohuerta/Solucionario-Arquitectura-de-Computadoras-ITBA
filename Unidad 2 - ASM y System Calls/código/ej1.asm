;===============================================================================
; Este programa lo que hace es imprimir un mensaje en salida estandar (STDOUT)
; el cual es "Hello World!" seguido de un salto de linea (LF).
; Este programa usa system calls, una para imprimir (write) y otra para salir del programa (exit).
;===============================================================================

section .text

GLOBAL _start

_start: 




section .data
    mensaje db "Hello World!", 10           ;Recordemos que esto de db + cadena es syntactic sugar.
                                            ;El 10 que se agrega al final representa el valor (decimal) 10 de la tabla ASCII
                                            ;que es el caracter LF (salto de linea).

    longitud_del_mensaje equ $ - mensaje    ;Esto es una forma de calcular la longitud de la cadena de caracteres.

section .bss
    placeholder resb 32