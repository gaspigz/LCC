#ifndef __ADICIONAL_C__
#define __ADICIONAL_C__

typedef struct _GNodo{
    void* data;
    struct _GNodo *next;
}GNodo;

typedef GNodo* GList;

typedef void (*FuncionDestructora)(void *dato);

typedef void (*FuncionVisitante)(void *dato);

typedef void* (*FuncionCopia)(void *data);

typedef int (*FuncionComparadora)(void *data1, void *dato2);

GList glist_crear();

GList agregar_inicio(GList lista, FuncionCopia copy, void* data);

GList agregar_final(GList lista, FuncionCopia copy, void* data);

int glist_esvacia(GList lista);

void glist_destruir(GList lista, FuncionDestructora destroy);

void glist_recorrer(GList lista, FuncionVisitante visit);

int glist_espalindrome(GList lista,  FuncionComparadora comp, FuncionCopia copy);

GList glist_reverse(GList lista, FuncionCopia copy);





#endif