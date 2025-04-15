@ vim:ft=armv5
.data
arr: .word 1, 2, 0xffffffff, 0xaabbccdd

.text
.global main
main:
    ldr r3, =arr            @ Usamos una dirección de memoria real para evitar segfault
    ldr r12, =0x11223344    @ Pseudo-instrucción LDR
    ldr r12, [r3, #12]!

    mov r0, #0
    bx lr
