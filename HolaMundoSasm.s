%include "io64.inc"
section .data
cadena: db "Hola mundo, SASM",10,0
lon: equ $ - cadena
section .text
global CMAIN
CMAIN:
    push rbp
    mov rbp,rsp
    PRINT_STRING cadena
    mov rsp,rbp
    pop rbp
    xor rax, rax
    ret