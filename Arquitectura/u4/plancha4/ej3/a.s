@ vim:ft=armv5
.data
a: .word 0

.text
.global main
main:
    setend le               @ Little-Endian
    ldr r3, =a              @ Cargamos la dirección de a pues 0x8000 no es una dirección a la que podríamos acceder
    ldr r6, =0xBEEFFACE     @ Pseudo-instrucción LDR
    str r6, [r3]
    ldrb r4, [r3]

    mov r0, #0
    bx lr
