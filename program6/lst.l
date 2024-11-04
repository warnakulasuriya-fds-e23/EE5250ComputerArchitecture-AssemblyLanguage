     1                                  section .data
     2 00000000 0A0D456E7465722061-     	msg1 db 0xa, 0xd, "Enter a Digit (0-9): "
     2 00000009 204469676974202830-
     2 00000012 2D39293A20         
     3 00000017 0A0D53717561726564-     	msg2 db 0xa, 0xd, "Squared value is"
     3 00000020 2076616C7565206973 
     4                                  section .bss
     5 00000000 ??                      	inbuf resb 1
     6 00000001 ????                    	outbuf resb 2
     7                                  section .text
     8                                  global _start
     9                                  
    10                                  _start:
    11                                  
    12                                  ;Input
    13                                  ;display msg1
    14                                  ;write to stdout (console)
    15 00000000 BA17000000              mov edx,23	;msg length
    16 00000005 B9[00000000]            mov ecx, msg1	;pointer to variable
    17 0000000A BB01000000              mov ebx, 1	;stdout
    18 0000000F B804000000              mov eax, 4	;syscall numeber sys_write
    19 00000014 CD80                    int 0x80
    20                                  
    21                                  ;read from stdin (keyboard)
    22 00000016 BB00000000              mov ebx,0 	;stdin
    23 0000001B B9[00000000]            mov ecx, inbuf	;pointer to variable (storage-location)
    24 00000020 BA01000000              mov edx, 1	;number of bytes to rad
    25 00000025 B803000000              mov eax, 3	;syscall number for sys_read
    26 0000002A CD80                    int 0x80
    27                                  
    28 0000002C A0[00000000]            mov al, byte[inbuf]
    29 00000031 2C30                    sub al, '0'
    30 00000033 F6E0                    mul al
    31 00000035 B30A                    mov bl, 10
    32 00000037 F6F3                    div bl
    33 00000039 0430                    add al, '0'
    34 0000003B 80C430                  add ah, '0'
    35 0000003E 66A3[01000000]          mov word[outbuf], ax 	; note that ax is the union of ah and al, we use word because we are sending more than one byte at once
    36                                  
    37                                  ;display the outbuffer
    38                                  ;write "Squared Value is" to stdout (console)
    39 00000044 BA13000000              mov edx,19      ;msg length
    40 00000049 B9[17000000]            mov ecx, msg2   ;pointer to variable
    41 0000004E BB01000000              mov ebx, 1      ;stdout
    42 00000053 B804000000              mov eax, 4      ;syscall numeber sys_write
    43 00000058 CD80                    int 0x80
    44                                  
    45                                  ;write the results to  (console)
    46 0000005A BA02000000              mov edx,2      ;msg length
    47 0000005F B9[01000000]            mov ecx, outbuf   ;pointer to variable
    48 00000064 BB01000000              mov ebx, 1      ;stdout
    49 00000069 B804000000              mov eax, 4      ;syscall numeber sys_write
    50 0000006E CD80                    int 0x80
    51                                  
    52                                  
    53                                  
    54 00000070 B801000000              MOV eax, 1
    55 00000075 BB1E000000              MOV ebx, 30
    56 0000007A CD80                    INT 80h;this is the interrupt address
    57                                  
    58                                  
