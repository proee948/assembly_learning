.intel_syntax noprefix
.global _start

.text
_start:
xor rcx,rcx
xor rax,rax
lea rax,s1
call _strlen
int3

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

.data
s1: .string "123456789"
s2: .string "string2"
.bss
