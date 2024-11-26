.data
    str: .asciz "%d %d %d %d %d %d %d %d %d\n"
.text
.global main
main:
    pushq %rbp # Prologo
    movq %rsp, %rbp # Prologo
    movq $str, %rdi # Podría ser también con leaq
    movl $1, %esi
    movl $2, %edx
    movl $3, %ecx
    movl $4, %r8d
    movl $5, %r9d
    # argumentos en pila:
    subq $32, %rsp # Reserva espacio en pila
    movq $9, 24(%rsp) # Podria ser tmb -8(%rbp)
    movq $8, 16(%rsp)
    movq $7, 8(%rsp)
    movq $6, 0(%rsp)
    movl $0, %eax # Argumentos en flotante

    # El primer argumento de la pila que toma es el de más abajo

    
    # Ya tengo mis argumentos listos, vamos a printf
    call printf
    # Si hago de nuevo esto no anda call printf

    xorl %eax, %eax # Limpio eax

    movq %rbp, %rsp # Epilogo
    popq %rbp # Epilogo
    ret