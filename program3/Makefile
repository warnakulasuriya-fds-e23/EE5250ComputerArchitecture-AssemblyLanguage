exe. : obj.o
	ld -m elf_i386 -o exe.x obj.o

obj.o:prog03.asm
	nasm -f elf -o obj.o -l lst.l prog03.asm
