APP = tutor

all: $(APP)

$(APP): $(APP).o
	ld -m elf_i386 -s -o $(APP) $(APP).o


$(APP).o: $(APP).asm 
	nasm -f elf -g -F dwarf -l $(APP).lst $(APP).asm 

clean:
	rm $(APP)
	rm $(APP).o
	rm $(APP).lst
