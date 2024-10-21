exe. : obj.o
	ld -m elf_i386 -o exe.x obj.o

obj.o:prog04.asm
	nasm -f elf -o obj.o -l lst.l prog04.asm
