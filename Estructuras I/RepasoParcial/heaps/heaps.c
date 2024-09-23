#include <stdio.h>
#include <stdlib.h>
#include "heaps.h"
#define MULTIPLICADOR 5

BHeap bheap_crear(){
    BHeap heap = malloc(sizeof(BHeap));
    heap->capacidad = MULTIPLICADOR;
    heap->datos = malloc(sizeof(int*)*MULTIPLICADOR);
    heap->ultimo = 0;

    return heap;

}

int bheap_esvacio(BHeap heap){
    return heap->ultimo == 0 ? 1 : 0;
}

void bheap_bfs(BHeap heap){
    for(int i = 1; i<= heap->ultimo; i++){
        printf("%d ", heap->datos[i]);
    }
}

void bheap_flotar(BHeap heap, int posicion){
        if(posicion == 1) return;
        int pos_padre = posicion / 2;
        if(heap->datos[pos_padre] < heap->datos[posicion]){
            int aux = heap->datos[pos_padre];
            heap->datos[pos_padre] = heap->datos[posicion];
            heap->datos[posicion] = aux;
            bheap_flotar(heap, pos_padre);
        }
}

int bheap_maximo_hijo(BHeap heap, int posicion){

    if((posicion*2) > heap->ultimo && ((posicion*2) + 1) > heap->ultimo){
        return -1;
    }

    if((posicion*2) <= heap->ultimo && ((posicion*2) + 1) <= heap->ultimo){
        return heap->datos[(posicion*2) + 1] > heap->datos[(posicion*2)] ? (posicion * 2) + 1 : (posicion*2);
    }

    if((posicion*2) <= heap->ultimo){
        return posicion*2;
    }

    return (posicion*2)+1;

}

void bheap_bajar(BHeap heap, int posicion){
    int pos_max_hijo = bheap_maximo_hijo(heap, posicion);
    if (pos_max_hijo == -1) return;
    if(heap->datos[pos_max_hijo] > heap->datos[posicion]){
        int aux = heap->datos[posicion];
        heap->datos[posicion] = heap->datos[pos_max_hijo];
        heap->datos[pos_max_hijo] = aux;
        bheap_bajar(heap, pos_max_hijo);
    }

}


void bheap_insertar(BHeap heap, int dato){
    if(heap == NULL) return;

    if(heap->ultimo == heap->capacidad - 1){
        heap->datos = realloc(heap->datos, sizeof(int*) * heap->capacidad * MULTIPLICADOR);
        heap->capacidad = heap->capacidad * MULTIPLICADOR;
    }
    
    heap->ultimo++;
    heap->datos[heap->ultimo] = dato;
    bheap_flotar(heap, heap->ultimo);
    
}

void bheap_eliminar(BHeap heap, int dato){
    if(heap == NULL) return;
    int indice = -1;
    for(int i = 1; i <= heap->ultimo; i++){
        if(heap->datos[i] == dato) indice = i;
    }
    if(indice == -1) return;
    heap->datos[indice] = heap->datos[heap->ultimo];
    heap->ultimo--;
    bheap_bajar(heap, indice);

}
