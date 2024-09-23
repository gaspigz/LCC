#ifndef PQFUNCTIONS_H
#define PQFUNCTIONS_H


#include "structures.h"

// (PQ) en D* Lite ordena los nodos de menor a mayor clave.
// El último elemento de la PQ es el nodo destino 

PQ* pq_crear(int capacidad);

void pq_insertar(PQ* pq, Nodo nodo, Grid* grid);

Nodo pq_extraer_minimo(PQ* pq);

bool pq_es_vacia(PQ* pq);

void pq_free(PQ* pq);

#endif // PQFUNCTIONS_H