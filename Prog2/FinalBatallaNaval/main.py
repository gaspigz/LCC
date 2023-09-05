def main():
    tablero = []

    lineas = lectura_archivo()

    tablero = asignar_lineas(lineas)

    disparos_disponibles = 3*len(tablero)

    jugar(tablero, disparos_disponibles)

def jugar(tablero, disparos_disponibles):
    disparos_usados = 0
    while disparos_usados < disparos_disponibles or len(tablero)>0:
        bandera = 0
        print(tablero)
        disparo_x = int(input('Ingrese coordenada X del disparo numero ' + str(disparos_usados) + ': '))
        disparo_y = int(input('Ingrese coordenada Y del disparo numero ' + str(disparos_usados) + ': '))
        for i in range(0, len(tablero)-1):
            if tablero[i] == (disparo_x, disparo_y):
                print('LE PEGASTE!!')
                tablero.remove(tablero[i])
                bandera = 1
        disparos_usados +=1
        if  bandera == 0:
            print(' FALLIDO!! - QUEDAN ' + str(disparos_disponibles - disparos_usados) + ' DISPAROS')
    
    if len(tablero) == 0:
        print('GANASTE!!! ')
    else:
        print('PERDISTE!!! :( ')
        
        
            

def lectura_archivo():
    file = open("salida.txt", "r")
    lineas = file.readlines()
    file.close()
    return lineas
    
def asignar_lineas(lineas):
    tablero = []
    filas = lineas[0].split(" ")[0]
    columnas = lineas[0].split(" ")[1]
    
    for linea in lineas[1:]:
        i=0

        linea = linea.strip()
        linea = linea.split(" ")
        print(linea)

        fila = int(linea[0])
        columna = int(linea[1])
        posicion = int(linea[2])
        largo = int(linea[3])
        print(fila, columna, posicion, largo)
        if(posicion == 0):
            while i<largo:
                tablero.append((fila, columna+i))
                i=i+1
        if(posicion == 1):
            while i<largo:
                tablero.append((fila+i, columna))
                i=i+1
    return tablero

main()
