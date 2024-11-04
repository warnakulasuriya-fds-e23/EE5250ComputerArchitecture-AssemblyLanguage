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
    11                                  ;display msg1
    12 00000000 BA17000000              mov edx,23	;msg length
    13 00000005 B9[00000000]            mov ecx, msg1	;pointer to variable
    14 0000000A BB01000000              mov ebx, 1	;stdout
    15 0000000F B804000000              mov eax, 4	;syscall numeber sys_write
    16 00000014 CD80                    int 0x80
    17                                  
    18                                  
    19 00000016 BB00000000              mov ebx,0 	;stdin
    20 0000001B B9[00000000]            mov ecx, inbuf	;pointer to variable (storage-location)
    21 00000020 BA01000000              mov edx, 1	;number of bytes to rad
    22 00000025 B803000000              mov eax, 3	;syscall number for sys_read
    23 0000002A CD80                    int 0x80
    24                                  
    25 0000002C B801000000              MOV eax, 1
    26 00000031 BB1E000000              MOV ebx, 30
    27 00000036 CD80                    INT 80h;this is the interrupt address
    28                                  
    29                                  
