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

  slist_recorrer(lista, imprimir_entero);
  printf("\n\n");
  lista = slist_elimina_subceros(lista);
  slist_recorrer(lista, imprimir_entero);

  

  return 0;
}
