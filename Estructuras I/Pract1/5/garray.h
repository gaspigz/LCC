#include <stdlib.h>

typedef void (*FuncionVisitante) (void* dato);
typedef void* (*FuncionCopiadora) (void* dato);

typedef struct _GArray{
    void** datos;
    int capacidad;
    int ultimo;
};

typedef struct _GArray* GArray;

GArray garray_crear();

int garray_vacia(GArray arr);

void garray_insertar(GArray arr, void* dato, FuncionCopiadora copy);

void garray_recorrer(GArray arr, FuncionVisitante visit);

