#include "quick.h"
#include <stdlib.h>

void quick_sort(int* array, int largo){
    quick_sort_aux(array, 0, largo-1);
}

void quick_sort_aux(int* array, int izq, int der){
    if(izq >= der) return;
    int pivot = array[izq];
    int i = izq + 1;
    int j = der;
    while(i <= j){
        while(i<=j && array[i] <= pivot) i++;
        while(i<=j && array[j] >= pivot) j--;
        if(i<=j){
            int aux = array[i];
            array[i] = array[j];
            array[j] = aux;
        }
    }
    array[izq] = array[j];
    array[j] = pivot;
    quick_sort_aux(array, izq, j-1);
    quick_sort_aux(array, j+1, der);
}
