section .data
	msg1 db 0xa, 0xd, "Enter a Digit (0-9): "
	msg2 db 0xa, 0xd, "Squared value is"
section .bss
	inbuf resb 1
	outbuf resb 2
section .text
global _start

_start:

;Input
;display msg1
;write to stdout (console)
mov edx,23	;msg length
mov ecx, msg1	;pointer to variable
mov ebx, 1	;stdout
mov eax, 4	;syscall numeber sys_write
int 0x80

;read from stdin (keyboard)
mov ebx,0 	;stdin
mov ecx, inbuf	;pointer to variable (storage-location)
mov edx, 1	;number of bytes to rad
mov eax, 3	;syscall number for sys_read
int 0x80

mov al, byte[inbuf]
sub al, '0'
mul al
mov bl, 10
div bl
add al, '0'
add ah, '0'
mov word[outbuf], ax 	; note that ax is the union of ah and al, we use word because we are sending more than one byte at once

;display the outbuffer
;write "Squared Value is" to stdout (console)
mov edx,19      ;msg length
mov ecx, msg2   ;pointer to variable
mov ebx, 1      ;stdout
mov eax, 4      ;syscall numeber sys_write
int 0x80

;write the results to  (console)
mov edx,2      ;msg length
mov ecx, outbuf   ;pointer to variable
mov ebx, 1      ;stdout
mov eax, 4      ;syscall numeber sys_write
int 0x80



MOV eax, 1
MOV ebx, 30
INT 80h;this is the interrupt address


