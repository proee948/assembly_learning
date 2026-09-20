.intel_syntax noprefix
.global _start

.text
_start:
    mov rax, 4333431242423
    call _itoa
    call _strlen
    call _print
    mov rax, 60
    xor rdi, rdi
    syscall

_itoa:
    mov r9, 10
    lea rdi, [buf + 32]
    mov byte ptr [rdi], 0
extraction_loop:
    xor rdx, rdx
    div r9
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz extraction_loop
    mov rax, rdi
    ret

_strlen:
    mov rsi, rax
    xor rdx, rdx
str_loop:
    mov bl, [rax]
    cmp bl, 0
    je done
    inc rdx
    inc rax
    jmp str_loop
done:
    ret

_print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

.data
buf: .skip 1024
