@ vim:ft=armv5
.data
a: .word 0, 0

.text
.global main
main:
    setend le               @ Little-Endian primero (hipótesis: para cargar bien las constantes del literal-pool)
    ldr r3, =a              @ Cargamos la dirección de a pues 0x8000 no es una dirección a la que podríamos acceder
    ldr r6, =0xBEEFFACE     @ Pseudo-instrucción LDR

    setend be               @ Hacemos la operacion Big-Endian
    str r6, [r3]
    ldrb r4, [r3]
    setend le               @ Volvemos a Little-Endian para evitar crash

    mov r0, #0
    bx lr
