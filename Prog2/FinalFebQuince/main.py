from random import *

def leer_archivo():
    archivo_entrada = open("salida.txt", "r")
    lineas = archivo_entrada.readlines()
    lineas_limpias = []

    for linea in lineas:
        linea = linea.strip()
        linea = linea.split(',')
        lineas_limpias.append(linea)

    return lineas_limpias

def esParejaValida(candidato, persona):
    if int(candidato[2])<12 or int(persona[2])<12:
        return False
    if(int(candidato[2]) < 16 and int(persona[2]) >= 16):
        return False
    if(int(candidato[2]) >= 16 and int(persona[2]) < 16):
        return False
    if(candidato[3] != persona[3]):
        return False
    if(candidato[1] == persona[1]):
        return False
    return True

def candidatos_a_x(candidato, resto_personas):
    candidatos = []
    for persona in resto_personas:
        if esParejaValida(candidato, persona):
            candidatos.append(persona)

    return candidatos

def elegirRandom(candidatos):
    if len(candidatos) == 0:
        return None
    return candidatos[randint(0, len(candidatos) - 1)]


def armaParejas(lineas):
    personas_sin_pareja = []
    parejas = []
    i=0
    while lineas:  # Mientras haya candidatos en la lista
        candidato = lineas[0]
        lista_sin_candidato = lineas[1:]
        candidatos = candidatos_a_x(candidato, lista_sin_candidato)
        print('CANDIDATOS DISPONIBLES: ')
        print(lineas)
        print('CANDIDATO: ')
        print(candidato)
        print('POSIBLES PAREJAS: ')
        print(candidatos)
        if(len(candidatos) == 0):
            personas_sin_pareja.append(candidato)
            lineas.remove(candidato)
        else:
            elegido = elegirRandom(candidatos)
            parejas.append((candidato, elegido))
            lineas.remove(candidato)
            lineas.remove(elegido)
    print('-----------------LISTO FORS----------------')
    for pareja in parejas:
        print('PAREJA: ')
        print(pareja[0], pareja[1])
    for persona in personas_sin_pareja:
        print('SIN PAREJA: ')
        print(persona)


def main():
    lineas = leer_archivo()
    armaParejas(lineas)
    return 0

main()