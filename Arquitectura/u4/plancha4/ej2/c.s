@ vim:ft=armv5
.data
arr: .word 0xaabbccdd, 2, 0xffffffff, 4

.text
.global main
main:
    ldr r3, =arr            @ Usamos una dirección de memoria real para evitar segfault
    ldr r5, =0x11223344     @ Pseudo-instrucción LDR
    ldrh r5, [r3], #8

    mov r0, #0
    bx lr
