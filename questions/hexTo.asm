section .data

section .bss
    buffer resb 100

section .text
    global _start

_start:
    mov rax , 0
    mov rdi , 0
    mov rsi , buffer
    mov rdx , 100
    syscall 

    mov rdx , rax 
    mov rax , 1
    mov rdi , 1
    syscall

    mov rax , 60
    mov rdi , 0
    syscall