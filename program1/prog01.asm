section .data
section .bss
section .text
global _start

_start:

MOV eax, 1
MOV ebx, 30
INT 80h;this is the interrupt address


