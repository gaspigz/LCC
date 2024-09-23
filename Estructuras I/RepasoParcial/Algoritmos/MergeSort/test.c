#include <stdlib.h>
#include <stdio.h>
#include "merge.h"

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
    GArray array = garray_crear();

    for (int i = 0; i < 10; ++i) {
        int i = rand() % 100;
        array = garray_insertar_nopos(array, &i, copiar_puntero_entero);
    }

    garray_recorrer(array, (FuncionVisitanteExtra) imprimir_puntero_entero);

    array = merge_sort(array, 10, comparar_puntero_entero, copiar_puntero_entero);
    printf("\n\n");

    garray_recorrer(array, imprimir_puntero_entero);

    return 0;
}