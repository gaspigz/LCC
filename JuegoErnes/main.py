import random


def prRed(skk): print("\033[91m {}\033[00m" .format(skk))
 
 
def prGreen(skk): print("\033[92m {}\033[00m" .format(skk))
 
 
def prYellow(skk): print("\033[93m {}\033[00m" .format(skk))
 
 
def prLightPurple(skk): print("\033[94m {}\033[00m" .format(skk))
 
 
def prPurple(skk): print("\033[95m {}\033[00m" .format(skk))
 
 
def prCyan(skk): print("\033[96m {}\033[00m" .format(skk))
 
 
def prLightGray(skk): print("\033[97m {}\033[00m" .format(skk))
 
 
def prBlack(skk): print("\033[98m {}\033[00m" .format(skk))

def leer_archivo():
    archivo_entrada = open('data.txt')
    lineas = archivo_entrada.readlines()
    lineas_bien = []
    archivo_entrada.close()
    for linea in lineas:
        linea_bien = linea.strip()
        lineas_bien.append(linea_bien)

    return lineas_bien

def procesa_lineas(lineas):
    lineas_bien = ''
    for linea in lineas:
        lineas_bien = lineas_bien + linea
        
    lineas_bien = lineas_bien.split(',')

    return lineas_bien

def jugar(lineas):
    vidas = 3
    while vidas > 0 and len(lineas)>0:
        prLightPurple('Vidas: ' + str(vidas))
        prLightPurple('Palabras restantes: ' + str(int(len(lineas)/2)))
        prLightGray('-------------------------------------------------------------------------------------------------------')
        if(len(lineas) != 0):
            numero_aleatorio = random.randint(0, len(lineas)-1)
            while numero_aleatorio % 2 != 0:
                numero_aleatorio = random.randint(0, len(lineas)-1)
            palabra = lineas[numero_aleatorio]
            preposicion = lineas[numero_aleatorio + 1]
            prLightGray('¿Cuál es la preposición correcta para la palabra...')
            intento = input(palabra + ' ').lower()
            if intento == preposicion:
                prGreen('¡Correcto!')
                lineas.pop(numero_aleatorio+1)
                lineas.pop(numero_aleatorio)
            else:
                prRed('¡Incorrecto! La respuesta correcta era: ' + preposicion)
                vidas = vidas - 1
        prLightGray('-------------------------------------------------------------------------------------------------------')
    if vidas == 0:
        prRed('¡Perdiste! :( Inicie el juego de nuevo para repetir! .')
    else:
        prGreen('¡Ganaste! Con una foto de este mensaje te ganas unos masajes gratis! :) Inicie el juego de nuevo para repetir! .')
    






def main():
    prRed('Bienvenido al juego de Ernes ¡Comencemos!')
    prYellow('Tenes 3 vidas. Para ganar tenes que completar todas las palabras con su preposition correctamente.')
    prYellow('Si te equivocas, perdes una vida. Si te quedas sin vidas, perdes el juego :O')
    prYellow('Cada palabra que acertas es sacada del resto de opciones. En caso de ser dos posibles poner como este ejemplo: ')
    prYellow('frustrated by/with')
    prYellow('¡Suerte!')
    prLightGray('-------------------------------------------------------------------------------------------------------')
    lineas = []
    lineas = leer_archivo()
    lineas_string = procesa_lineas(lineas)
    jugar(lineas_string)
    return 0

main()