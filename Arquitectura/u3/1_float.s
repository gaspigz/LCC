# 1) Implemente en ensamblador la siguiente funci´on:
# void sum(float *a, float *b, int len);
# que suma dos arreglos de flotantes de longitud len dejando el resultado en a. 
# Utilice instruciones escalares (i.e.: addss).

.data
    .align 16
    a: .float 1.0, 2.0, 3.0, 4.0, 5.0
    .align 16
    b: .float 1.0, 2.0, 1.0, 2.0, 1.0
    len: .long 5

.text

.global main
.global sum

main:
    pushq %rbp
    movq %rsp, %rbp
    # --------------

    movq $a, %rdi
    movq $b, %rsi
    xorq %rdx, %rdx
    movl len, %edx
    call sum
    
    # --------------
    movq %rbp, %rsp
    popq %rbp
    ret

sum:
    pushq %rbp
    movq %rsp, %rbp

    # Toma el primer arg en rdi y el segundo en rsi, el tercero en rdx
    # en *rdi tengo a[0]
    #pushq %rdi # Guardo la direccion original de a
    movq %rdx, %rcx # para el loop

suma_arrays:
    movq $0, %rax
    cvtsi2ssq %rax, %xmm0
    addss (%rdi, %rcx, 4), %xmm0
    addss (%rsi, %rcx, 4), %xmm0
    movss %xmm0, (%rdi, %rcx, 4)
    loop suma_arrays

    movq $0, %rax
    cvtsi2ssq %rax, %xmm0
    addss (%rdi, %rcx, 4), %xmm0
    addss (%rsi, %rcx, 4), %xmm0
    movss %xmm0, (%rdi, %rcx, 4)


    movq %rbp, %rsp
    popq %rbp
    ret

