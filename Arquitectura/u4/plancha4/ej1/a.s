@ vim:ft=armv5
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.global main
main:
    mov r0, #1          @ x
    mov r1, #2          @ y
    ldr r2, =array      @ dir. inicial array
    ldr r0, [r2, #28]   @ r2 + 4*7 (array[7])
    add r0, r0, r1

    mov r0, #0
    bx lr
