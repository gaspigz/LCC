#include <stdlib.h>
#include <stdio.h>
#include "matriz.h"
#define MULTIPLICADOR 10

typedef struct _Matriz{
    float* datos;
    int filas;
    int columnas;
}_Matriz;

Matriz matriz_crear(){
    Matriz matriz = malloc(sizeof(_Matriz));
    matriz->columnas = MULTIPLICADOR;
    matriz->filas = MULTIPLICADOR;
    matriz->datos = malloc(sizeof(float)*MULTIPLICADOR*MULTIPLICADOR);
    return matriz;
}
void matriz_destruir(Matriz matriz){
    free(matriz->datos);
    free(matriz);

}

void matriz_mostrar(Matriz matriz){
    for(int i = 0; i < matriz->filas; i++){
        for(int j = 0; j < matriz->columnas; j++){
            printf("%.2f ", matriz->datos[i*matriz->columnas + j]);
        }
        printf("\n");
    }
}
void matriz_escribir_pos(Matriz matriz, int fil, int col, float dato){
    if(fil >= matriz->filas || col >= matriz->columnas){
        return;       
    }
    matriz->datos[fil*matriz->columnas+col] = dato;
}

void matriz_mostrar_pos(Matriz matriz, int fil, int col){
    if(fil >= matriz->filas || col >= matriz->columnas){
        return;       
    }
    printf("\n%.2f ", matriz->datos[fil*matriz->columnas+col]);
}


int matriz_numero_filas(Matriz matriz);

int matriz_numero_columnas(Matriz matriz);
/*

void matriz_intercambia_filas(Matriz matriz, int fila1, int fila2){
    if(fila1 >= matriz->filas || fila2 >= matriz->filas) return;
    float* aux = matriz->datos[fila1];
    matriz->datos[fila1] = matriz->datos[fila2];
    matriz->datos[fila2] = aux; 
}

void matriz_inserta_fila(Matriz matriz, int pos){
    if(pos < 0) return;
    matriz->filas = matriz->filas + 1;
    if(pos > matriz->filas) return;
    
    matriz->datos = realloc(matriz->datos, sizeof(float*) * matriz->filas);

    matriz->datos[matriz->filas-1] = malloc(sizeof(float) * matriz->columnas);

    for(int i = matriz->filas-1; i != pos; i--){
        matriz_intercambia_filas(matriz, i, i-1);
    }


}

*/