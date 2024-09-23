#ifndef _AVL_H_
#define _AVL_H_
#include <stdlib.h>

typedef void* (*FuncionCopia)(void* dato);
typedef void (*FuncionDestructora)(void* dato);
typedef int (*FuncionComparadora)(void* dato1, void* dato2);
typedef void (*FuncionVisitante)(void* dato);

struct _AVL{
    void* dato;
    struct _AVL* izq;
   struct  _AVL* der;
    FuncionComparadora comp;
    FuncionCopia copy;
    FuncionDestructora destroy;
    FuncionVisitante visit;
    int altura;
};

typedef struct _AVL* AVL;

typedef enum{
    AVL_RECORRIDO_PRE,
    AVL_RECORRIDO_IN,
    AVL_RECORRIDO_POST
}AVLRecorido;

AVL avl_crear(FuncionComparadora comp, FuncionVisitante visit, FuncionCopia copy, FuncionDestructora destroy);

AVL avl_insertar(AVL avl, void* dato, FuncionComparadora comp, FuncionCopia copy, FuncionDestructora destroy, FuncionVisitante visit);

int avl_factor_balance(AVL avl);

int max(int a, int b);

int avl_max_alt_entre_hijos(AVL avl);

int avl_altura(AVL avl);

AVL avl_balance(AVL avl);

void avl_recorrer(AVL avl, AVLRecorido orden);

AVL avl_eliminar(AVL avl, void* dato);

AVL avl_rot_izq(AVL avl);

AVL avl_rot_der(AVL avl);




#endif