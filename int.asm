section .data
    result db 1

section .text
    global _start

_start: 
    mov rax , 100
    mov rdx , 0
    mov rbx , 3
    div rbx
    
    mov rcx , 10
    mov rdx , 0
    div rcx
    add dl , '0'
    mov [result] , dl
    
    mov rax , 1
    mov rdi , 1
    mov rsi , result
    mov rdx , 1
    syscall
    
    mov rax , 60
    mov rdi , 0
    syscall