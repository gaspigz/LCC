#include "avl.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

AVL avl_crear(FuncionComparadora comp, FuncionVisitante visit, FuncionCopia copy, FuncionDestructora destroy){
    AVL avl = malloc(sizeof(struct _AVL));
    assert(avl != NULL);
    avl->comp = comp;
    avl->visit = visit;
    avl->copy = copy;
    avl->destroy = destroy;
    avl->der = NULL;
    avl->izq = NULL;
    avl->dato = NULL;
    avl->altura = 0;
    return avl;
}

AVL avl_insertar(AVL avl, void* dato, FuncionComparadora comp, FuncionCopia copy, FuncionDestructora destroy, FuncionVisitante visit){
    if(dato == NULL) return avl;
    if(avl == NULL){
        avl = avl_crear(comp, visit, copy, destroy);
        assert(avl != NULL);
        avl->dato = copy(dato);
        return avl;
    }
    if(avl->dato == NULL){
       avl->dato = copy(dato);
       return avl;
    } 
    if(avl->comp(dato, avl->dato) > 0){
        avl->der = avl_insertar(avl->der, dato, comp, copy, destroy, visit);
    }
    if(avl->comp(dato, avl->dato) < 0){
        avl->izq = avl_insertar(avl->izq, dato, comp, copy, destroy, visit);
    }
    avl->altura = 1 + avl_max_alt_entre_hijos(avl);
    avl = avl_balance(avl);
    return avl;
}

int avl_factor_balance(AVL avl){
    return avl->der->altura - avl->izq->altura;
}

int max(int a, int b){
    return a >= b ? a : b;
}

int avl_max_alt_entre_hijos(AVL avl){
    if(avl->der == NULL && avl->izq != NULL) return avl->izq->altura;
    if(avl->der != NULL && avl->izq == NULL) return avl->der->altura;
    if(avl->der == NULL && avl->izq == NULL) return -1;

    return max(avl->der->altura, avl->izq->altura);
}

int avl_altura(AVL avl){
    if(avl == NULL) return -1;
    return 1 + avl_max_alt_entre_hijos(avl);
}

AVL avl_balance(AVL avl){
    if(avl_factor_balance(avl) == 1 || avl_factor_balance(avl) == -1 || avl_factor_balance(avl) == 0) return avl;
    if(avl_factor_balance(avl) == 2){ //PESADO A DERECHA
        if(avl_factor_balance(avl->der) == -1){
            avl->der = avl_rot_der(avl->der);
        }
        avl = avl_rot_izq(avl);

    }
    if(avl_factor_balance(avl) == -2){ //PESADO A IZQ
        if(avl_factor_balance(avl->izq) == 1){
            avl->izq = avl_rot_izq(avl->izq);
        }
        avl = avl_rot_der(avl);

    }
    return avl;
}

void avl_recorrer(AVL avl, AVLRecorido orden);

AVL avl_eliminar(AVL avl, void* dato);

AVL avl_rot_izq(AVL avl){
    
}

AVL avl_rot_der(AVL avl);