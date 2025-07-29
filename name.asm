section .data
    text1 db "What is your name ?" , 10
    text1_len equ $-text1
    text2 db "Hello , " 
    text2_len equ $-text2
    ending db "Have a nice day ahead ....." , 10
    ending_len equ $-ending

section .bss
    buffer resb 100

section .text
    global _start

_start:
    call _printText1
    call _inputName
    call _printText2
    call _printName

    mov rax , 1
    mov rdi , 1
    mov rsi , ending
    mov rdx , ending_len
    syscall

    mov rax , 60
    mov rdi , 0
    syscall
    
_printText1:
    mov rax , 1
    mov rdi , 1
    mov rsi , text1
    mov rdx , text1_len
    syscall
    ret

_printText2:
    mov rax , 1
    mov rdi , 1
    mov rsi , text2
    mov rdx , text2_len
    syscall
    ret

_inputName:
    mov rax , 0
    mov rdi , 0
    mov rsi , buffer
    mov rdx , 100
    syscall
    mov rbx , rax
    ret

_printName:
    mov rax , 1
    mov rdi , 1
    mov rsi , buffer
    mov rdx , rbx
    syscall
    ret
