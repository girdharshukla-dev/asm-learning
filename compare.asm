section .data
    msg_eq db "Equal",10
    msg_neq db "NotEqual",10

section .text
    global _start

_start:
    mov rax , 5
    mov rbx , 7
    cmp rax , rbx
    je equal
    jne notequal

equal:
    mov rsi , msg_eq
    mov rdx , 6
    jmp print

notequal:
    mov rsi , msg_neq
    mov rdx , 9
    jmp print

print:
    mov rax , 1
    mov rdi , 1
    syscall

    mov rax , 60
    mov rdi , 0
    syscall