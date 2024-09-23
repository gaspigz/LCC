#include "functions.h"
#include "garray.h"
#include <stdio.h>
#include <stdlib.h>

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

  int *a = malloc(sizeof(int));
  *a = 5;
  int *b = malloc(sizeof(int));
  *b = 10;
  int *c = malloc(sizeof(int));
  *c = 18;
  int *d = malloc(sizeof(int));
  *d = 2;
  int *e = malloc(sizeof(int));
  *e = 6;
  int *f = malloc(sizeof(int));
  *f = 4;
  int *g = malloc(sizeof(int));
  *g = 13;
  int *h = malloc(sizeof(int));
  *h = 19;
  int *i = malloc(sizeof(int));
  *i = 14;
  int *cero = malloc(sizeof(int));
  *cero = 0;

    BHeap heap = bheap_crear(100, comparar_puntero_entero);
    heap = bheap_insertar(heap, a, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, b, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, c, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, d, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, e, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, f, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, g, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, h, (FuncionCopiadora) copiar_puntero_entero);
    heap = bheap_insertar(heap, i, (FuncionCopiadora) copiar_puntero_entero);

    printf("HEAP: \n");
    bheap_recorrer(heap, (FuncionVisitanteExtra) imprimir_puntero_entero);
    getchar();

    heap = bheap_eliminar(heap, h, destruir_puntero_entero);
    printf("HEAP: \n");
    bheap_recorrer(heap, (FuncionVisitanteExtra) imprimir_puntero_entero);
    bheap_destruir(heap, destruir_puntero_entero);

    int *arr[9];
    arr[0] = a;
    arr[1] = b;
    arr[2] = c;
    arr[3] = d;
    arr[4] = e;
    arr[5] = f;
    arr[6] = g;
    arr[7] = h;
    arr[8] = i;

    BHeap heap_2 = bheap_crear_desde_arr((void**)arr, 9, copiar_puntero_entero, comparar_puntero_entero);

    printf("\nHEAP DESDE ARR: \n");
    bheap_recorrer(heap_2, (FuncionVisitanteExtra) imprimir_puntero_entero);

    printf("\nARRAY ORDENADO: ");
    heap_sort_1((void**)arr, 9, (FuncionCopiadora) copiar_puntero_entero,(FuncionComparadora) comparar_puntero_entero);
    for(int i = 0; i<9; i++){
      printf("%d ", arr[i]);
    }



    return 0;
}