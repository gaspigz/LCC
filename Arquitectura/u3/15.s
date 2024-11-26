.data
    fmt: .string "%d"
    entero: .long -100
    funcs:  .quad f1
            .quad f2
            .quad f3
.text

f1: movl $0, %esi; movq $fmt, %rdi; call printf; jmp fin # Cada una de estas printea el numero correspondiente
f2: movl $1, %esi; movq $fmt, %rdi; call printf; jmp fin
f3: movl $2, %esi; movq $fmt, %rdi; call printf; jmp fin

.global main
main:
    pushq %rbp # Alinea la pila
    movq %rsp, %rbp # Que el tope apunte a la nueva base
    # Leemos el entero.
    movq $entero, %rsi # Guarda el entero en rsi
    movq $fmt, %rdi # Guarda el string en rdi
    xorq %rax, %rax # Limpia rax
    call scanf # Guarda en rsi!!
    xorq %rax, %rax # Limpia rax
    #Si meti un 0 en rsi, ejecutar f1, si rsi tiene un 1 ejecutar f2 y 2 f3
    
    
    jmp *%rdx # Jump a lo que este dentro de rdx
fin:
    movq %rbp, %rsp
    popq %rbp
    ret