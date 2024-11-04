section .data
	msg1 db 0xa, 0xd, "Enter a Digit (0-9): "
section .bss
	inbuf resb 1
section .text
global _start

_start:

;Input
;display msg1
mov edx,23	;msg length
mov ecx, msg1	;pointer to variable
mov ebx, 1	;stdout
mov eax, 4	;syscall numeber sys_write
int 0x80


mov ebx,0 	;stdin
mov ecx, inbuf	;pointer to variable (storage-location)
mov edx, 1	;number of bytes to rad
mov eax, 3	;syscall number for sys_read
int 0x80

MOV eax, 1
MOV ebx, 30
INT 80h;this is the interrupt address


