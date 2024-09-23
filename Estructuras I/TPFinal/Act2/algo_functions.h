#ifndef ALGO_FUNCTIONS_H
#define ALGO_FUNCTIONS_H

#include "structures.h"

// Devuelve la heuristica (entera) basada en la distancia de Manhattan desde un nodo a a un nodo b.
int nodo_heuristica(Nodo a, Nodo b);

// Toma una grilla y un nodo y devuelve un puntero a su Key, calculada usando su g y su rhs.
int* nodo_calculateKey(Grid* grid, Nodo nodo);

// Inicializa la grilla poniendole a cada nodo el valor INF en g y en rhs.
// Al nodo final le pone valores 0 en su g y su rhs, y luego lo mete en la PQ.
void grid_init(Grid* grid, PQ* pq);

// Toma un grid, un nodo y una PQ y actualiza el nodo y la PQ
void grid_update_vertice(Grid* grid, Nodo nodo, PQ* pq);

// Algoritmo D* Lite basado en el paper original dispuesto en la Figura 3 (No opt)
void computeShortestPath(Grid* grid, PQ* pq);

void grid_leer_desde_archivo(char* filename, Grid *grid);

#endif // ALGO_FUNCTIONS_H