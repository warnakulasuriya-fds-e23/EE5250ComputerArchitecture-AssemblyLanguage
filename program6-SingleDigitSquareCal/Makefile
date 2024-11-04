exe. : obj.o
	ld -m elf_i386 -o exe.x obj.o

obj.o:prog06.asm
	nasm -f elf -o obj.o -l lst.l prog06.asm
