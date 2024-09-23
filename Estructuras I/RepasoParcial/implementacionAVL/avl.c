#include "avl.h"
#include <stdio.h>
#include <stdlib.h>

AVL avl_crear(){
    AVL avl = malloc(sizeof(AVL));

    avl->izq = NULL;
    avl->der = NULL;
    avl->dato = NULL;

    return avl;
}

int avl_altura(AVL avl){
    if(avl == NULL) return -1;
    return 1 + avl_max_altura_entre_hijos(avl);
}

int max(int a, int b){
    return a >= b ? a : b;
}

int avl_max_altura_entre_hijos(AVL avl){
    if(avl == NULL) return 0;
    return max(avl_altura(avl->izq), avl_altura(avl->der));

}


int avl_factor_balance(AVL avl){
    if(avl == NULL) return 0;
    int factor = avl_altura(avl->der) - avl_altura(avl->izq);
    return factor;
}

AVL avl_insertar(AVL avl, void* dato, FuncionComparadora comp, FuncionCopiadora copy){

    if(avl == NULL){
        AVL nuevo_avl = avl_crear();
        nuevo_avl->dato = copy(dato);
        return nuevo_avl;
    }

    //INSERTAR COMO ABB
    if(avl->dato == NULL){
        avl->dato = copy(dato);
        return avl;
    }
    if(comp(dato, avl->dato) < 0){
        avl->izq = avl_insertar(avl->izq, dato, comp, copy);
    }else{
        avl->der = avl_insertar(avl->der, dato, comp, copy);
    }

    avl = avl_balance(avl);

    return avl;

}

AVL avl_rot_der(AVL avl){
    AVL nueva_raiz = avl->izq;
    nueva_raiz->der = avl;
    avl->izq = NULL;
    return nueva_raiz;
}

AVL avl_rot_izq(AVL avl){
    AVL nueva_raiz = avl->der;
    nueva_raiz->izq = avl;
    avl->der = NULL;
    return nueva_raiz;
}

AVL avl_balance(AVL avl){
    if(avl == NULL) return NULL;
    if(avl_factor_balance(avl) == 2){
        if(avl_factor_balance(avl->der) != -1) avl->der = avl_rot_der(avl->der);
        avl = avl_rot_izq(avl);
    }else if(avl_factor_balance(avl) == -2){
        if(avl_factor_balance(avl->izq) == 1) avl->izq = avl_rot_izq(avl->izq);
        avl = avl_rot_der(avl);
    }else{
        return avl;
    }
}

void avl_recorrer(AVL avl, FuncionVisitante visit,  AVLRecorrido orden){
    if(avl == NULL){
        return;
      }

      switch (orden)
      {
      case BTREE_RECORRIDO_PRE:
        visit(avl->dato);
        avl_recorrer(avl->izq, visit, orden);
        avl_recorrer(avl->der, visit, orden);
        break;
      
      case BTREE_RECORRIDO_IN:
        avl_recorrer(avl->izq, visit, orden);
        visit(avl->dato);
        avl_recorrer(avl->der, visit, orden);
        break;
      
      case BTREE_RECORRIDO_POST:
        avl_recorrer(avl->izq, visit, orden);
        avl_recorrer(avl->der, visit, orden);
        visit(avl->dato);
        break;
      
      default:
        break;
      }


  return;
}

AVL avl_eliminar(AVL avl, void* dato, FuncionComparadora comp, FuncionCopiadora copy, FuncionDestructora destroy){
    if(dato == NULL) return avl;
    if(avl == NULL) return NULL;
    if(comp(dato, avl->dato) < 0){
        avl->izq = avl_eliminar(avl->izq, dato, comp, copy, destroy);
    }else if(comp(dato, avl->dato) > 0){
        avl->der = avl_eliminar(avl->der, dato, comp, copy, destroy);
    }else{
        if(avl->izq == NULL && avl->der == NULL){
            destroy(avl->dato);
            free(avl);
            return NULL;
        }
        if(avl->izq != NULL && avl->der == NULL){
            AVL aux = avl->izq;
            destroy(avl->dato);
            free(avl);
            return aux;
        }
        if(avl->der != NULL && avl->izq == NULL){
            AVL aux = avl->der;
            destroy(avl->dato);
            free(avl);
            return aux;
        }
        if(avl->der != NULL && avl->izq != NULL){
            AVL reemplazo = avl->der;
            AVL padre_reemplazo = avl;
            while(reemplazo->izq != NULL){
                padre_reemplazo = reemplazo;
                reemplazo = reemplazo->izq;
            }
            padre_reemplazo->izq = reemplazo->der;
            reemplazo->der = avl->der;
            reemplazo->izq = avl->izq;
            destroy(avl->dato);
            free(avl);
            return reemplazo;
        }

    }
    avl = avl_balance(avl);
    return avl;
}