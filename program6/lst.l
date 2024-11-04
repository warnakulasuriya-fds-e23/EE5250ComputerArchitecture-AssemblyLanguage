     1                                  section .data
     2                                  section .bss
     3 00000000 ??                      	inbuf resb 1
     4                                  section .text
     5                                  global _start
     6                                  
     7                                  _start:
     8                                  
     9                                  ;Input
    10 00000000 BB00000000              mov ebx,0 	;stdin
    11 00000005 B9[00000000]            mov ecx, inbuf	;pointer to variable (storage-location)
    12 0000000A BA01000000              mov edx, 1	;number of bytes to rad
    13 0000000F B803000000              mov eax, 3	;syscall number for sys_read
    14 00000014 CD80                    int 0x80
    15                                  
    16 00000016 B801000000              MOV eax, 1
    17 0000001B BB1E000000              MOV ebx, 30
    18 00000020 CD80                    INT 80h;this is the interrupt address
    19                                  
    20                                  
