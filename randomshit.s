.intel_syntax noprefix
.global _start

.text
_start:


lea rax,[s1] # arg
call _print  # print(arg)

_strlen:
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
 mov r8,rax
 call _strlen
 int3
 mov r9,rax
 xor rax,rax

 mov rsi,r8
 mov rax,1
 mov rdi,1
 mov rdx,r9

 syscall

.data
s1: .string "123456789"
s2: .string "masovanstring768"
.bss
