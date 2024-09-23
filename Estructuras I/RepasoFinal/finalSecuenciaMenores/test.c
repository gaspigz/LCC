#include <stdlib.h>
#include "secuencia.h"
#include <stdio.h>

int main(){
    Nodo secuencia = secuencia_crear(10);
    secuencia = secuencia_insertar(secuencia, 15, 1);
    secuencia = secuencia_insertar(secuencia, 12, 2);
    secuencia = secuencia_insertar(secuencia, 18, 3);
    secuencia = secuencia_insertar(secuencia, 6, 4);
    secuencia = secuencia_insertar(secuencia, 5, 5);
    secuencia = secuencia_insertar(secuencia, 7, 6);
    secuencia = secuencia_insertar(secuencia, 25, 7);
    secuencia = secuencia_borrar(secuencia, 3);
    secuencia_mostrar(secuencia);
    return 0;
}