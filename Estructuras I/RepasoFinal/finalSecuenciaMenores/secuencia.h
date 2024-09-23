#ifndef _SECUENCIA_H_
#define _SECUENCIA_H_
#include <stdlib.h>

typedef struct _Nodo{
    int dato;
    struct _Nodo* siguiente;
    int p;
    int cant_m;
} _Nodo;

typedef struct _Nodo* Nodo;

Nodo secuencia_crear(int dato);

void secuencia_mostrar(Nodo secuencia);

Nodo actualiza_menor_y_pos(Nodo lista, int dato);

Nodo secuencia_insertar(Nodo lista, int dato, int pos);

Nodo* secuencia_porCantidadMenores(Nodo lista, int cantidad);

int buscar_dato_por_pos(Nodo lista, int pos);

Nodo secuencia_borrar_aux(Nodo lista, int pos, int dato);

Nodo secuencia_borrar(Nodo lista, int pos);

#endif
