#ifndef STRUCTURES_H
#define STRUCTURES_H

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <stdbool.h>

#define INF INT_MAX

typedef struct _Nodo
{
    int x, y;
}Nodo;

typedef struct _PQ{
    Nodo *nodos;
    int size, capacidad;
}PQ;


// Cada nodo tiene un valor g y un valor rhs
// g representa el costo acumulado del camino más corto conocido desde el inicio hasta un nodo n.
// rhs representa el costo acumulado más bajo de llegar al nodo n desde alguno de sus predecesores MÁS el costo de la arista correspondiente.

typedef struct _Grid{
    Nodo inicio, fin;
    int filas, columnas;
    bool** ocupadas;
    int** costos;
    int **g;
    int** rhs;
    int km;
}Grid;


#endif // STRUCTURES_H