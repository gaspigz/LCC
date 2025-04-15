@ vim:ft=armv5
.text
.global main
main:
    mov r2, #0x29, 22
    mov r2, #0xF6, 30
    mov r2, #0x66, 26
    mvn r2, #0xFF
    mvn r2, #0

    mov r0, #0
    bx lr

