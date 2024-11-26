.data
    str1: .asciz "Ingrese al menos un argumento\n"
    str2: .asciz "Cantidad de argumentos ingresados: %d. La suma es: %d\n"
.text
.global main
main:
    pushq %rbp
    movq %rsp, %rbp
    movq $0, %r15 # Aca guardo la suma
    cmpq $2, %rdi # Veo el si la cantidad de argumentos es menor a 2
    jl fin_cant
    movq %rdi, %rcx # Guardo en rcx (para los loops) la cantidad de argumentos
    decq %rcx # Saco uno por el nombre del archivo
    movq %rsi, %r12 # Guardo rsi a un callee save
    movq %rdi, %r14 # Guardo la cantidad de parametros en un callee para luego usarlos
    decq %r14 # Ignoro el nombre de archivo como parametro
args_a_pila:

    movq (%r12,%rcx, 8), %rdi # Guardo en rdi el parametro de argv
    movq %rcx, %r13 # Guardo la iteracion en un callee save
    
    call atoi # En rax ahora tendre el numero listo para sumar
    imul %rax # rax * rax en rax
    addq %rax, %r15 # Actualizo la suma total
    # pushq %rax
    movq %r13, %rcx # Vuelve la iteracion a rcx que se pierde con el call
    loop args_a_pila

    movq $str2, %rdi # Pongo el string del printf
    movq %r14, %rsi # Primer parametro del printf aparte del string
    movq %r15, %rdx # Segundo
    call printf

    movq $0, %rax
    movq %rbp, %rsp # Epilogo
    popq %rbp 
    # Sin el comentario en push, Tengo en pila a partir de la direccion de rbp - 8:
    # ultimo argumento (en rbp - 8)
    # penultimo (en rbp - 16)
    # ...
    # primer (en rsp) (osea en rbp - 8 * iteraciones)

    ret

fin_cant:
    movq $str1, %rdi
    call printf
    movq $0, %rax
    movq %rbp, %rsp # Epilogo
    popq %rbp 
    ret