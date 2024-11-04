; the reason why this approach is unsuccessful is because the value of ecx which we try to use as the iterator count gets overwritten during the
;execution

section .data
	star_c db '*'	; db means define byte
section .bss
	inbuf resb 1
	outbuf resb 2
section .text
global _start

_start:

mov ecx,0	;going to use ecx value as the iterator variable value

DISP:
;display *
mov edx,1      ;msg length
mov ecx, star_c   ;pointer to variable
mov ebx, 1      ;stdout
mov eax, 4      ;syscall numeber sys_write
int 0x80

inc ecx		;increments the value of ecx by 1

cmp ecx, 10
jl DISP		;if iterator count is less than 10 then goto DISP again
jg ENDPROG	;if iterator count


jmp DISP



ENDPROG:
MOV eax, 1
MOV ebx, 5
INT 80h;this is the interrupt address


