@ vim:ft=armv5
.data
str1:   .asciz "%f\n"
str2:   .asciz "La suma de las componentes es: %f\n"
.align 4
a:      .float 1.0, 2.0, 3.0, 4.0, 5.0
b:      .float 2.0, 4.0, 6.0, 8.0, 10.0
c:      .space 5*8          @ 5 bytes

.text
.global main
main:
    push {lr, ip, v1-v4}    @ ip para alinear pila (a 8 bytes, cantidad par incluyendo los FPU)
    vpush.f32 {s16, s17}

    veor.f64 d8, d8, d8     @ suma (s16) (veor sólo existe para registros d)
    mov v1, #0              @ i
    ldr v2, =a
    ldr v3, =b
    ldr v4, =c
bucle:
    cmp v1, #5
    beq fin_bucle
    
    add r0, v4, v1, lsl #2
    add r1, v2, v1, lsl #2
    add r2, v3, v1, lsl #2
    vldr.f32 s0, [r0]       @ c[i]
    vldr.f32 s1, [r1]       @ a[i]
    vldr.f32 s2, [r2]       @ b[i]
    vadd.f32 s0, s0, s1
    vadd.f32 s0, s0, s2 
    vstr.f32 s0, [r0]
    vmov.f32 s17, s0        @ c[i] callee-saved para después

    vcvt.f64.f32 d0, s0     
    vmov r2, r3, d0
    ldr r0, =str1
    bl printf

    vadd.f32 s16, s16, s17
    
    add v1, v1, #1
    b bucle
fin_bucle:
    vcvt.f64.f32 d0, s16
    vmov r2, r3, d0
    ldr r0, =str2
    bl printf
    
    vpop.f32 {s16, s17}
    pop {lr, ip, v1-v4}
    mov r0, #0
    bx lr
