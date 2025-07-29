section .data

section .bss
    buffer resb 20

section .text
    global _start 

_start:
    mov rax , 12345
    mov rbx , 10
    mov rdi , buffer+20

_convert:
    mov rdx , 0
    div rbx 
    dec rdi
    add dl , '0'
    mov [rdi] , dl

    cmp rax , 0
    jne _convert

    mov rax , 1
    mov rsi , rdi
    mov rdi , 1
    mov rdx , buffer+20
    sub rdx , rsi
    syscall

    mov rax , 60
    mov rdi , 0
    syscall
