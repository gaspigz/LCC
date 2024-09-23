#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "avl.h"

AVL avl_crear(FuncionComparadora comp, FuncionVisitante visit, FuncionCopia copy, FuncionDestructora destroy){
    AVL avl = malloc(sizeof(struct _AVL));
    assert(avl != NULL);
    avl->izq = NULL;
    avl->der = NULL;
    avl->comp = comp;
    avl->copy = copy;
    avl->destroy = destroy;
    avl->visit = visit;
    avl->dato = NULL;
    avl->altura = 0;
    return avl;
}

int max(int a, int b){
    return a >= b ? a : b;
}

int avl_max_alt_entre_hijos(AVL avl){
    if(avl == NULL) return -1;
    return max(avl_altura(avl->der), avl_altura(avl->izq));
}

int avl_altura(AVL avl){
    if(avl == NULL) return -1;
    return avl->altura;
}

int avl_factor_balance(AVL avl){
    if(avl == NULL) return 0;
    return avl_altura(avl->der) - avl_altura(avl->izq);
}

AVL avl_rot_izq(AVL raiz_original){
    AVL nueva_raiz = raiz_original->der;
    raiz_original->der = nueva_raiz->izq;
    nueva_raiz->izq = raiz_original;
    raiz_original->altura = avl_max_alt_entre_hijos(raiz_original) + 1;
    nueva_raiz->altura = avl_max_alt_entre_hijos(nueva_raiz) + 1;
    return nueva_raiz;

}

AVL avl_rot_der(AVL raiz_original){
    AVL nueva_raiz = raiz_original->izq;
    raiz_original->izq = nueva_raiz->der;
    nueva_raiz->der = raiz_original;
    raiz_original->altura = avl_max_alt_entre_hijos(raiz_original) + 1;
    nueva_raiz->altura = avl_max_alt_entre_hijos(nueva_raiz) + 1;
    return nueva_raiz;

}

AVL avl_balance(AVL avl){
    if(avl == NULL) return avl;
    if(avl_factor_balance(avl) == -1 || avl_factor_balance(avl) == 1 || avl_factor_balance(avl) == 0){
        return avl;
    }
    if(avl_factor_balance(avl) == 2){
        //Esta cargado a derecha, veamos su hijo derecho
        if(avl_factor_balance(avl->der) == -1){
            //Esta cargado a izq. el hijo, hace falta doble.
            avl->der = avl_rot_der(avl->der);
        }
        //Ya esta solo cargado a derecha
        avl = avl_rot_izq(avl);
    }else{
        //Esta cargado a izquierda, veamos su hijo izquierdo
        if(avl_factor_balance(avl->izq) == 1){
            //Esta cargado a der. el hijo, hace falta doble
            avl->izq = avl_rot_izq(avl->izq);
        }
        //Ya esta solo cargado a izquierda
        avl = avl_rot_der(avl);
    }
    return avl;

}

AVL avl_insertar(AVL avl, void* dato, FuncionComparadora comp, FuncionCopia copy, FuncionDestructora destroy, FuncionVisitante visit){
    if(avl == NULL || avl->dato == NULL){
        AVL nuevo_nodo = avl_crear(comp, visit, copy, destroy);
        assert(nuevo_nodo != NULL);
        nuevo_nodo->dato = copy(dato);
        return nuevo_nodo;
    }
    if(avl->comp(dato, avl->dato) > 0){
        avl->der = avl_insertar(avl->der, dato, avl->comp, avl->copy, avl->destroy, avl->visit);
        avl->altura = 1 + avl_max_alt_entre_hijos(avl);
    }
    if(avl->comp(dato, avl->dato) < 0){
        avl->izq = avl_insertar(avl->izq, dato, avl->comp, avl->copy, avl->destroy, avl->visit);
        avl->altura = 1 + avl_max_alt_entre_hijos(avl);
    }
    avl = avl_balance(avl);
    return avl;
}

AVL avl_eliminar(AVL avl , void* dato){
    if(avl == NULL) return NULL;
    if(avl->comp(dato, avl->dato) > 0){
        avl->der = avl_eliminar(avl->der, dato);
    }else if(avl->comp(dato, avl->dato) < 0){
        avl->izq = avl_eliminar(avl->izq, dato);
    }else{
        if(avl->izq == NULL && avl->der == NULL){
            avl->destroy(avl->dato);
            free(avl);
            return NULL;
        }
        if(avl->izq != NULL && avl->der == NULL){
            avl->destroy(avl->dato);
            AVL new = avl->izq;
            free(avl);
            return new;
        }
        if(avl->izq == NULL && avl->der != NULL){
            avl->destroy(avl->dato);
            AVL new = avl->der;
            free(avl);
            return new;
        }
        if(avl->izq != NULL && avl->der != NULL){
            AVL padre_reemplazo = avl;
            AVL nodo_reemplazo = avl->der;
            while(nodo_reemplazo->izq != NULL){
                padre_reemplazo = nodo_reemplazo;
                nodo_reemplazo = nodo_reemplazo->izq;
            }
            nodo_reemplazo->izq = avl->izq;
            if(padre_reemplazo != avl){
                padre_reemplazo->izq = nodo_reemplazo->der;
                nodo_reemplazo->der = avl->der;
            }
            avl->destroy(avl->dato);
            free(avl);
            return nodo_reemplazo;
        }
    }
    avl->altura = 1 + avl_max_alt_entre_hijos(avl);
    avl = avl_balance(avl);
    return avl;
}

void avl_recorrer(AVL avl, AVLRecorido orden){
    if(avl == NULL) return;
    if(orden == AVL_RECORRIDO_PRE){
        avl->visit(avl->dato);
        avl_recorrer(avl->izq, orden);
        avl_recorrer(avl->der, orden);
    }

    if(orden == AVL_RECORRIDO_IN){
        avl_recorrer(avl->izq, orden);
        avl->visit(avl->dato);
        avl_recorrer(avl->der, orden);
    }

    if(orden == AVL_RECORRIDO_POST){
        avl_recorrer(avl->izq, orden);
        avl_recorrer(avl->der, orden);
        avl->visit(avl->dato);
    }
}