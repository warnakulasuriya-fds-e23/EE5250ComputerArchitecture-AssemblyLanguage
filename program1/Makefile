exe. : obj.o
	ld -m elf_i386 -o exe.x obj.o

obj.o:prog01.asm
	nasm -f elf -o obj.o -l lst.l prog01.asm
