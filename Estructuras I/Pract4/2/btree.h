#ifndef __BTREE_H__
#define __BTREE_H__
#include "pilas.h"
#include "colas.h"

typedef void (*FuncionVisitanteInt)(int dato);
typedef void (*FuncionVisitanteExtra) (int dato, void *extra);

typedef enum {
  BTREE_RECORRIDO_IN,
  BTREE_RECORRIDO_PRE,
  BTREE_RECORRIDO_POST
} BTreeOrdenDeRecorrido;

typedef struct _BTNodo *BTree;

/**
 * Devuelve un arbol vacío.
 */
BTree btree_crear();

/**
 * Destruccion del árbol.
 */
void btree_destruir(BTree nodo);

/**
 * Indica si el árbol es vacío.
 */
int btree_empty(BTree nodo);

/**
 * Crea un nuevo arbol, con el dato dado en el nodo raiz, y los subarboles dados
 * a izquierda y derecha.
 */
BTree btree_unir(int dato, BTree left, BTree right);

/**
 * Recorrido del arbol, utilizando la funcion pasada.
 */
void btree_recorrer(BTree arbol, BTreeOrdenDeRecorrido orden,
                    FuncionVisitanteInt visit);

void btree_recorrer_iterativo(BTree arbol, FuncionVisitanteInt visit);

int btree_nnodos(BTree arbol);    // que retorne el n´umero de nodos del ´arbol.

int btree_buscar(BTree arbol, int numero);     //que retorne 1 si el n dado se encuentra en el ´arbol, y 0 en caso contrario.

BTree btree_copiar(BTree arbol);     //que retorne un nuevo ´arbol que sea una copia del ´arbol dado.

int btree_altura(BTree arbol);     //que retorne la altura del ´arbol.

int btree_nnodos_profundidad(BTree arbol, int profundidad);      //que retorne el n´umero de nodos que se encuentran a la profundidad dada

int btree_profundidad(BTree arbol, int n);              //que retorne la profundidad del nodo que contiene el n dado, y -1 si el n no se encuentra en el arb.

int btree_profundidad_si_esta(BTree arbol, int n);

int btree_sumar(BTree arbol);                    //que retorne la suma total de los datos del arb.

void btree_recorrer_extra(BTree arbol, BTreeOrdenDeRecorrido orden, FuncionVisitanteExtra visit, void *extra);

void *no_copia(void *dato);

void no_destruye(void *dato);

void print_current_profundidad(BTree arbol, int profundidad_deseada, FuncionVisitanteInt visit);

void btree_bfs(BTree arbol, FuncionVisitanteInt visit);

void btree_bfs_iterativo(BTree arbol, FuncionVisitanteInt visit);






#endif /* __BTREE_H__ */
