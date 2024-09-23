#include "bstree.h"
#include <assert.h>
#include <stdlib.h>

/**
 * Estructura del nodo del arbol de busqueda binaria.
 * Tiene un puntero al dato (dato),
 * un puntero al nodo raiz del subarbol izquierdo (izq),
 * y un puntero al nodo raiz del subarbol derecho (der).
 */
struct _BST_Nodo {
  void *dato;
  struct _BST_Nodo *izq, *der;
};

/**
 * bstee_crear: Retorna un arbol de busqueda binaria vacio
 */
BSTree bstee_crear() { return NULL; }

/**
 * bstree_destruir: Destruye el arbol y sus datos
 */
void bstree_destruir(BSTree raiz, FuncionDestructora destr) {
  if (raiz != NULL) {
    bstree_destruir(raiz->izq, destr);
    bstree_destruir(raiz->der, destr);
    destr(raiz->dato);
    free(raiz);
  }
};

/**
 * bstree_buscar: Retorna 1 si el dato se encuentra y 0 en caso
 * contrario
 */
BSTree bstree_buscar(BSTree raiz, void *dato, FuncionComparadora comp) {
  if (raiz == NULL)
    return NULL;
  else if (comp(dato, raiz->dato) == 0) // raiz->dato == dato
    return raiz;
  else if (comp(dato, raiz->dato) < 0) // dato < raiz->dato
    return bstree_buscar(raiz->izq, dato, comp);
  else // raiz->dato < dato
    return bstree_buscar(raiz->der, dato, comp);
}

BSTree bstree_buscar_padre(BSTree raiz, void *dato, FuncionComparadora comp) {
  if (raiz == NULL)
    return NULL;
  else if (comp(dato, raiz->dato) == 0) // raiz->dato == dato
    return NULL;
  else if (comp(dato, raiz->der->dato) == 0 || comp(dato, raiz->der->dato) == 0)
    return raiz;
  else if (comp(dato, raiz->dato) < 0) // dato < raiz->dato
    return bstree_buscar_padre(raiz->izq, dato, comp);
  else // raiz->dato < dato
    return bstree_buscar_padre(raiz->der, dato, comp);
}

/**
 * bstree_insertar: Inserta un dato no repetido en el arbol, manteniendo la
 * propiedad del arbol de busqueda binaria
 */
BSTree bstree_insertar(BSTree raiz, void *dato, FuncionCopiadora copia,
                       FuncionComparadora comp) {
  if (raiz == NULL) { // insertar el dato en un nuevo nodo
    struct _BST_Nodo *nuevoNodo = malloc(sizeof(struct _BST_Nodo));
    assert(nuevoNodo != NULL);
    nuevoNodo->dato = copia(dato);
    nuevoNodo->izq = nuevoNodo->der = NULL;
    return nuevoNodo;
  } else if (comp(dato, raiz->dato) < 0) // dato < raiz->dato
    raiz->izq = bstree_insertar(raiz->izq, dato, copia, comp);
  else if (comp(dato, raiz->dato) > 0) // raiz->dato < dato
    raiz->der = bstree_insertar(raiz->der, dato, copia, comp);
  // si el dato ya se encontraba, no es insertado
  return raiz;
}

/**
 * bstree_recorrer: Recorrido DSF del arbol
 */
void bstree_recorrer(BSTree raiz, BSTreeRecorrido orden,
                     FuncionVisitanteExtra visita, void *extra) {
  if (raiz != NULL) {
    if (orden == BTREE_RECORRIDO_PRE)
      visita(raiz->dato, extra);
    bstree_recorrer(raiz->izq, orden, visita, extra);
    if (orden == BTREE_RECORRIDO_IN)
      visita(raiz->dato, extra);
    bstree_recorrer(raiz->der, orden, visita, extra);
    if (orden == BTREE_RECORRIDO_POST)
      visita(raiz->dato, extra);
  }
}

BSTree menorEntreMayores(BSTree arbol){

	if(arbol->izq == NULL) return arbol;
	return menorEntreMayores(arbol->izq);


}

BSTree menorEntreMayores_padre(BSTree arbol){


  if(arbol->izq == NULL) return arbol;
	if(arbol->izq->izq == NULL) return arbol;
	return menorEntreMayores_padre(arbol->izq);


}

BSTree nodoReemplazo(BSTree nodoAEliminar){
	if(nodoAEliminar == NULL) return NULL;
	if(nodoAEliminar->izq == NULL && nodoAEliminar->der == NULL) return NULL;
	if(nodoAEliminar->izq != NULL && nodoAEliminar->der == NULL) return nodoAEliminar->izq;
	if(nodoAEliminar->izq == NULL && nodoAEliminar->der != NULL) return nodoAEliminar->der;
	if(nodoAEliminar->izq != NULL && nodoAEliminar->der != NULL) return menorEntreMayores(nodoAEliminar->der);
	
}

