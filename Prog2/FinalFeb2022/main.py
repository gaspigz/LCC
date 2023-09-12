def leer_archivo():
    archivos_entrada = open('salida.txt', 'r')
    K = archivos_entrada.readline().strip()
    archivos_entrada.readline()
    lineas_restantes = archivos_entrada.readlines()
    personas = []
    afinidades = []
    respuesta = {
        'cantidad': K,
        'personas': personas,
        'afinidades': afinidades
    }
    bandera=0
    for linea in lineas_restantes:
        linea = linea.strip()
        if(linea == 'Afinidades'):
            bandera = 1
        elif(bandera == 0):
            personas.append(linea.strip())
        else:
            afinidades.append(linea.strip())
            
    respuesta = {
        'cantidad': K,
        'personas': personas,
        'afinidades': afinidades
    }
    return respuesta

def main():

    respuesta_lectura = leer_archivo()
    K = respuesta_lectura['cantidad']
    personas = respuesta_lectura['personas']
    afinidades = respuesta_lectura['afinidades']
    print("Lista de nombres disponibles: ")
    for persona in personas:
        print(persona)
    persona1 = 'PERSONA PRUBEA NO VA A ESTAR 1111'
    persona2= 'PERSONA PRUBEA NO VA A ESTAR 1111'
    while not(persona1 in personas):
        persona1 = input('Ingrese el primer nombre... ')

    while not(persona2 in personas):
        persona2 = input('Ingrese el segundo nombre... ')

    return 0

main()