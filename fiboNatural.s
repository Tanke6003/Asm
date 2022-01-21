
Section .data
msg: db "Introduce un numero:",0x20,0x00
lenMsg: equ $ - msg
init: db 0x0A,0x0D,0x00
a db 0x00
b db 0x01
c db 0x00

lenInit: equ $ - init
Section .bss
num resq 0x01
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

    ;solicitar num
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,msg
    MOV rdx,lenMsg
    SYSCALL
    
    ;captura del num
    MOV rax,0x00
    MOV rdi,0x00
    MOV rsi,num
    MOV rdx,0x04
    SYSCALL
    
    ;print 0
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,a
    MOV rdx,0x04
    SYSCALL

    ;print 1

    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,b
    MOV rdx,0x04
    SYSCALL

.for: ;for
    MOV rcx,0x02
    INC rcx
    cmp rcx,num

    JG .out
    JMP .for



    ;comprueba num
    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,num
    MOV rdx,0x04
    SYSCALL
.out:
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

