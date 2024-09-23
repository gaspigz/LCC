#include <stdlib.h>
#include <stdio.h>

/*
1. La mediana de un arreglo ordenado de n n´umeros se define como el elemento del medio cuando n es
impar y como el promedio de los dos elementos del medio cuando n es par. Por ejemplo,
mediana([-1.0, 2.2, 2.9, 3.1, 3.5]) = 2.9
mediana([-1.0, 2.2, 2.9, 3.1]) = 2.55
Escriba una funci´on que reciba un arreglo, no necesariamente ordenado, de n´umeros y calcule su mediana:
float mediana(float *arreglo, int longitud);
Puede utilizar la siguiente rutina para ordenar un arreglo de menor a mayor

void bubble_sort(float arreglo[], int longitud) {
    for (int iter = 0 ; iter < longitud - 1 ; iter++) {
        for (int i = 0 ; i < longitud - iter - 1; i++) {
            if (arreglo[i] > arreglo[i + 1]) {
                float aux = arreglo[i];
                arreglo[i] = arreglo[i + 1];
                arreglo[i + 1] = aux;
            }
        }
    }
}

Nota: La funci´on mediana no debe modificar el arreglo original.
*/

void bubble_sort(float arreglo[], int longitud) {
    for (int iter = 0 ; iter < longitud - 1 ; iter++) {
        for (int i = 0 ; i < longitud - iter - 1; i++) {
            if (arreglo[i] > arreglo[i + 1]) {
                float aux = arreglo[i];
                arreglo[i] = arreglo[i + 1];
                arreglo[i + 1] = aux;
            }
        }
    }
}

float mediana(float *arr, int longitud){
    float *orderer_arr = arr;
    bubble_sort(orderer_arr, longitud);
    if (longitud % 2 != 0){
        return orderer_arr[(longitud-1)/2];
    }else{
        return (orderer_arr[longitud/2] + orderer_arr[(longitud/2)+1]) / 2;
    }

}

int main(){

    float *arr;

    arr = malloc(sizeof(float)*8);
    arr[0] = 4.8;
    arr[1] = 9.2;
    arr[2] = 1.7;
    arr[3] = 3.6;
    arr[4] = 2.5;
    arr[5] = 7.3;
    arr[6] = 6.1;
    arr[7] = 5.4;
    
    float *arr2;
    arr2 = malloc(sizeof(float)*5);
    arr2[0] = -1.0;
    arr2[1] = 2.2;
    arr2[2] = 2.9;
    arr2[3] = 3.1;
    arr2[4] = 3.5;
    //mediana(arr, 8);
    printf("MEDIANA ARR1: %.2f\n", mediana(arr, 8));
    printf("MEDIANA ARR2: %.2f", mediana(arr2, 5));


    return 0;
}
