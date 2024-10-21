     1                                  section .data
     2 00000000 546573740A              pqr	db	"Test",0xa
     3 00000005 48656C6C6F2C20776F-     msg	db	"Hello, world!",0xa
     3 0000000E 726C64210A         
     4                                  len	equ	$ - msg
     5                                  section .bss
     6                                  section .text
     7                                  global _start
     8                                  _start:
     9                                  
    10 00000000 BA0E000000              mov edx,len ;message length
    11 00000005 B9[05000000]            mov ecx,msg ;pointer to message to write
    12 0000000A BB01000000              mov ebx,1 ;file handle (stdout)
    13 0000000F B804000000              mov eax,4 ;system call number (sys_write)
    14 00000014 CD80                    int 0x80 ; call kernel
    15                                  
    16 00000016 BB00000000              mov ebx,0 ;End: exit code
    17 0000001B B801000000              mov eax,1 ;system call number (sys_exit)
    18 00000020 CD80                    int 0x80 ;call kernel
    19                                  
