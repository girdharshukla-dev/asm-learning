section .data
    msg db "Hello, world",10

section .text
    global _start

_start:
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; stdout
    mov rsi, msg        ; message address
    mov rdx, 13         ; correct length (excluding null)
    syscall

    ; Exit properly
    mov rax, 60         ; syscall: exit
    mov rdi, 0      ; status 0
    syscall
