#ifndef __SLIST_H__
#define __SLIST_H__

#include <stddef.h>

typedef void (*FuncionVisitante) (int dato);

typedef struct _SNodo {
  int dato;
  struct _SNodo *sig;
} SNodo;

typedef SNodo *SList;

/**
 * Devuelve una lista vacía.
 */
SList slist_crear();

/**
 * Destruccion de la lista.
 */
void slist_destruir(SList lista);

/**
 * Determina si la lista es vacía.
 */
int slist_vacia(SList lista);

/**
 * Agrega un elemento al final de la lista.
 */
SList slist_agregar_final(SList lista, int dato);

/**
 * Agrega un elemento al inicio de la lista.
 */
SList slist_agregar_inicio(SList lista, int dato);

/**
 * Recorrido de la lista, utilizando la funcion pasada.
 */
void slist_recorrer(SList lista, FuncionVisitante visit);

int slist_longitud(SList lista);     // que devuelve la longitud de una lista.

SList slist_concatenar(SList lista1, SList lista2);     // que devuelve la concatenaci´on de dos listas, modificando la primera.

SList slist_insertar(SList lista, int dato, int pos);     // que inserta un dato en una lista en una posici´on arbitraria.

SList slist_eliminar(SList lista, int pos);     // que borra de una lista un dato apuntado en una posici´on arbitraria.

int slist_contiene(SList lista, int dato);     // que determina si un elemento est´a en una lista dada.

int slist_indice(SList lista, int dato);     // que devuelve la posici´on de la primera ocurrencia de un elemento si el mismo est´a en la lista dada, y -1 en caso que no est´e.

SList slist_intersecar(SList lista1, SList lista2);     // que devuelve una nueva lista con los elementos comunes (independientemente de la posici´on) de dos listas dadas por par´ametro. Las listas originales no se modifican.

void slist_intersecar_custom(SList lista);     // custom que trabaja como la anterior pero recibe un par´ametro extra que es un puntero a una funci´on de comparaci´on que permite definir la noci´on de igualdad a ser usada al comparar elementos por igualdad.

SList slist_ordenar(SList lista);      // que ordena una lista de acuerdo al criterio dado por una funci´on de comparaci´on (que usa los mismos valores de retorno que strcmp()) pasada por par´ametro.

SList slist_ordenar_aux(SList lista, int inicio, int final);

void slist_reverso(SList lista);      // que obtenga el reverso de una lista.

void slist_intercalar(SList lista);     // que dadas dos listas, intercale sus elementos en la lista resultante. Por ejemplo, dadas las listas [1, 2, 3, 4] y [5, 6], debe obtener la lista [1, 5, 2, 6, 3, 4].

void slist_partir(SList lista);     // que divide una lista a la mitad. En caso de longitud impar (2n + 1), la primer lista tendr´a longitud n + 1 y la segunda n. Retorna un puntero al primer elemento de la segunda mitad, siempre que sea no vac´ıa.







#endif /* __SLIST_H__ */
