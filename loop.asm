section .data
    msg db "hello",10
    msg_len equ $-msg

section .text
    global _start

_start:
    mov r8 , 0
    call _customLoop
    
    mov rax , 60
    mov rdi , 0
    syscall

_customLoop:
    call _print
    inc r8
    cmp r8 , 5
    jne _customLoop
    ret

_print:
    mov rax , 1
    mov rdi , 1
    mov rsi , msg
    mov rdx , msg_len
    syscall
    ret