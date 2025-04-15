@ vim:ft=armv5
.text
.global main
main:
    mov r7, #0x8C, 4
    mov r7, #0x42, 30
    mvn r7, #2
    mvn r7, #0x8C, 4

    mov r0, #0
    bx lr
