#include <stdio.h>
#include <stdlib.h>
#include "slist.h"

static void imprimir_entero(int dato) {
  printf("%d ", dato);
}

int main(int argc, char *argv[]) {

  SList lista = slist_crear();
  SList lista2 = slist_crear();

  lista = slist_agregar_final(lista, 4);
  lista = slist_agregar_final(lista, 6);
  lista = slist_agregar_final(lista, -10);
  lista = slist_agregar_final(lista, 8);
  lista = slist_agregar_final(lista, 9);
  lista = slist_agregar_final(lista, 10);
  lista = slist_agregar_final(lista, -19);
  lista = slist_agregar_final(lista, 10);
  lista = slist_agregar_final(lista, -18);
  lista = slist_agregar_final(lista, 20);
  lista = slist_agregar_final(lista, 25);

  lista2 = slist_agregar_final(lista2, 4);
  lista2 = slist_agregar_final(lista2, 6);
  lista2 = slist_agregar_final(lista2, -10);
  lista2 = slist_agregar_final(lista2, 8);
  lista2 = slist_agregar_final(lista2, 9);
  lista2 = slist_agregar_final(lista2, 10);
  lista2 = slist_agregar_final(lista2, -19);
  lista2 = slist_agregar_final(lista2, 9);
  lista2 = slist_agregar_final(lista2, -18);
  lista2 = slist_agregar_final(lista2, 20);
  lista2 = slist_agregar_final(lista2, 25);

  slist_recorrer(lista, imprimir_entero);
  printf("\n\n");
  //lista = slist_elimina_subceros(lista);
  slist_recorrer(lista, imprimir_entero);
  printf("\n\n");


  SList lista_sufijo_comun = sufijo_comun(lista, lista2);
  slist_recorrer(lista_sufijo_comun, imprimir_entero);
  printf("\n\n");

  lista = reorden(lista);
  slist_recorrer(lista, imprimir_entero);


  

  return 0;
}