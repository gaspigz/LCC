#ifndef STRUCTURES_H
#define STRUCTURES_H

#include <stdio.h>
#include <stdlib.h>
#include "tablahash/tablahash.h"
#include "pilas/pilas.h"

typedef enum {
  R,
  L,
  U,
  D
} Movimientos;


typedef struct _Nodo
{
    int x, y;
    char valor;

}Nodo;

// Cada nodo tiene un valor g y un valor rhs
// g representa el costo acumulado del camino más corto conocido desde el inicio hasta un nodo n.
// rhs representa el costo acumulado más bajo de llegar al nodo n desde alguno de sus predecesores MÁS el costo de la arista correspondiente.

typedef struct _Grid{
    Nodo *inicio;
    Nodo *fin;
    int filas, columnas;
    Nodo ***nodos;
}Grid;

typedef struct _Robot{
    Nodo* posicion_actual;
    TablaHash *tabla_recorridos;
    TablaHash *tabla_obstaculos;
    Pila pila_movimientos;
    Nodo* fin;
}Robot;

#endif // STRUCTURES_H