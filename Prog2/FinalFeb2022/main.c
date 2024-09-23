#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

typedef struct{
    char nombre[100];
}Persona;

typedef struct{
    Persona persona1;
    Persona persona2;
}Afinidad;

int inventa_afinidad(int cantidad){
    int k;
    k = rand() % cantidad-1;
    k = k<1 ? 1 : k;
    return k;
}

void mostrar_lista(Persona *lista_personas, int cantidad){
    for(int i=0; i<cantidad; i++){
        printf("%s\n", lista_personas[i].nombre);
    }

}

int leer_archivo(Persona *lista_personas){

    FILE *archivo_entrada;
    int i=0;
    archivo_entrada = fopen("entrada.txt", "r");
    while(fscanf(archivo_entrada, " %[^\n]", lista_personas[i].nombre) == 1){
        i++;
    }
    getchar();

    return i;

}

void generador_afinidades(Persona *lista_personas, Afinidad *lista_afinidades, int cantidad){
    //cantidad_afinidades = rand() % cantidad-1;
    
}

int duplicador(int k){
    return k*2;
}

int main(){

    Persona *lista_personas;
    Afinidad *lista_afinidades;
    int cantidad, K;

    lista_afinidades = (Afinidad *) calloc(100, sizeof(Afinidad));
    lista_personas = (Persona *) calloc(100, sizeof(Persona));
    

    cantidad = leer_archivo(lista_personas);

    K = inventa_afinidad(cantidad);

    //generador_afinidades(lista_personas, lista_afinidades, cantidad);

    mostrar_lista(lista_personas, cantidad);

    assert(duplicador(2) == 5);

    free(lista_personas);
    free(lista_afinidades);
    return 0;
}