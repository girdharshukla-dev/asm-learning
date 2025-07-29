section .data
    text1 db "Enter number 1 : "
    text1_len equ $-text1
    text2 db "Enter number 2 : "
    text2_len equ $-text2

section .bss
    num1 resb 4
    num2 resb 4

section .text
    global _start

_start:
    call _input1

    mov rax , 60
    mov rdi , 0
    syscall
    
_input1:
    mov rax , 1
    mov rdi , 1
    mov rsi , text1
    mov rdx , text1_len
    syscall
    
    mov rax , 0
    mov rdi , 0
    mov rsi , num1
    mov rdx , 4
    syscall 
    mov rbx , rax

    mov rax , 1
    mov rdi , 1
    mov rsi , num1 
    mov rdx , rbx
    syscall
    ret
