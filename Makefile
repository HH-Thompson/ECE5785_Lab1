PICO_TOOLCHAIN_PATH = /Users/emilyerickson/.pico-sdk/toolchain/13_2_Rel1/

CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as

LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

main.i: main.c
	$(CPP) main.c > main.i

hello.txt:
	echo "hello world!" > hello.txt

# .o file depends on .s; assember takes .s file and turns it into .o file of same name
%.o: %.s
	$(AS) $< -o $@

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

all: firmware.elf

.PHONY: clean all

clean:
	rm -f main.i hello.txt


