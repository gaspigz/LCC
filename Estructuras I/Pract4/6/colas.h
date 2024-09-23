#include <stdio.h>
#include "glist.h"

//Voy a usar una lista que tenga puntero a inicio y final simplemente enlazada
//Donde se agregue por final y se quite por inicio

typedef GList *Cola;

Cola cola_crear();

void cola_destruir(Cola cola, FuncionDestructora destroy);

int cola_es_vacia(Cola cola);

void* cola_inicio(Cola cola);

Cola cola_encolar(Cola cola, void *dato, FuncionCopia copia);

Cola cola_desencolar(Cola cola, FuncionDestructora destroy);

void cola_imprimir(Cola cola, FuncionVisitante visit);

Cola cola_desencolar_nofree(Cola cola);