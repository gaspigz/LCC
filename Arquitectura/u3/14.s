.data
    str: .asciz "%d %d"
.text
.global main
main:
    pushq %rbp # Alineamos stack
    movq %rdi, %rax # Guardo el primer parametro en r8, usare rdi para printf
    # Como hago para pasarle el primer argumento a printf sin moverlos todos de lugar ?
    leaq str, %rdi
    movq %rsi, %rdx
    movq %rax, %rsi
    movb $0, %al
    call printf
    popq %rbp


    ret