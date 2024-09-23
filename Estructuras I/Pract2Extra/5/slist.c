#include "slist.h"
#include <stdlib.h>
#include <stdio.h>

static void imprimir_entero(int dato) {
  printf("%d ", dato);
}

SList slist_crear() {
  return NULL;
}

void slist_destruir(SList lista) {
  SNodo *nodoAEliminar;
  while (lista != NULL) {
    nodoAEliminar = lista;
    lista = lista->sig;
    free(nodoAEliminar);
  }
}

int slist_vacia(SList lista) {
  return lista == NULL;
}

SList slist_agregar_final(SList lista, int dato) {
  SNodo *nuevoNodo = malloc(sizeof(SNodo));
  nuevoNodo->dato = dato;
  nuevoNodo->sig = NULL;

  if (lista == NULL)
    return nuevoNodo;

  SList nodo = lista;
  for (;nodo->sig != NULL;nodo = nodo->sig);
  /* ahora 'nodo' apunta al ultimo elemento en la lista */

  nodo->sig = nuevoNodo;
  return lista;
}

SList slist_agregar_inicio(SList lista, int dato) {
  SNodo *nuevoNodo = malloc(sizeof(SNodo));
  nuevoNodo->dato = dato;
  nuevoNodo->sig = lista;
  return nuevoNodo;
}

void slist_recorrer(SList lista, FuncionVisitante visit) {
  for (SNodo *nodo = lista; nodo != NULL; nodo = nodo->sig)
    visit(nodo->dato);
}

int slist_longitud(SList lista){
  if(lista == NULL) return 0;
  int longitud = 0;
  for(SList inicio = lista; inicio != NULL; inicio = inicio->sig){
    longitud++;
  }
  return longitud;
}

SList slist_concatenar(SList lista_inicio, SList lista_final){
  if(lista_inicio == NULL) return lista_final;
  SList inicio = lista_inicio;
  for(;inicio->sig != NULL; inicio = inicio->sig);
  inicio->sig = lista_final;
  return lista_inicio;
}

SList slist_insertar(SList lista, int dato, int posicion){
  if(lista == NULL && posicion == 1) return slist_agregar_inicio(lista, dato);
  if(lista == NULL && posicion != 1) return NULL;
  if(posicion < 1) return NULL;
  if(posicion > slist_longitud(lista)+1) return NULL;
  for(SList inicio = lista; inicio != NULL; inicio = inicio->sig){
    
  }
}

SList slist_elimina_secuencias_0(SList lista){
  
  if(lista == NULL) return NULL;

  // La variable suma acumulada se ira reiniciando de modo que acumula la suma de la secuencia actual y la variable bandera es 1 si se encuentra una secuencia donde la suma es 0
  int suma_acumulada = 0;
  int bandera = 0;
  // Inicio es un nodo que en principio apunta al inicio de la lista, luego este va avanzando
  //Esta hecho con un while ya que en el caso de que el inicio deba ser eliminado, no quiero que se avance sobre inicio, este se asigna manuealmente.
  SList inicio = lista;
  while(inicio != NULL){
    //Reinicio las variables
    suma_acumulada = 0;
    bandera = 0;
    //Nodo que apunta al final de la secuencia que suma 0
    SNodo *finalizacion = NULL;

    //Chequear secuencias a partir de inicio, mediante un actual. Si hay secuencia valida se asigna finalizacion a donde apunte actual.
    for(SNodo *actual = inicio;actual != NULL && bandera == 0; actual = actual->sig){
      suma_acumulada = suma_acumulada + actual->dato;
      if(suma_acumulada == 0){
        bandera = 1;
        finalizacion = actual;
      }
      printf("DATO: %d, SUMA: %d",actual->dato, suma_acumulada);
      getchar();
    }

    if(bandera == 1){
      //Se encontro secuencia
      //Inicio ant es sera el inmediato anterior al inicio actual y inicio aux sera inicio (una copia para luego destruirla)
      SList inicio_ant = lista;
      SList inicio_aux = inicio;

      if(inicio_ant == inicio){
        //La secuencia esta en el inicio de la lista
        //El nuevo inicio sera el siguiente al ultimo de la secuencia (finalizador)
        inicio = finalizacion->sig;
        //El nuevo INICIO DE LA LISTA sera inicio
        lista = inicio;
        //Se hace que finalizacion sig sea null para que se elimine la lista que comienza en inicio_aux y termine en finalizacion.
        finalizacion->sig = NULL;
        printf("T inicio data: %d, Inicio ant: %d",inicio->dato, inicio_ant->dato);
        getchar();
        slist_destruir(inicio_aux); //Inicio_aux ahora inicia la lista a destruir, que finaliza en actual. Inicio es el siguiente a actual en la proxima vuelta.
      }else{
        //La secuencia no inicia con la lista
        //Se obtiene el verdadero valor de inicio ant
        for(;inicio_ant->sig != inicio; inicio_ant = inicio_ant->sig){
          printf("inicio data: %d, Inicio ant: %d",inicio->dato, inicio_ant->dato);
          getchar();
        }
        inicio_ant->sig = finalizacion->sig;
        finalizacion->sig = NULL;
        inicio = inicio_ant;
        inicio = inicio->sig;
        slist_destruir(inicio_aux); //Inicio_aux ahora inicia la lista a destruir, que finaliza en actual. Inicio es el siguiente a actual en la proxima vuelta.
      }
      
    }else{
      //No hubo secuencia
      inicio = inicio->sig;
    }
  }
  return lista;
}
