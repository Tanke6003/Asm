section .data
cadena: db "Hola mundo\n",10,0
lon: equ $ - cadena
section .bss
anio resb 4
section .text
global MAIN
MAIN:
    push rbp
    mov rbp,rsp
    mov rax,1
    mov rdi,1
    mov rsi,cadena
    mov rdx,lon
    syscall
    mov rsp,rbp
    pop rbp
    mov rax,60
    mov rdi,0
    syscall

