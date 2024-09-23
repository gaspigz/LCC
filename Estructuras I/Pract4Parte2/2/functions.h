#ifndef __BHEAP_H__
#define __BHEAP_H__

typedef void *(*FuncionCopiadora)(void *dato);
typedef int (*FuncionComparadora)(void *, void *);
typedef void (*FuncionDestructora)(void *dato);
typedef void (*FuncionVisitanteExtra)(void *dato, void *extra);

typedef struct _BHeap {
void **arr;
int capacidad;
int ultimo;
FuncionComparadora comp;
} _BHeap;

typedef struct _BHeap *BHeap;

BHeap bheap_crear(int capacidad, FuncionComparadora comp); // que cree un heap vac´ıo con una capacidad y una funcion de comparaci´on dadas.
void bheap_destruir(BHeap heap, FuncionDestructora destroy); // que destruye el heap.
int bheap_es_vacio(BHeap heap); // que retorne 1 si el heap est´a vac´ıo y 0 en caso contrario.
void bheap_recorrer(BHeap heap, FuncionVisitanteExtra visit); // que recorre los nodos utilizando b´usqueda por extensi´on, aplicando la funci´on dada en cada elemento. ¿Es necesario utilizar una cola auxiliar en este caso?
BHeap bheap_insertar(BHeap heap, void* dato, FuncionCopiadora copia); // que agregue un elemento al heap, realocando el arreglo en caso de ser necesario. El resultado debe ser nuevamente un heap binario.
BHeap bheap_acomodar(BHeap heap);
BHeap bheap_eliminar(BHeap heap, void* dato, FuncionDestructora destroy); //que elimine un elemento del heap. El resultado debe ser nuevamente un heap binario.
BHeap bheap_crear_desde_arr(void **arr, int largo, FuncionCopiadora copiar, FuncionComparadora comp);
void heap_sort_1(void **array, int largo, FuncionCopiadora copiar, FuncionComparadora comp);


#endif /* __BHEAP_H__*/
