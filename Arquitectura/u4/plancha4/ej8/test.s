@ vim:ft=armv5
.text
.global main
main:
    ldr r1, =0x12abcdef

    mov r0, #0
    bx lr
