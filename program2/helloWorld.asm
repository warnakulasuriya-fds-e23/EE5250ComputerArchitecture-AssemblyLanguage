section .data
pqr	db	"Test",0xa
msg	db	"Hello, world!",0xa
len	equ	$ - msg
section .bss
section .text
global _start
_start:

mov edx,len ;message length
mov ecx,msg ;pointer to message to write
mov ebx,1 ;file handle (stdout)
mov eax,4 ;system call number (sys_write)
int 0x80 ; call kernel

mov ebx,0 ;End: exit code
mov eax,1 ;system call number (sys_exit)
int 0x80 ;call kernel

