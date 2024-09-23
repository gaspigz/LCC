#ifndef __GARRAY_H__
#define __GARRAY_H__

typedef void *(*FuncionCopiadora)(void *dato);
typedef int (*FuncionComparadora)(void *, void *);
typedef void (*FuncionDestructora)(void *dato);
typedef void (*FuncionVisitanteExtra)(void *dato, void *extra);


typedef struct _GArray *GArray;

GArray garray_crear();

GArray garray_insertar(GArray array, void* dato, int posicion);

GArray garray_insertar_nopos(GArray array, void* dato);

void garray_recorrer(GArray array, FuncionVisitanteExtra visit);

int garray_complete_check_menoramayor(GArray array, FuncionComparadora comp);


#endif //__GARRAY_H__