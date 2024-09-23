#ifndef __BSTREE_H__
#define __BSTREE_H__

#include "garray.h"


typedef void *(*FuncionCopiadora)(void *dato);
typedef int (*FuncionComparadora)(void *, void *);
typedef void (*FuncionDestructora)(void *dato);
typedef void (*FuncionVisitanteExtra)(void *dato, void *extra);

typedef enum {
  BTREE_RECORRIDO_IN,  /** Inorden */
  BTREE_RECORRIDO_PRE, /** Preorden */
  BTREE_RECORRIDO_POST /** Postorden */
} BSTreeRecorrido;

typedef struct _BST_Nodo *BSTree;

/**
 * Retorna un arbol de busqueda binaria vacio.
 */
BSTree bstee_crear();

/**
 * Destruye el arbol y sus datos.
 */
void bstree_destruir(BSTree, FuncionDestructora);

/**
 * Retorna 1 si el dato se encuentra y 0 en caso contrario.
 */
BSTree bstree_buscar(BSTree, void *, FuncionComparadora);

BSTree bstree_buscar_padre(BSTree raiz, void *dato, FuncionComparadora comp);
/**
 * Inserta un dato no repetido en el arbol, manteniendo la propiedad del arbol
 * de busqueda binaria.
 */
BSTree bstree_insertar(BSTree, void *, FuncionCopiadora, FuncionComparadora);

BSTree menorEntreMayores(BSTree arbol);

BSTree nodoReemplazo_padre(BSTree nodoAEliminar);

BSTree menorEntreMayores_padre(BSTree arbol);

BSTree busca_padre(BSTree origen, BSTree nodo_hijo, FuncionComparadora comp);

/**
 * Recorrido DSF del arbol
 */
void bstree_recorrer(BSTree, BSTreeRecorrido, FuncionVisitanteExtra,
                     void *extra);

BSTree bstree_eliminar(BSTree arbol, void *dato, FuncionComparadora comp, FuncionDestructora destroy);

BSTree bstree_eliminar_aux(BSTree arbol, BSTree nodo_a_eliminar, FuncionComparadora comp, FuncionDestructora destroy);

void bstree_kesimo_menor(BSTree arbol, int *k, FuncionVisitanteExtra visit, void* extra);

int bstree_validar(BSTree arbol, FuncionVisitanteExtra visit, FuncionComparadora comp);

GArray bstree_to_garray(BSTree arbol, GArray array);

void* menorMayor(BSTree arbol);

void* mayorMenor(BSTree arbol);


#endif //__BSTREE_H__