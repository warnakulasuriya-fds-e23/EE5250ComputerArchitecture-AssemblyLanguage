exe. : obj.o
	ld -m elf_i386 -o exe.x obj.o

obj.o:prog05.asm
	nasm -f elf -o obj.o -l lst.l prog05.asm
