section .data
    newline db 0xA

section .text 
    global _start

_start:
    mov rcx, rdi   ; argc
    mov rbx, rsi   ; argv

_loop_args:
    cmp rcx, 0
    je _exit

    mov rdi, [rbx]   ; Correct: dereference argv
    sub rsp, 8       ; Align stack
    call _print
    add rsp, 8       ; Restore stack

    add rbx, 8
    dec rcx
    jmp _loop_args

_exit:
    mov rax , 60
    mov rdi , 0
    syscall

_print:
    mov rsi, rdi     ; Save string pointer
    xor rcx, rcx     ; Counter

_findLen:
    cmp byte [rsi + rcx], 0
    je _gotLen
    inc rcx
    jmp _findLen

_gotLen:
    mov rdx, rcx     ; Length
    mov rax, 1       ; sys_write
    mov rdi, 1       ; stdout
    syscall

    ; Newline (unchanged)
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    ret