#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "avl.h"

// Funciones de utilidad
void* copiar_entero(void* dato) {
    int* copia = malloc(sizeof(int));
    assert(copia != NULL);
    *copia = *(int*)dato;
    return copia;
}

void destruir_entero(void* dato) {
    free((int*)dato);
}

int comparar_enteros(void* dato1, void* dato2) {
    int a = *(int*)dato1;
    int b = *(int*)dato2;
    return (a > b) - (a < b);
}

void visitar_entero(void* dato) {
    printf("%d ", *(int*)dato);
}

void imprimir_arbol(AVL avl, int nivel) {
    if (avl == NULL) return;
    imprimir_arbol(avl->der, nivel + 1);
    for (int i = 0; i < nivel; i++) printf("   ");
    printf("%d\n", *(int*)avl->dato);
    imprimir_arbol(avl->izq, nivel + 1);
}

// Prueba del AVL
int main() {
    AVL arbol = avl_crear(comparar_enteros, visitar_entero, copiar_entero, destruir_entero);

    int valores[] = {10, 20, 30, 40, 50, 25};
    for (int i = 0; i < 6; i++) {
        arbol = avl_insertar(arbol, &valores[i], comparar_enteros, copiar_entero, destruir_entero, visitar_entero);
    }


    printf("\nRecorrido PRE Order: ");
    avl_recorrer(arbol, AVL_RECORRIDO_PRE);
    printf("\n");
    getchar();

    printf("\nEliminando el nodo con valor 20...\n");
    arbol = avl_eliminar(arbol, &valores[1]);
    getchar();

    printf("Árbol AVL después de eliminar (PRE Order):\n");
    avl_recorrer(arbol, AVL_RECORRIDO_PRE);

    printf("\nRecorrido PRE Order después de eliminar: ");
    avl_recorrer(arbol, AVL_RECORRIDO_PRE);

    printf("\n");

    // Destruir el árbol
    while (arbol != NULL) {
        arbol = avl_eliminar(arbol, arbol->dato);
    }

    return 0;
}
