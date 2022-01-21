Section .data
msg: db "Introduce el anio:",0x20,0x00
lenMsg: equ $ - msg
aMsg: db "divisible",0x00
lenA: equ $ - aMsg
bMsg: db "No divisible",0x00
lenB: equ $ - bMsg
init: db 0x0A,0x0D,0x00
lenInit: equ $ - init
Section .bss
anio resq 0x01
Section .text
global main
main:
    ;init
    PUSH rbp
    MOV rbp,rsp
    MOV rax,0x00
    MOV rbx,0x00
    MOV rcx,0x00
    Mov rdx,0x00

    ;solicitar anio
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,msg
    MOV rdx,lenMsg
    SYSCALL
    
    ;captura del anio
    MOV rax,0x00
    MOV rdi,0x00
    MOV rsi,anio
    MOV rdx,0x04
    SYSCALL

    ;init registros
    MOV rax,0x00
    MOV rbx,0x00
    MOV rcx,0x00
    Mov rdx,0x00

    ;paso1
    MOV rdx,0x00
    MOV rax,anio
    MOV rcx,0x04
    DIV rcx
    CMP rdx,0x00
    JZ div4
    JNZ nodiv4

    ;comprueba anio
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,anio
    MOV rdx,0x04
    SYSCALL

    ;limpia consola
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,init
    MOV rdx,lenInit
    SYSCALL

    ;cierra
    MOV rsp,rbp
    POP rbp
    MOV rax,0x3C
    MOV rdi,0x00
    SYSCALL

div4:
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,aMsg
    MOV rdx,lenA
    SYSCALL

    ;limpia consola
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,init
    MOV rdx,lenInit
    SYSCALL

    ;cierra
    MOV rsp,rbp
    POP rbp
    MOV rax,0x3C
    MOV rdi,0x00
    SYSCALL
nodiv4:
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,bMsg
    MOV rdx,lenB
    SYSCALL

    ;limpia consola
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,init
    MOV rdx,lenInit
    SYSCALL

    ;cierra
    MOV rsp,rbp
    POP rbp
    MOV rax,0x3C
    MOV rdi,0x00
    SYSCALL
    
