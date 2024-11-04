section .data
	;msg db "Enter number: ", 0xa
section .bss
	buf resb 8
section .text
global _start

_start:

;read from stdin (keyboard)
mov ebx,0 	;stdin
mov ecx, bug
mov edx,1
mov eax,3
int 0x80


;processing
mov al, byte[buf]
sub al,0x20
mov byte[buf],al

; write to stdout (console)
mov edx, 1	;msg lenght
mov ecx, buf	;pointer to variable
mov ebx, 1	;stdout
mov eax, 4	;syscall number sys_write
int 0x80


MOV eax, 1
MOV ebx, 0
INT 80h;this is the interrupt address


