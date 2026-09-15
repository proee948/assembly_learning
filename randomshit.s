.intel_syntax noprefix
.global _start

.text
_start:
xor rcx,rcx
xor rax,rax
call _strlen
call _print

_strlen:
 lea rax,[s2]
 str_loop:
 mov bl,[rax]
 cmp bl,0
 je done
 inc rcx
 inc rax
 jmp str_loop
 done:
 mov rax,rcx
 ret

_print:
 ;#int3
 mov r9,rax
 xor rax,rax

 mov rax,1
 mov rdi,1
 lea rsi,[s2]
 mov rdx,r9
 syscall

.data
s1: .string "123456789"
s2: .string "string2"
.bss
