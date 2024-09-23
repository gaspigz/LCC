#ifndef __AVL_H__
#define __AVL_H__


typedef struct _AVL{
    void* dato;
    struct _AVL *izq;
    struct _AVL *der;
}_AVL;


typedef enum {
  BTREE_RECORRIDO_IN,  /** Inorden */
  BTREE_RECORRIDO_PRE, /** Preorden */
  BTREE_RECORRIDO_POST /** Postorden */
} AVLRecorrido;

typedef struct _AVL* AVL;

typedef void* (*FuncionCopiadora)(void *dato);
typedef void (*FuncionVisitante)(void* dato);
typedef int (*FuncionComparadora)(void* dato1, void* dato2);
typedef void (*FuncionDestructora)(void* dato);

AVL avl_crear();

AVL avl_insertar(AVL avl, void* dato, FuncionComparadora comp, FuncionCopiadora copy);

int avl_factor_balance(AVL avl);

int avl_max_altura_entre_hijos(AVL avl);

int avl_altura(AVL avl);

int max(int a, int b);

AVL avl_balance(AVL avl);

AVL avl_rot_der(AVL avl);

AVL avl_rot_izq(AVL avl);

void avl_recorrer(AVL avl, FuncionVisitante visit, AVLRecorrido orden);

AVL avl_eliminar(AVL avl, void* dato, FuncionComparadora comp, FuncionCopiadora copy, FuncionDestructora destroy);

AVL avl_menorEntreMayores(AVL avl, FuncionComparadora comp);

#endif