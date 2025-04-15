@ vim:ft=armv5
.text
.global main
main:
    mov r3, #0
    mov r7, #0
    ADD r3, r7, #0xff
    ADD r3, r3, #0x300

    mov r0, #0
    bx lr
