@ vim:ft=armv5
.global campesino_ruso
campesino_ruso:
    @ Observamos que el código dado en C funciona correctamente si la condición del while es `j >= 1`
    @ y se devuelve sólo `res`.

    @ r0 <- i
    @ r1 <- j
    @ r2 <- res

    mov r2, #0          @ Reset r2
bucle:
    tst r1, #1
    addne r2, r2, r0
    subne r1, r1, #1
    lsleq r0, #1
    lsreq r1, #1
    tst r1, r1
    bne bucle
    
    mov r0, r2
    bx lr
