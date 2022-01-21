Section .data
aMsg: db "Input Number:",0x20,0x00
lenA: equ $ - aMsg
bMsg: db "Number:",0x20,0x00
lenB: equ $ - bMsg
init: db 0x0A,0x0D,0x00
lenInit: equ $ - init
Section .bss
num resq 0x01
Section .text
global _Input
_Input:
    PUSH rbp
    MOV rbp,rsp

    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,aMsg
    MOV rdx,lenA
    SYSCALL
    
    MOV rax,0x00
    MOV rdi,0x00
    MOV rsi,num
    MOV rdx,0X04
    SYSCALL

    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,bMsg
    MOV rdx,lenB
    SYSCALL

    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,num
    MOV rdx,0x04
    SYSCALL

    MOV rax,0x01
    MOV rdi,0x01
    MOV rsi,init
    MOV rdx,lenInit
    SYSCALL


    MOV rsp,rbp
    POP rbp
    MOV rax,60
    MOV rdi,0
    SYSCALL

