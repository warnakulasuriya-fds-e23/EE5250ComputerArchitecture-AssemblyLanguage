     1                                  section .data
     2                                  section .bss
     3 00000000 ????????????????        	buf resb 8
     4                                  section .text
     5                                  global _start
     6                                  
     7                                  _start:
     8                                  
     9 00000000 B834120000              MOV eax, 1234h
    10 00000005 BB78560000              MOV ebx, 5678h
    11 0000000A 01D8                    add eax,ebx; result in eax
    12 0000000C A3[00000000]            mov [buf], eax
    13                                  
    14 00000011 BB00000000              mov ebx,0; return value (parameter of "exit")
    15 00000016 B801000000              mov eax,1; system call "exit"
    16 0000001B CD80                    int 0x80; call interrupt no. 80h
    17                                  
    18                                  
