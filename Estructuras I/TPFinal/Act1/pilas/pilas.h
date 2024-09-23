#include <stdio.h>
#include "glist.h"


typedef GList Pila;

Pila pila_crear();

void pila_destruir(Pila pila, FuncionDestructora destroy);

int pila_es_vacia(Pila pila);

void* pila_tope(Pila pila);

Pila pila_apilar(Pila pila, char *dato, FuncionCopia copia);

Pila pila_desapilar(Pila pila);

void pila_imprimir(Pila pila, FuncionVisitante visit);

FuncionCopia *string_copia(char* string);