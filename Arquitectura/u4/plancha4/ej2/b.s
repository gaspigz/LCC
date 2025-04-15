@ vim:ft=armv5
.data
arr: .word 0xffffffff, 2, 3, 4

.text
.global main
main:
    ldr r3, =arr            @ Usamos una dirección de memoria real para evitar segfault
    ldr r7, =0x11223344     @ Pseudo-instrucción LDR
    strb r7, [r3], #4

    mov r0, #0
    bx lr
