#include "btree.h"
#include <assert.h>
#include <stdlib.h>
#include "pilas.h"
#include "colas.h"


struct _BTNodo {
  int dato;
  struct _BTNodo *left;
  struct _BTNodo *right;
};

/**
 * Devuelve un arbol vacío.
 */
BTree btree_crear() { return NULL; }

/**
 * Destruccion del árbol.
 */
void btree_destruir(BTree nodo) {
  if (nodo != NULL) {
    btree_destruir(nodo->left);
    btree_destruir(nodo->right);
    free(nodo);
  }
}

/**
 * Indica si el árbol es vacío.
 */
int btree_empty(BTree nodo) { return nodo == NULL; }

/**
 * Crea un nuevo arbol, con el dato dado en el nodo raiz, y los subarboles dados
 * a izquierda y derecha.
 */
BTree btree_unir(int dato, BTree left, BTree right) {
  BTree nuevoNodo = malloc(sizeof(struct _BTNodo));
  assert(nuevoNodo != NULL);
  nuevoNodo->dato = dato;
  nuevoNodo->left = left;
  nuevoNodo->right = right;
  return nuevoNodo;
}

/**
 * Recorrido del arbol, utilizando la funcion pasada.
 */
void btree_recorrer(BTree arbol, BTreeOrdenDeRecorrido orden,
                    FuncionVisitanteInt visit) {

      if(arbol == NULL){
        return;
      }

      switch (orden)
      {
      case BTREE_RECORRIDO_PRE:
        visit(arbol->dato);
        btree_recorrer(arbol->left, orden, visit);
        btree_recorrer(arbol->right, orden, visit);
        break;
      
      case BTREE_RECORRIDO_IN:
        btree_recorrer(arbol->left, orden, visit);
        visit(arbol->dato);
        btree_recorrer(arbol->right, orden, visit);
        break;
      
      case BTREE_RECORRIDO_POST:
        btree_recorrer(arbol->left, orden, visit);
        btree_recorrer(arbol->right, orden, visit);
        visit(arbol->dato);
        break;
      
      default:
        break;
      }


  return;
}

void *no_copia(void *dato){
  return dato;
}

void no_destruye(void *dato){
  return;
}

void btree_recorrer_iterativo(BTree arbol, FuncionVisitanteInt visit) {
/*
      if(arbol == NULL){
        return;
      }
      BTree nodo_inicio = arbol;
      Pila pila = pila_crear;
      pila = pila_apilar(pila, nodo_inicio, no_copia);
      while(!pila_es_vacia(pila)){
        visit(pila_tope);
        pila = pila_desapilar(pila);
        pila_apilar(pila, nodo_inicio->right, no_copia);
        pila_apilar(pila, nodo_inicio->left, no_copia);
      }

*/
  return;
}

int btree_nnodos(BTree arbol)    // que retorne el n´umero de nodos del ´arbol.
{
  if(arbol == NULL) return 0;

  return 1 + btree_nnodos(arbol->left) + btree_nnodos(arbol->right);

}

int btree_buscar(BTree arbol, int numero)     //que retorne 1 si el n dado se encuentra en el ´arbol, y 0 en caso contrario.
{
  if(arbol == NULL) return 0;
  return (arbol->dato == numero) + btree_buscar(arbol->left, numero) + btree_buscar(arbol->right, numero);
}

BTree btree_copiar(BTree arbol)     //que retorne un nuevo ´arbol que sea una copia del ´arbol dado.
{
  BTree nuevo_arbol = malloc(sizeof(BTree));
  if(arbol == NULL) return NULL;
  nuevo_arbol->dato = arbol->dato;
  nuevo_arbol->left = btree_copiar(arbol->left);
  nuevo_arbol->right = btree_copiar(arbol->right);
  return nuevo_arbol;
  
}

int maximo_de_tres(int a, int b, int c){
  return ((a <= b) && (c <= b)) ? b : (((b <= a) && (c <= a))? a : c);
}

int btree_altura(BTree arbol)     //que retorne la altura del ´arbol.
{
  if (arbol == NULL) return 0;
  return maximo_de_tres(0 , 1 + btree_altura(arbol->left), 1 + btree_altura(arbol->right));
}

