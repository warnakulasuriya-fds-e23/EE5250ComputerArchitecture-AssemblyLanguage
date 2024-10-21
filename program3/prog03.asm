section .data
section .bss
	buf resb 8
section .text
global _start

_start:

MOV eax, 1234h
MOV ebx, 5678h
add eax,ebx; result in eax
mov [buf], eax

mov ebx,0; return value (parameter of "exit")
mov eax,1; system call "exit"
int 0x80; call interrupt no. 80h


