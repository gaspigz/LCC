#include <stdio.h>
#include <stdlib.h>
#include "btree.h"

static void imprimir_entero(int data) {
  printf("%d ", data);
}

static void imprimir_entero_contador(int data, int *extra) {
  *extra = *extra + 1;
  printf("%d ", data);
}

static void recorrer_guarda_suma(int data, int *extra) {
  *extra = *extra + data;
}

int main() {

  BTree rr = btree_unir(9, btree_crear(), btree_crear());
  BTree lr = btree_unir(7, btree_crear(), btree_crear());
  BTree llr = btree_unir(8, btree_crear(), btree_crear());
  BTree ll = btree_unir(1, btree_crear(), llr);
  BTree l = btree_unir(2, ll, lr);
  BTree r = btree_unir(3, btree_crear(), rr);
  BTree raiz = btree_unir(4, l, r);

  int *a = malloc(sizeof(int));
  *a = 0;

  btree_recorrer(raiz, BTREE_RECORRIDO_IN, (FuncionVisitanteInt) imprimir_entero);
  getchar();
  printf("BUSQUEDA NRO 2: %d", btree_buscar(raiz, 2));
  getchar();
  printf("BUSQUEDA NRO 15: %d", btree_buscar(raiz, 15));
  getchar();
  printf("NRO NODOS 2: %d", btree_nnodos(raiz));
  getchar();
  BTree copia = btree_copiar(raiz);
  printf("RECORRIDO COPIA: ");
  btree_recorrer(raiz, BTREE_RECORRIDO_IN, (FuncionVisitanteInt) imprimir_entero);
  getchar();
  printf("ALTURA: %d", btree_altura(raiz));
  getchar();  
  printf("NODOS A ALTURA 2: %d", btree_nnodos_profundidad(raiz, 2));
  getchar();
  printf("NODOS A ALTURA 3: %d", btree_nnodos_profundidad(raiz, 3));
  getchar();
  printf("PROFUNDIDAD NODO CON EL 3: %d", btree_profundidad(raiz, 3));
  getchar();
  printf("PROFUNDIDAD NODO CON EL 7: %d", btree_profundidad(raiz, 7));
  getchar();
  printf("PROFUNDIDAD NODO CON EL 15: %d", btree_profundidad(raiz, 15));
  getchar();
  printf("RECORRIDO EXTRA: ");
  btree_recorrer_extra(raiz, BTREE_RECORRIDO_IN, (FuncionVisitanteExtra) imprimir_entero_contador, a);
  getchar();
  printf("CANTIDAD QUE DA EN EXTRA: %d", *a);
  getchar();
  *a = 0;
  printf("RECORRIDO PARA SUMA: ");
  btree_recorrer_extra(raiz, BTREE_RECORRIDO_IN, (FuncionVisitanteExtra) recorrer_guarda_suma, a);
  getchar();
  printf("CANTIDAD QUE DA EN SUMA: %d", *a);
  getchar();
  //Alguna otra? ...
  printf("RECORRIDO PARA BFS: ");
  btree_bfs(raiz, (FuncionVisitanteInt) imprimir_entero);
  printf("RECORRIDO ITERATIVO PARA BFS: ");
  btree_bfs_iterativo(raiz, (FuncionVisitanteInt) imprimir_entero);






  btree_destruir(raiz);

  return 0;
}
