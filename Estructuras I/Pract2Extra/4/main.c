#include <stdio.h>
#include <stdlib.h>
#include "slist.h"

static void imprimir_entero(int dato) {
  printf("%d ", dato);
}

int main(int argc, char *argv[]) {

  SList lista = slist_crear();
  SList lista2 = slist_crear();
  SList lista3 = slist_crear();
  SList lista4 = slist_crear();

  
  lista4 = malloc(sizeof(SNodo));
  lista4->dato = 40;
  lista3 = malloc(sizeof(SNodo));
  lista3->dato = 30;
  lista3->sig = lista4;
  lista2 = malloc(sizeof(SNodo));
  lista2->dato = 20;
  lista2->sig = lista3;
  lista = malloc(sizeof(SNodo));
  lista->dato = 10;
  lista->sig = lista2;

  lista4->sig = lista3;


  //slist_destruir(lista);
  slist_inicio_ciclo(lista);
  //slist_recorrer(slist_inicio_ciclo(lista), imprimir_entero);
  slist_recorrer(lista, imprimir_entero);

  return 0;
}
