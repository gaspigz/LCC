#include "functions.h"
#include "garray.h"
#include <stdio.h>
#include <stdlib.h>

#define MULTIPLICADOR 100

 // que cree un heap vac´ıo con una capacidad y una funcion de comparaci´on dadas.
BHeap bheap_crear(int capacidad, FuncionComparadora comp){
    BHeap heap = malloc(sizeof(BHeap));
    heap->arr = malloc(sizeof(void*) * capacidad);
    heap->capacidad = capacidad;
    heap->comp = comp;
    heap->arr[0] = NULL;
    heap->ultimo = 0;

    return heap;
}

// que destruye el heap.
void bheap_destruir(BHeap heap, FuncionDestructora destroy){
    for(int i = 0; i<=heap->ultimo; i++) destroy(heap->arr[i]);
    free(heap->arr);
    free(heap);
} 

// que retorne 1 si el heap est´a vac´ıo y 0 en caso contrario.
int bheap_es_vacio(BHeap heap){
    return heap->ultimo == 0 ? 1 : 0;
} 

// que recorre los nodos utilizando b´usqueda por extensi´on, aplicando la funci´on dada en cada elemento. ¿Es necesario utilizar una cola auxiliar en este caso?
void bheap_recorrer(BHeap heap, FuncionVisitanteExtra visit){
    for(int i = 1; i<=heap->ultimo; i++){
        visit(heap->arr[i], NULL);
    }
}

BHeap bheap_flotar(BHeap heap, int i){
    int bandera = 0;
    for(i ; i > 1 && bandera == 0; i = i/2){
        if(heap->comp(heap->arr[i], heap->arr[i/2]) > 0){
            void *aux = heap->arr[i/2];
            heap->arr[i/2] = heap->arr[i];
            heap->arr[i] = aux;
        }else{
            bandera = 1;
        }
    }

    return heap;
}

int bheap_indice_maximo_hijo(BHeap heap, int i){
    int indice_maximo_hijo;
    if((i*2) + 1 <= heap->ultimo){
        return indice_maximo_hijo = heap->comp(heap->arr[(i*2)+1], heap->arr[(i*2)]) > 0 ? (i*2) + 1 : (i*2); 
    }
    else if((i*2) <= heap->ultimo){
        return indice_maximo_hijo = i*2;
    }else{
        return i;
    }
}

BHeap bheap_bajar(BHeap heap, int i){
    int indice_maximo_hijo = bheap_indice_maximo_hijo(heap, i);
    if(indice_maximo_hijo == i) return heap;
    if(heap->comp(heap->arr[i], heap->arr[indice_maximo_hijo]) < 0){
        void *aux = heap->arr[indice_maximo_hijo];
        heap->arr[indice_maximo_hijo] = heap->arr[i];
        heap->arr[i] = aux;
        return bheap_bajar(heap, indice_maximo_hijo);
    }
    
    return heap;
}

// que agregue un elemento al heap, realocando el arreglo en caso de ser necesario. El resultado debe ser nuevamente un heap binario.
BHeap bheap_insertar(BHeap heap, void* dato, FuncionCopiadora copia){
    if(heap->capacidad == heap->ultimo - 1){
        heap->arr = realloc(heap->arr, heap->capacidad * MULTIPLICADOR);
        heap->capacidad = heap->capacidad * MULTIPLICADOR;
    }
    heap->ultimo = heap->ultimo + 1;
    heap->arr[heap->ultimo] = copia(dato);
    heap = bheap_flotar(heap, heap->ultimo);

    return heap;
}

//que elimine un elemento del heap. El resultado debe ser nuevamente un heap binario.
BHeap bheap_eliminar(BHeap heap, void* dato, FuncionDestructora destroy){
    int bandera = 0;
    int pos_a_cambiar;
    for(int i = 1; i<= heap->ultimo && bandera == 0; i++){
        if(heap->comp(dato, heap->arr[i]) == 0){
            bandera = 1;
            pos_a_cambiar = i;
            void *aux = heap->arr[i];
            heap->arr[i] = heap->arr[heap->ultimo];
            heap->arr[heap->ultimo] = aux;
            destroy(heap->arr[heap->ultimo]);
            heap->ultimo = heap->ultimo - 1;
        }
    }
    heap = bheap_bajar(heap, pos_a_cambiar);
    return heap;
}


BHeap bheap_crear_desde_arr(void **arr, int largo, FuncionCopiadora copiar, FuncionComparadora comp){
    
    BHeap heap = bheap_crear(largo, comp);

    if(largo == 0) return heap;

    for(int i = 0; i<=largo; i++){
        if(i != 0){
            heap->arr[i] = copiar(arr[i-1]);
        }
    }
    heap->ultimo = largo;
    for(int i = largo; i > 0; i--){
        heap = bheap_bajar(heap, i);
    }
    return heap;

}

void heap_sort_1(void **array, int largo, FuncionCopiadora copiar, FuncionComparadora comp){
    if(largo == 0) return;
    BHeap heap = bheap_crear_desde_arr(array, largo, copiar, comp);
    int i = 1;
    while(i != heap->ultimo){
        void *aux = heap->arr[i]; 
        heap->arr[i] = heap->arr[heap->ultimo];
        heap->arr[heap->ultimo] = aux;
        heap->ultimo--;
        heap = bheap_bajar(heap, i);
    }
    for(int j = 0; j<largo; j++){
        array[j] = heap->arr[j+1];
    }


}



