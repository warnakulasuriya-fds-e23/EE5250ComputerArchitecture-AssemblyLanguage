     1                                  section .data
     2                                  section .bss
     3                                  section .text
     4                                  global _start
     5                                  
     6                                  _start:
     7                                  
     8 00000000 B801000000              MOV eax, 1
     9 00000005 BB1E000000              MOV ebx, 30
    10 0000000A CD80                    INT 80h;this is the interrupt address
    11                                  
    12                                  
