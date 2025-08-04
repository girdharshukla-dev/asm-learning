section .data

section .bss
    buffer resb 100

section .text
    global _start

_start:
    call _input
    
    mov rax , 60
    mov rdi , 0
    syscall

_input:
    mov rax , 0
    mov rdi , 0
    mov rsi , buffer
    mov rdx , 100
    syscall                     ; this is all for taking the input

    mov r8 , rax                ; this is for storing the size of input
    mov r9 , rsi                ; this is for storing the beginning of the string

    mov rdx , rax               ; this stores the size of input in rdx                
    add rdx , rsi               ; the rdx is now 2 bytes past the end of the string
    sub rdx , 2                 ; the rdx now clearly points to the end of the string
    call _reverse

_reverse:
    cmp rsi , rdx
    jge _end

    mov al , [rsi]
    mov bl , [rdx]
    mov [rsi] , bl
    mov [rdx] , al
    inc rsi
    dec rdx
    jmp _reverse

_end:
    mov rax , 1
    mov rdi , 1
    mov rsi , r9
    mov rdx , r8
    syscall 

    mov rax , 60
    mov rdi , 0
    syscall