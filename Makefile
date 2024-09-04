PICO_TOOLCHAIN_PATH = /Users/emilyerickson/.pico-sdk/toolchain/13_2_Rel1/

CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp

main.i: main.c
	$(CPP) main.c > main.i