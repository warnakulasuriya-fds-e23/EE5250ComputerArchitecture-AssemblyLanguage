exe.x:obj.o
	ld -m elf_i386 -o exe.x obj.o

obj.o:helloWorld.asm
	nasm -f elf -o obj.o -l lst.l helloWorld.asm


