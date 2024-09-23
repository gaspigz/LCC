#ifndef _HEAPS_H_
#define _HEAPS_H_
#include <stdlib.h>
#include <assert.h>

typedef int (*FuncionComparadora)(void* dato1, void* dato2);
typedef void (*FuncionVisitante)(void* dato);
typedef void* (*FuncionCopiadora)(void* dato);
typedef void (*FuncionDestructora)(void* dato);

typedef struct _BHeap{
    int capacidad;
    int ultimo;
    void** elems;
    FuncionComparadora comp;
    FuncionCopiadora copy;
    FuncionVisitante visit;
    FuncionDestructora destroy;
};
typedef struct _BHeap* BHeap;

BHeap bheap_crear(int capacidad, FuncionComparadora comp, FuncionCopiadora copy, FuncionVisitante visit, FuncionDestructora destroy);

int bheap_esvacio(BHeap heap);

BHeap bheap_flotar(BHeap heap, int posicion);

BHeap bheap_hundir(BHeap heap, int posicion);

BHeap bheap_insertar(BHeap heap, void* dato);

BHeap bheap_eliminar(BHeap heap, void* dato);

void bheap_destruir(BHeap heap);


#endif