BSTree nodoReemplazo_padre(BSTree nodoAEliminar){
	if(nodoAEliminar == NULL) return NULL;
	if(nodoAEliminar->izq == NULL && nodoAEliminar->der == NULL) return nodoAEliminar;
	if(nodoAEliminar->izq != NULL && nodoAEliminar->der == NULL) return nodoAEliminar;
	if(nodoAEliminar->izq == NULL && nodoAEliminar->der != NULL) return nodoAEliminar;
	if(nodoAEliminar->izq != NULL && nodoAEliminar->der != NULL) return menorEntreMayores_padre(nodoAEliminar->der);
	
}

BSTree busca_padre(BSTree origen, BSTree nodo_hijo, FuncionComparadora comp){
  if(origen == NULL) return NULL;
  if(comp(nodo_hijo->dato, origen->dato) > 0){
    if(origen->der == nodo_hijo){ return origen;}
    else{
      return busca_padre(origen->der, nodo_hijo, comp);
    }

  }
  if(comp(nodo_hijo->dato, origen->dato) < 0){
    if(origen->izq == nodo_hijo){ return origen;}
    else{
      return busca_padre(origen->izq, nodo_hijo, comp);
    }

  }
}

BSTree bstree_eliminar(BSTree arbol, void *dato, FuncionComparadora comp, FuncionDestructora destroy){
  if(arbol == NULL) return NULL;

  if(comp(dato, arbol->dato) == 0){
    if(arbol->der == NULL && arbol->izq == NULL){
      destroy(arbol);
      return NULL;
    }
    if(arbol->der == NULL && arbol->izq != NULL){
      BSTree nodo_reemplazo = arbol->izq;
      arbol->izq = NULL;
      destroy(arbol);
      return nodo_reemplazo;
    }
    if(arbol->der != NULL && arbol->izq == NULL){
      BSTree nodo_reemplazo = arbol->der;
      arbol->der = NULL;
      destroy(arbol);
      return nodo_reemplazo;
    }
    if(arbol->der != NULL && arbol->izq != NULL){
      BSTree padre_de_reemplazo = arbol;
      BSTree nodo_reemplazo = arbol->der;
      while(nodo_reemplazo->izq != NULL){
        padre_de_reemplazo = nodo_reemplazo;
        nodo_reemplazo = nodo_reemplazo->izq;
      }
      BSTree derecha_de_reemplazo = nodo_reemplazo->der;
      padre_de_reemplazo->izq = derecha_de_reemplazo;
      nodo_reemplazo->izq = arbol->izq;
      nodo_reemplazo->der = arbol->der;
      arbol->der = NULL;
      arbol->izq = NULL;
      destroy(arbol);
      return nodo_reemplazo;

    }


  }
  if(comp(dato, arbol->dato) > 0){
    arbol->der = bstree_eliminar(arbol->der, dato, comp, destroy);
    return arbol;
  }else{
    arbol->izq = bstree_eliminar(arbol->izq, dato, comp, destroy);
    return arbol;
  }



}


  //COMO HACERLO RETORNAR ALGO Y ES NECESARIO QUE k SEA *INT?
void bstree_kesimo_menor(BSTree arbol, int *k, FuncionVisitanteExtra visit, void* extra){

  if(arbol != NULL){
    bstree_kesimo_menor(arbol->izq, k, visit, extra);
    if(*k == 1){
      visit(arbol->dato, NULL);
      *k = 0;
      return;

    }else{
        *k = *k -1;
      bstree_kesimo_menor(arbol->der, k, visit, extra);


    } 
  }

}

GArray bstree_to_garray(BSTree arbol, GArray array){
  if(arbol == NULL) return array;
  array = bstree_to_garray(arbol->izq, array);
  array = garray_insertar_nopos(array, arbol->dato);
  array = bstree_to_garray(arbol->der, array);
  return array;

}

//CHECK
void* menorMayor(BSTree arbol){
  if(arbol->der == NULL) return arbol->dato;
  return menorMayor(arbol->der);
}
void* mayorMenor(BSTree arbol){
  if(arbol->izq == NULL) return arbol->dato;
  return menorMayor(arbol->izq);
}

int bstree_validar(BSTree arbol, FuncionVisitanteExtra visit, FuncionComparadora comp){
  /*if(arbol == NULL) return 1;
  GArray array = garray_crear();
  array = bstree_to_garray(arbol, array);
  garray_recorrer(array, visit);
  return garray_complete_check_menoramayor(array, comp);
  */
 // Raiz sea mayor al mayor menor
 // Raiz sea menor al menor mayor
 // que sean bst l y r
 if(arbol == NULL) return 1;
 if(bstree_validar(arbol->izq, visit, comp) == 0) return 0;
 if(bstree_validar(arbol->der, visit, comp) == 0) return 0;
 if(comp(arbol->dato, menorMayor(arbol))<=0 && comp(arbol->dato, mayorMenor(arbol))>=0) return 1;
 

  return 0;
  
}

