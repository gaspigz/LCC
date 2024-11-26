.data
    str: .asciz "%d"
.text
.global leaveMio
.global calculo
# rdi tiene a byte
# rsi tiene b byte
# rdx tiene c byte
# rcx tiene d l
# r8 tiene e byte
# r9 tiene f byte
# 8(rbp) tendra direccion de retorno por call
# 16(rbp) tiene g quad
# 24(rbp) tiene h l
# 32(rbp) tiene i l
# 40(rbp) tiene j l


.global main

main:
    pushq %rbp
    movq %rsp, %rbp
    subq $8, %rsp # Alineo la pila con los primeros 8 y en los otros 8 guardo e
    movq $5, (%rsp) # pongo e = 5
    # Variables por registros
    movq $1, %rdi # a
    movq $2, %rsi # b
    movq $3, %rdx # c
    movq $4, %rcx # d
    movq $5, %r8 # e
    movq $1, %r9 # f
    # Variables por pila
    subq $32, %rsp # Hago lugar para Variables, queda alineada porque 32 = 16 * 2
    movq $2, (%rsp) # g
    movq $6, 8(%rsp) # h
    movq $7, 16(%rsp) # i
    movq $8, 24(%rsp) # j
    call calculo

    movq $str, %rdi # Paso cadena
    movq %rax, %rsi # Paso parametro a printf
    call printf

    movq %rbp, %rsp # Epilogo
    popq %rbp
    
    ret

calculo:
    pushq %rbp
    movq %rsp, %rbp # Prologo

    # Actualmente el primer argumento de pila esta asi:
    # dir retorno main
    # rbp main
    # libre alineacion
    # e
    # 8 # j +40
    # 7 # i +32
    # 6 # h +24
    # 2.0 # g +16
    # dir retorno calculo +8
    # rbp nuevo calculo

    # r10 = a + c + d
    # r11 i + j
    # rax = r10 * r11

    # Inicializo
    movq $0, %rax
    movq $0, %r10
    movq $0, %r11

    addq %rdi, %r10
    addq %rdx, %r10
    addq %rcx, %r10
    # Listo r10

    addq 32(%rbp), %r11
    addq 40(%rbp), %r11

    movq %r11, %rax
    imulq %r10 # en rax guarda r10 * rax = r10 * r11

    movq %rbp, %rsp # Epilogo
    popq %rbp
    ret

leaveMio:
    movq %rsp, %rbp # Vuelve la pila a la base
    popq %rbp # Popeo la base
    ret

#d) No la vemos necesaria puesto que al ejecutar leave, volvemos a la base de la pila y ya la pila queda restaurada.
