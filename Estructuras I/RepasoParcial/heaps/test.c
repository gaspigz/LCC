#include <stdio.h>
#include <stdlib.h>
#include "heaps.h"

int main(){

    BHeap heap = bheap_crear();

    bheap_insertar(heap, 5);
    bheap_insertar(heap, 3);
    bheap_insertar(heap, 8);
    bheap_insertar(heap, 11);
    bheap_insertar(heap, 19);
    bheap_insertar(heap, 16);
    bheap_insertar(heap, 4);
    bheap_insertar(heap, 7);
    bheap_insertar(heap, 9);
    bheap_insertar(heap, 8);
    bheap_insertar(heap, 11);
    bheap_insertar(heap, 2);
    bheap_bfs(heap);
    printf("\n\n");
    bheap_eliminar(heap, 19);
    bheap_eliminar(heap, 116);
    bheap_eliminar(heap, 16);

    bheap_bfs(heap);


    return 0;
}