int btree_nnodos_profundidad(BTree arbol, int profundidad)      //que retorne el n´umero de nodos que se encuentran a la profundidad dada
{
  if(arbol == NULL) return 0;
  return profundidad != 0 ? 
    btree_nnodos_profundidad(arbol->left, profundidad - 1) + btree_nnodos_profundidad(arbol->right, profundidad - 1) :
    1 + btree_nnodos_profundidad(arbol->left, profundidad - 1) + btree_nnodos_profundidad(arbol->right, profundidad - 1);

}
/*
int btree_profundidad(BTree arbol, int n)              //que retorne la profundidad del nodo que contiene el n dado, y -1 si el n no se encuentra en el arb.
{
    if(arbol == NULL) return -1;
    if(btree_buscar(arbol, n) == 0){
      return -1;
    }else{
      return btree_profundidad_si_esta(arbol, n);
    }
}


int btree_profundidad_si_esta(BTree arbol, int dato){
    if(arbol->dato == dato) return 0;
      if(btree_buscar(arbol->left, dato) != 0){
        return 1 + btree_profundidad(arbol->left, dato);
      }else{
        return 1 + btree_profundidad(arbol->right, dato);
      }
}*/
//Ver como implementarlo de forma más efectiva

int btree_profundidad(BTree arbol, int n)              //que retorne la profundidad del nodo que contiene el n dado, y -1 si el n no se encuentra en el arb.
{
    if(arbol == NULL) return -1;
    if(arbol->dato == n) return 0;
    int profundidad_left = btree_profundidad(arbol->left , n);

    if(profundidad_left != -1){
      return profundidad_left + 1;
    }

    int profundidad_right = btree_profundidad(arbol->right , n);
    if(profundidad_right != -1){
      return profundidad_right + 1;
    }

    return -1;

}

int maximo(int a, int b){
  return a >= b ? a : b; 
}


int btree_sumar(BTree arbol)                    //que retorne la suma total de los datosẞ del arb.
{
    if(arbol == NULL) return 0;
    return arbol->dato + btree_sumar(arbol->left) + btree_sumar(arbol->right);
}

void btree_recorrer_extra(BTree arbol, BTreeOrdenDeRecorrido orden, FuncionVisitanteExtra visit, void *extra){
  if(arbol == NULL){
        return;
      }

      switch (orden)
      {
      case BTREE_RECORRIDO_PRE:
        visit(arbol->dato, extra);
        btree_recorrer_extra(arbol->left, orden, visit, extra);
        btree_recorrer_extra(arbol->right, orden, visit, extra);
        break;
      
      case BTREE_RECORRIDO_IN:
        btree_recorrer_extra(arbol->left, orden, visit, extra);
        visit(arbol->dato, extra);
        btree_recorrer_extra(arbol->right, orden, visit, extra);
        break;
      
      case BTREE_RECORRIDO_POST:
        btree_recorrer_extra(arbol->left, orden, visit, extra);
        btree_recorrer_extra(arbol->right, orden, visit, extra);
        visit(arbol->dato, extra);
        break;
      
      default:
        break;
      }


  return;
}

void print_current_profundidad(BTree arbol, int profundidad_deseada, FuncionVisitanteInt visit){
  if(arbol == NULL) return;
  if(profundidad_deseada == 0){
    visit(arbol->dato);
    return;
  }
  print_current_profundidad(arbol->left, profundidad_deseada - 1, visit);
  print_current_profundidad(arbol->right, profundidad_deseada - 1, visit);


}

void btree_bfs(BTree arbol, FuncionVisitanteInt visit){
  if(arbol == NULL) return;
  
  int altura = btree_altura(arbol);

  for(int profundidad_actual = 0; profundidad_actual < altura; profundidad_actual++){
    print_current_profundidad(arbol, profundidad_actual, (FuncionVisitanteInt) visit);
  }

}

void btree_bfs_iterativo(BTree arbol, FuncionVisitanteInt visit){
  if(arbol == NULL) return;
  Cola cola = cola_crear();

  cola = cola_encolar(cola, arbol, no_copia);

  while(!cola_es_vacia(cola)){
    BTree saliendo = cola_inicio(cola);
    visit(saliendo->dato);
    cola = cola_desencolar(cola, no_destruye);
    if(saliendo->left != NULL) cola = cola_encolar(cola, saliendo->left, no_copia);
    if(saliendo->right != NULL) cola = cola_encolar(cola, saliendo->right, no_copia);


  }



}