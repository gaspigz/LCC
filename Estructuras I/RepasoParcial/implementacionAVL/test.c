#include <stdlib.h>
#include <stdio.h>
#include "avl.h"

static void* copiar_puntero_entero(void* i) {
  int* p = malloc(sizeof(int));
  *p = *(int*)i;
  return p;
}
static int comparar_puntero_entero(void* i1, void* i2) {
  return (*(int*)i1 - *(int*)i2);
}
static void destruir_puntero_entero(void* i) { free(i); }
static void imprimir_puntero_entero(void* i,
  __attribute__((unused)) void* extra) {
  printf("%d ", *(int*)i);
}

int main(){
    AVL avl = avl_crear();

    for (int i = 0; i < 10; ++i) {
        int i = rand() % 100;
        avl_insertar(avl, &i, (FuncionComparadora) comparar_puntero_entero, (FuncionCopiadora) copiar_puntero_entero);
    }

    int j = 21;
    int h = 15;

    avl_recorrer(avl, (FuncionVisitante) imprimir_puntero_entero, BTREE_RECORRIDO_PRE);
    avl = avl_eliminar(avl, &h, (FuncionComparadora) comparar_puntero_entero, (FuncionCopiadora) copiar_puntero_entero, (FuncionDestructora) destruir_puntero_entero);
    printf("\n\n");
    avl_recorrer(avl, (FuncionVisitante) imprimir_puntero_entero, BTREE_RECORRIDO_PRE);

    avl = avl_eliminar(avl, &j, (FuncionComparadora) comparar_puntero_entero, (FuncionCopiadora) copiar_puntero_entero, (FuncionDestructora) destruir_puntero_entero);
    
    printf("\n\n");
    avl_recorrer(avl, (FuncionVisitante) imprimir_puntero_entero, BTREE_RECORRIDO_PRE);

    return 0;
}