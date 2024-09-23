#ifndef __HEAPS_H__
#define __HEAPS_H__

struct _BHeap{
    int capacidad;
    int *datos;
    int ultimo;
};

typedef struct _BHeap *BHeap;

BHeap bheap_crear();

int bheap_esvacio(BHeap heap);

void bheap_bfs(BHeap heap);

void bheap_flotar(BHeap heap, int posicion);

int bheap_maximo_hijo(BHeap heap, int posicion);

void bheap_bajar(BHeap heap, int posicion);

void bheap_insertar(BHeap heap, int dato);

void bheap_eliminar(BHeap heap, int dato);


#endif