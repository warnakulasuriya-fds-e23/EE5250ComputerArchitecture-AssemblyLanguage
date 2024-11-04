     1                                  section .data
     2 00000000 0A0D456E7465722061-     	msg1 db 0xa, 0xd, "Enter a Digit (0-9): "
     2 00000009 204469676974202830-
     2 00000012 2D39293A20         
     3                                  section .bss
     4 00000000 ??                      	inbuf resb 1
     5                                  section .text
     6                                  global _start
     7                                  
     8                                  _start:
     9                                  
    10                                  ;Input
    11 00000000 BB00000000              mov ebx,0 	;stdin
    12 00000005 B9[00000000]            mov ecx, inbuf	;pointer to variable (storage-location)
    13 0000000A BA01000000              mov edx, 1	;number of bytes to rad
    14 0000000F B803000000              mov eax, 3	;syscall number for sys_read
    15 00000014 CD80                    int 0x80
    16                                  
    17 00000016 B801000000              MOV eax, 1
    18 0000001B BB1E000000              MOV ebx, 30
    19 00000020 CD80                    INT 80h;this is the interrupt address
    20                                  
    21                                  
