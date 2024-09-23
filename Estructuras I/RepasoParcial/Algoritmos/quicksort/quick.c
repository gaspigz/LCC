#include <stdlib.h>
#include "quick.h"

void quick_sort(int* array, int largo){
    quick_sort_aux(array, 0, largo-1);
}

void quick_sort_aux(int* array, int izquierda, int derecha){
    if(izquierda >= derecha) return;

    int pivot = array[izquierda];
    int i = izquierda +1;
    int j = derecha;

    while(i<=j){
        while(i<=j && array[i]<=pivot){
            i++;
        }
        while(i<=j && array[j]>=pivot){
            j--;
        }
        if (i <= j) {
            int aux = array[i];
            array[i] = array[j];
            array[j] = aux;
        }
    }

    array[izquierda] = array[j];
    array[j] = pivot;

    quick_sort_aux(array, izquierda, j-1);
    quick_sort_aux(array, j+1, derecha);



}