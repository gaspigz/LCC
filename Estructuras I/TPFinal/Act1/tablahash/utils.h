#ifndef __UTILS_H__
#define __UTILS_H__
#include "../structures.h"


/**
 * Crea una nueva posición.
 */
Nodo *nodo_crear(int x, int y);

/**
 * Crea una copia física de la posición.
 */
Nodo *nodo_copia(Nodo *pos);

/**
 * Compara dos Nodoes.
 */
int nodo_comparar(Nodo *p1, Nodo *p2);

/**
 * Destruye una posición.
 */
void nodo_destruir(Nodo *pos);

/**
 * Función hash para una posición.
 */
unsigned nodo_hash(Nodo *pos);

/**
 * Imprime una posición.
 */
void nodo_imprimir(Nodo *pos);

#endif /** __UTILS_H__ */