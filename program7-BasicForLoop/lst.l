     1                                  section .data
     2 00000000 2A                      	star_c db '*'	; db means define byte
     3                                  section .bss
     4 00000000 ??                      	inbuf resb 1
     5 00000001 ????                    	outbuf resb 2
     6                                  section .text
     7                                  global _start
     8                                  
     9                                  _start:
    10                                  
    11 00000000 B900000000              mov ecx,0	;going to use ecx value as the iterator variable value
    12                                  
    13                                  DISP:
    14 00000005 51                      push ecx	;pushes the value of the ecx into the stack
    15                                  
    16                                  ;---------------
    17                                  ;display *
    18 00000006 BA01000000              mov edx,1      ;msg length
    19 0000000B B9[00000000]            mov ecx, star_c   ;pointer to variable
    20 00000010 BB01000000              mov ebx, 1      ;stdout
    21 00000015 B804000000              mov eax, 4      ;syscall numeber sys_write
    22 0000001A CD80                    int 0x80
    23                                  ;-------------
    24                                  
    25 0000001C 59                      pop ecx		;gets the ecx back from the stack
    26 0000001D 41                      inc ecx		;increments the value of ecx by 1
    27                                  
    28 0000001E 83F90A                  cmp ecx, 10
    29 00000021 7CE2                    jl DISP		;if iterator count is less than 10 then goto DISP again
    30 00000023 7F02                    jg ENDPROG	;if iterator count
    31                                  
    32                                  
    33 00000025 EBDE                    jmp DISP
    34                                  
    35                                  
    36                                  
    37                                  ENDPROG:
    38 00000027 B801000000              MOV eax, 1
    39 0000002C BB05000000              MOV ebx, 5
    40 00000031 CD80                    INT 80h;this is the interrupt address
    41                                  
    42                                  
