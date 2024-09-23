#include "utils.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * Crea una nueva posición.
 */
Nodo *nodo_crear(int x, int y, char valor) {
  Nodo *nueva = malloc(sizeof(Nodo));
  assert(nueva != NULL);
  nueva->x = x;
  nueva->y = y;
  nueva->valor = valor;
  return nueva;
}

/**
 * Crea una copia física de la posición.
 */
Nodo *nodo_copia(Nodo *pos) {
  return pos;
}

/**
 * Compara dos Nodoes.
 */
int nodo_comparar(Nodo *p1, Nodo *p2) {
  if (p1->x == p2->x && p1->y == p2->y)
    return 0;
  else if (p1->x < p2->x || (p1->x == p2->x && p1->y < p2->y))
    return -1;
  else
    return 1;
}

/**
 * Destruye una posición.
 */
void nodo_destruir(Nodo *pos) {
  free(pos);
}

/**
 * Función hash para una posición.
 */
unsigned nodo_hash(Nodo *pos) {
  unsigned hash = pos->x;
  hash = (hash * 31) ^ pos->y;
  return hash;
}

/**
 * Imprime una posición.
 */
void nodo_imprimir(Nodo *pos) {
  printf("(%d, %d)", pos->x, pos->y);
}
