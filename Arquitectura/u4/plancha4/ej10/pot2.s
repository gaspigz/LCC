@ vim:ft=armv5
.text
.global pot2
pot2:
    mov r1, #1          @ Guardamos #1 pues queremos obtener 2^i = (1<<i)
    mov r0, r1, lsl r0
    bx lr
