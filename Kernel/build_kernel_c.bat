:: This code builds and links everything for you.
nasm kernel_entry.asm -f elf -o kernel_entry.o
gcc -ffreestanding -c kernel32.c -o kernel32.o
ld -T NUL -o kernel32.tmp -Ttext 0x7e00 kernel_entry.o kernel32.o
objcopy -O binary -j .text  kernel32.tmp kernel32.bin
:: Delete useless things.
del kernel32.tmp
del kernel32.o
del kernel_entry.o
:: Pause to see if it worked.
pause
