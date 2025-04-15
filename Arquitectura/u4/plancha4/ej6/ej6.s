@ vim:ft=armv5
.text
.global main
main:
    mov r0, #0xD3, 2        @ 0xc0000034
    ldr r0, =0x12340000     @ Aprovechamos que ldr se traduce a un MOV si es posible
    ldr r0, =0x77777777
    mvn r0, #0              @ 0xffffffff
    mvn r0, #1              @ 0xfffffffe

    mov r0, #0
    bx lr
