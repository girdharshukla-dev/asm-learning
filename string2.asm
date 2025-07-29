section .data
    text db "Hello World",10,0

section .text
    global _start

_start:
    mov rax , text
    mov r8 , rax
    mov rbx , 0
    call _count

    mov rax , 60
    mov rdi , 0
    syscall

_count:
    mov cl , [rax]
    cmp cl , 0
    je _done
    inc rax
    inc rbx
    jmp _count

_done:
    mov rax , 1
    mov rdi , 1
    mov rsi , r8
    mov rdx , rbx
    syscall
    ret