     1                                  section .data
     2 00000000 0A0D456E7465722061-     	msg1 db 0xa, 0xd, "Enter a Digit (0-9): "
     2 00000009 204469676974202830-
     2 00000012 2D39293A20         
     3 00000017 0A0D53717561726564-     	msg2 db 0xa, 0xd, "Squared value is"
     3 00000020 2076616C7565206973 
     4 00000029 0A0D4572726F722120-     	errormsg db 0xa, 0xd, "Error! Invalid Input"
     4 00000032 496E76616C69642049-
     4 0000003B 6E707574           
     5                                  section .bss
     6 00000000 ??                      	inbuf resb 1
     7 00000001 ????                    	outbuf resb 2
     8                                  section .text
     9                                  global _start
    10                                  
    11                                  _start:
    12                                  
    13                                  
    14                                  
    15                                  ;Input
    16                                  ;display msg1
    17                                  ;write to stdout (console)
    18 00000000 BA17000000              mov edx,23	;msg length
    19 00000005 B9[00000000]            mov ecx, msg1	;pointer to variable
    20 0000000A BB01000000              mov ebx, 1	;stdout
    21 0000000F B804000000              mov eax, 4	;syscall numeber sys_write
    22 00000014 CD80                    int 0x80
    23                                  
    24                                  
    25                                  ;read from stdin (keyboard)
    26 00000016 BB00000000              mov ebx,0 	;stdin
    27 0000001B B9[00000000]            mov ecx, inbuf	;pointer to variable (storage-location)
    28 00000020 BA01000000              mov edx, 1	;number of bytes to rad
    29 00000025 B803000000              mov eax, 3	;syscall number for sys_read
    30 0000002A CD80                    int 0x80
    31                                  
    32 0000002C A0[00000000]            mov al, byte[inbuf]	;put the inbuff value in al so that the value in the inbuf could be used in cmp (cannot use inbuf directly in cmp)
    33 00000031 3C30                    cmp al, '0' ; sets flags register
    34 00000033 7C54                    jl ERRORMSG	; jump, if less than ascii value of 0, to ENDPROG (if al<0 jmp to ENDPROG)
    35                                  
    36 00000035 3C39                    cmp al, '9'	;jump, if greater than ascii value of 9, to ENDPROG
    37 00000037 7F50                    jg ERRORMSG ; jumps to the instructino at ENDPRG label
    38                                  
    39 00000039 A0[00000000]            mov al, byte[inbuf]
    40 0000003E 2C30                    sub al, '0'
    41 00000040 F6E0                    mul al
    42 00000042 B30A                    mov bl, 10
    43 00000044 F6F3                    div bl
    44 00000046 0430                    add al, '0'
    45 00000048 80C430                  add ah, '0'
    46 0000004B 66A3[01000000]          mov word[outbuf], ax 	; note that ax is the union of ah and al, we use word because we are sending more than one byte at once
    47                                  
    48                                  ;display the outbuffer
    49                                  ;write "Squared Value is" to stdout (console)
    50 00000051 BA13000000              mov edx,19      ;msg length
    51 00000056 B9[17000000]            mov ecx, msg2   ;pointer to variable
    52 0000005B BB01000000              mov ebx, 1      ;stdout
    53 00000060 B804000000              mov eax, 4      ;syscall numeber sys_write
    54 00000065 CD80                    int 0x80
    55                                  
    56                                  ;write the results to  (console)
    57 00000067 BA02000000              mov edx,2      ;msg length
    58 0000006C B9[01000000]            mov ecx, outbuf   ;pointer to variable
    59 00000071 BB01000000              mov ebx, 1      ;stdout
    60 00000076 B804000000              mov eax, 4      ;syscall numeber sys_write
    61 0000007B CD80                    int 0x80
    62                                  
    63                                  
    64                                  ENDPROG:
    65 0000007D B801000000              MOV eax, 1
    66 00000082 BB1E000000              MOV ebx, 30
    67 00000087 CD80                    INT 80h;this is the interrupt address
    68                                  
    69                                  
    70                                  ERRORMSG:
    71                                  ;write the results to  (console)
    72 00000089 BA17000000              mov edx,23      ;msg length
    73 0000008E B9[29000000]            mov ecx,errormsg   ;pointer to variable
    74 00000093 BB01000000              mov ebx, 1      ;stdout
    75 00000098 B804000000              mov eax, 4      ;syscall numeber sys_write
    76 0000009D CD80                    int 0x80
    77 0000009F EBDC                    jmp ENDPROG
