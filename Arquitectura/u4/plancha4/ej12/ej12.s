@ vim:ft=armv5
.data
a:   .word 1, 2, 3, 4
b:   .word 2, 3, 4, 5
str: .asciz "La suma es: %d\n"

.text
.global main
main:
    mov r2, #4
    push {lr, r2}   @ Guardamos r2 en la pila porque técnicamente es una variable local (y la pila queda alineada a 8 bytes)
    ldr r0, =a
    ldr r1, =b
    bl suma
    mov r1, r0
    ldr r0, =str
    bl printf
    
    mov r0, #0
    pop {lr, r2}
    bx lr


suma:
    push {r4,r5}
    mov r3, #0      @ i
    mov r4, #0      @ result
bucle:
    cmp r2, r3
    beq fin
    
    ldr r5, [r0, r3, LSL #2]
    add r4, r4, r5
    ldr r5, [r1, r3, LSL #2]
    add r4, r4, r5

    add r3, #1
    b bucle
fin:
    mov r0, r4
    pop {r4,r5}
    bx lr
