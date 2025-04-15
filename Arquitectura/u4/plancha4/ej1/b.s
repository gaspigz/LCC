@ vim:ft=armv5
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.global main
main:
    mov r0, #1          @ x
    mov r1, #2          @ y
    ldr r2, =array      @ dir. inicial array
    ldr r3, [r2, #32]   @ r2 + 8*4 (array[8])
    add r3, r3, r1
    str r3, [r2, #40]   @ r2 + 10*4 (array[10])

    mov r0, #0
    bx lr
