section .data 
    newline db 0xA

section .text
    global _start 

_start:
    ; mov rcx , rdi   ; this is the number of arguments , basically the int argc
    ; mov rbx , rsi   ; this is the actual arguments , basically the char** argv
    mov rbx , rsp
    mov rcx , [rsp]
    lea rbx , [rbx+8]

_loop_args:
    cmp rcx , 1
    je _exit

    mov rdi , [rbx]
    
    call _print

    add rbx , 8
    dec rcx
    jmp _loop_args

_exit:
    mov rax , 60
    mov rdi , 0
    syscall

_print:
    push rdi
    mov rsi , rdi
    mov rax , 0

_findLen:
    cmp byte [rsi] , 0
    je _gotLen
    inc rsi
    jmp _findLen

_gotLen:
    mov rdx , rsi
    pop rsi 
    sub rdx , rsi
    mov rax , 1
    mov rdi , 1
    syscall

    ;this is forprinting a new line
    mov rax , 1 
    mov rdi , 1 
    mov rsi , newline
    mov rdx , 1
    syscall
    ret