section .data
    msg1 db "69",10
    msg2 db "70",10
    msg3 db "71",10
    msg4 db "72",10
    msg5 db "73",10

section .text
    global _start 

_start:
    mov rax , msg1
    push rax

    mov rax , msg2
    push rax

    mov rax , msg3
    push rax

    mov rax , 1
    mov rdi , 1
    mov rsi , [rsp]
    mov rdx , 3
    syscall
    
    mov rax , 60
    mov rdi , 0
    syscall