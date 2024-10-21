section .data
section .bss
        buf resb 8
section .text
global _start

_start:

; going to add following to hexadecimals
; 5F0000001 and
; 310001010

;have to split the first number as  5| F0000001 because 5F0000001 itself is too big
;similiarly 3| 10001010
mov eax, 0F0000001h; when writing hexadecimals always put an additional 0 in front
mov ebx, 010001010h;
add eax, ebx; resuls stored to eax
mov ecx, eax; results additionally stored in ecx
;now the remaining parts of the large numbers need to be processed
mov eax, 5h; now the remaining 5 part of the 5| F0000001 split number
mov ebx,3h; now the remaining 3 part of the 3 | 10001010 split number
adc eax, ebx; now adding while  considering CF (carry flag) then result will be stored in eax

mov ebx,0; going to return 0 with the system call for exit
mov eax,1; system call for "exit"
int 0x80 ; call to interrupt no 80h
