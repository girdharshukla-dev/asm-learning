section .data
    msg db "Hello World",0xA
    msg_len equ $-msg

section .text
    global _start

%macro EXIT 0
    mov rax , 60
    mov rdi , 0
    syscall
%endmacro

%macro PRINT 2
    mov rax , 1
    mov rdi , 1
    mov rsi , %1
    mov rdx , %2
    syscall
%endmacro

_start:
    PRINT msg , msg_len

    EXIT