section .data

section .bss
    buffer resb 20

section .text
    global _start

_start:
    mov rax , 0
    mov rdi , 0
    mov rsi , buffer
    mov rdx , 20
    syscall

    mov rax , 0
    mov rcx , 0

_convert:
    mov bl , [buffer+rcx]
    cmp bl , 10             ; this is for cheking for a new line
    je _doneConvert

    sub bl , '0'
    mov rdx , 10
    mul rdx                 ; rax = rax*10
    movzx rbx , bl
    add rax , rbx
    inc rcx
    jmp _convert
    
_doneConvert:
    add rax , 1
    ; now we are converting it back to ascii 
    mov rbx , 10
    lea rdi , [buffer+20]

_convertBack:
    mov rdx , 0
    div rbx
    add dl , '0'
    dec rdi
    mov [rdi] , dl

    cmp rax , 0
    jne _convertBack

    mov rax , 1
    mov rsi , rdi
    mov rdi , 1
    mov rdx , buffer
    add rdx , 20
    sub rdx , rsi
    syscall 

    mov rax , 60
    mov rdi , 0
    syscall