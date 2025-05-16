; File: hw11.asm
; Purpose: Convert bytes in inputBug to ASCII hex and print

section .data
    inputBuf db 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A
    hexDigits db "0123456789ABCDEF"

section .bss
    outputBuf resb 80

section .text
    global _start

_start:
    mov esi, inputBuf
    mov edi, outputBuf
    mov ecx, 8

convert_loop:
    movzx eax, byte [esi]
    inc esi

    ; high nibble
    mov ebx,eax
    shr ebx, 4
    and ebx, 0x0F
    mov bl, [hexDigits + ebx]
    mov [edi], bl
    inc edi

    ; low nibble
    and eax, 0x0F
    mov bl, [hexDigits + eax]
    mov [edi], bl
    inc edi

    mov byte [edi], ' '
    inc edi

    loop convert_loop

    ; newline at the end of outputbuf
    mov byte [edi], 0x0A
    inc edi

    ; output
    sub edi, outputBuf
    mov edx, edi
    mov ecx, outputBuf
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
