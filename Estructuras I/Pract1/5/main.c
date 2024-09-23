#include <stdio.h>
#include <stdlib.h>
#include "garray.h"
#include "matriz.h"

void print_entero(int *a){
    printf("%d ",*a);
}

int *copy_entero(int *a){
    int* copy = malloc(sizeof(int*));
    *copy = *a;
    return copy;
}

int main(){
    GArray arr = garray_crear();
    for(int i = 0; i<10; i++){
        int i = rand() % 100;
        garray_insertar(arr, &i, (FuncionCopiadora) copy_entero);
    }
    garray_recorrer(arr, (FuncionVisitante) print_entero);
    printf("\n\n");

    Matriz mat = matriz_crear();
    matriz_escribir_pos(mat, 3, 5, 3.2);
    matriz_escribir_pos(mat, 6, 1, 8.5);
    matriz_escribir_pos(mat, 3, 50, 9.2);
    matriz_escribir_pos(mat, 9, 2, 7.9);
    matriz_escribir_pos(mat, 8, 7, 8.4);
    matriz_mostrar(mat);
    //matriz_intercambia_filas(mat, 3, 6);
    printf("\n\n");
    matriz_mostrar(mat);
    //matriz_inserta_fila(mat, 8);
    printf("\n\n");
    matriz_mostrar(mat);


    return 0;

}