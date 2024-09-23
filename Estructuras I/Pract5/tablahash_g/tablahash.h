#ifndef _TABLAHASH_H_
#define _TABLAHASH_H_
#include <stdlib.h>

typedef int (*FuncionComparadora)(void* dato1, void* dato2);
typedef void* (*FuncionCopiadora)(void* dato);
typedef void (*FuncionDestructora)(void* dato);
typedef unsigned (*FuncionHash)(void* dato);

typedef struct _TablaHash *TablaHash;

TablaHash tablahash_crear(unsigned cantidad, FuncionComparadora comp, FuncionCopiadora copy, FuncionDestructora destroy, FuncionHash hash);

int tablahash_nelems(TablaHash tabla);

unsigned tablahash_capacidad(TablaHash tabla);

void tablahash_destruir(TablaHash tabla);

TablaHash tablahash_insertar(TablaHash tabla, void* dato);

void* tablahash_buscar(TablaHash tabla, void* dato);

void tablahash_eliminar(TablaHash tabla, void* dato);

TablaHash tablahash_redimensionar(TablaHash tabla);


#endif