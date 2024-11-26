.data
list: .long 10, 20, 30
length: .byte 3
# Guardare en r8 el min, en r9 el max y en r10 el prom
# En rdi guardo el valor actual del loop

.text
.global main
main:
    movq $0, %rax # Inicializo rax en 0
    movq $0, %r11 # Inicializo el puntero aux r11 como 0, este va a ser mi indice
    movq length, %rcx # Voy a usar un loop con "lenght" iteraciones
    movq $0, %r8 # Inicializo en 0
    movq $0, %r9 # Inicializo en 0
    movq $0, %r10 # Inicializo en 0
    movl list(%r11), %r8d # Incializo minimo como el primer elemento de list
    movl list(%r11), %r9d # Inicializo maximo como el primer elemento de list
    movq $0, %rdi # Elemento actual
suma:
    addl list(%r11), %eax # Sumale lo que haya en list[r11] a lo que haya en rax y guardalo en rax
    movl list(%r11), %edi # Valor actual del loop a edi
    cmpl %r8d, %edi # Veo si el valor actual (edi) es mas chico que el minimo (en r8)
    jl asigna_min
    cmpl %edi, %r9d # Veo si el max (r9) es mas chico que el valor actual (edi)
    jl asigna_max
    movq $0, %rdi # De nuevo edi a 0
    addq $4, %r11  # Aumenta el indice, lo hago 4 veces por el largo long (4 bytes)
nuevo_loop_suma:
    loop suma # loopea mientras haya iteraciones disponibles
    jmp asigna_prom # Termine, ahora saco el promedio

asigna_min:
    movq $0, %r8 # Limpia el min
    movl %edi, %r8d # Mete el actual al min
    movq $0, %rdi
    jmp nuevo_loop_suma

asigna_max:
    movq $0, %r9 # Limpia el mayor
    movl %edi, %r9d # Mete el actual al min
    movq $0, %rdi # Limpia el actual
    jmp nuevo_loop_suma

asigna_prom:
    movq length, %rcx # Voy a usar un loop con "lenght" iteraciones
    # Tengo la suma en rax y el total en rcx
    movq %rax, %rsi # Guardo la suma en rsi porque div pisa rax
    # div tambien pisa rdi pero ese no me importa porque lo usaba para guardar el actual
    movq $0, %rdx # ?? rdx:rax ??
    divq %rcx # rax / rcx osea suma / longitud osea promedio
    movq %rax, %r10 # El resultado de div se guarda en rax, lo pongo en r10
    movq %rsi, %rax # Devuelvo la suma a rax
    
    jmp fin #fin del programa
    
fin:
    ret