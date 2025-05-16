# hw11: Print out data in ASCII hex

## AUTHORING
- **Author:** Connor Myers
- **Affiliation:** UMBC / CMSC 313 - Section 04, 10am, Spring 2025
- **Date:** 05/15/2025

## FILES
- hw11.asm    - NASM source code

## DESCRIPTION

The program reads 8 bytes of input from `inputbuf`, translates each byte into its **2-digit hexadecimal ASCII representation**, and stores the result in `outputbuf`.
Each byte is separated by a space, amd the output ends with a newline character.

### Example Output

`83 6A 88 DE 9A C3 54 9A`

## Compiling

on the GL server upload hw11.asm. Then run the following commands


    nasm -f elf32 hw11.asm -o hw11.o
    ld -m elf_i386 hw11.o -o hw11
    ./hw11
