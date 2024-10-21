     1                                  section .data
     2                                  section .bss
     3 00000000 ????????????????                buf resb 8
     4                                  section .text
     5                                  global _start
     6                                  
     7                                  _start:
     8                                  
     9                                  ; going to add following to hexadecimals
    10                                  ; 5F0000001 and
    11                                  ; 310001010
    12                                  
    13                                  ;have to split the first number as  5| F0000001 because 5F0000001 itself is too big
    14                                  ;similiarly 3| 10001010
    15 00000000 B8010000F0              mov eax, 0F0000001h; when writing hexadecimals always put an additional 0 in front
    16 00000005 BB10100010              mov ebx, 010001010h;
    17 0000000A 01D8                    add eax, ebx; resuls stored to eax
    18 0000000C 89C1                    mov ecx, eax; results additionally stored in ecx
    19                                  ;now the remaining parts of the large numbers need to be processed
    20 0000000E B805000000              mov eax, 5h; now the remaining 5 part of the 5| F0000001 split number
    21 00000013 BB03000000              mov ebx,3h; now the remaining 3 part of the 3 | 10001010 split number
    22 00000018 11D8                    adc eax, ebx; now adding while  considering CF (carry flag) then result will be stored in eax
    23                                  
    24 0000001A BB00000000              mov ebx,0; going to return 0 with the system call for exit
    25 0000001F B801000000              mov eax,1; system call for "exit"
    26 00000024 CD80                    int 0x80 ; call to interrupt no 80h
