@ vim:ft=armv5
.data
arr: .word 1, 2, 3, 4

.text
.global main
main:
    ldr r3, =arr            @ Usamos una dirección de memoria real para evitar segfault
    ldr r6, =0xfafafafa     @ Pseudo-instrucción LDR
    str r6, [r3, #12]

    mov r0, #0
    bx lr
