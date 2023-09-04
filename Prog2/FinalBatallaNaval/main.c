#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

//Pos fila, Pos col, Dir, largo
typedef struct {
  int fila;
  int columna;
  int direccion;
  int largo;
}Barco;

int leer_archivo(Barco lista_barcos[], int *filas, int *columnas, int *total_barcos){

  FILE *archivo_entrada;
  archivo_entrada = fopen("prueba.txt", "r+");

  int i=0;
  fscanf(archivo_entrada, "%d", filas);
  printf("FILAS: %d", *filas);
  fscanf(archivo_entrada, "%d", columnas);
  printf("COLUMNAS: %d", *columnas);

  while( fgetc(archivo_entrada) != EOF){
    fscanf(archivo_entrada, "%d", &lista_barcos[i].fila);
    fscanf(archivo_entrada, "%d", &lista_barcos[i].columna);
    fscanf(archivo_entrada, "%d", &lista_barcos[i].direccion);
    fscanf(archivo_entrada, "%d", &lista_barcos[i].largo);
    i++;
  }

  for(int j=0; j<i; j++){
    printf("Fila: %d, Columna: %d, Direccion: %d, Largo: %d\n", lista_barcos[j].fila, lista_barcos[j].columna, lista_barcos[j].direccion, lista_barcos[j].largo);
  }

  *total_barcos = i;

  fclose(archivo_entrada);
  
  return 1;
}

int randomizar_lista(Barco lista_barcos[], int total_barcos, int filas, int columnas){
    int i=0, r1=0, r2=0;
    time_t t;
    srand((unsigned) time(&t));
    printf("%d\n",total_barcos);

    while(i<600){
        
        r1=rand()%(total_barcos);
        r2=rand()%(total_barcos);
        Barco temp = lista_barcos[r1];
        lista_barcos[r1] = lista_barcos[r2];
        lista_barcos[r2] = temp;
        i++;
    }

    for(int j=0; j<total_barcos; j++){
        printf("Fila: %d, Columna: %d, Direccion: %d, Largo: %d\n", lista_barcos[j].fila, lista_barcos[j].columna, lista_barcos[j].direccion, lista_barcos[j].largo);
    }

    int tope = 0;

    if(filas*(1/3)<= columnas){
        tope = rand() % ( columnas - (filas * (1/3)) + 1) + (filas * (1/3));
    }else{
        tope = rand() % ((filas * (1/3)) - columnas + 1) + columnas;
    }


    return tope;
}

void llena_lista_final(Barco lista_barcos[], int tope, int filas, int columnas, Barco lista_final[]){
  int j = 0, bandera = 1, bandera_interna = 1;
  tope= 7;
  int tablero[100][100];
  for(int i=0; i<filas;i++){
    for(int k=0; k<columnas; k++){
      tablero[i][k] = 0;
    }
  }
     for(int i = 0; i<tope; i++){
      if(lista_barcos[i].direccion < 0 || lista_barcos[i].direccion > 1){
        bandera = 0;
        printf("ERRONEO 1: Fila: %d, Columna: %d, Direccion: %d, Largo: %d. BANDERA: %d\n", lista_barcos[i].fila, lista_barcos[i].columna, lista_barcos[i].direccion, lista_barcos[i].largo, bandera);
      }
      if(bandera!=0 && (lista_barcos[i].fila < 0 || lista_barcos[i].fila > filas || lista_barcos[i].columna < 0 || lista_barcos[i].columna > columnas)){
        bandera = 0;
        printf("ERRONEO 2: Fila: %d, Columna: %d, Direccion: %d, Largo: %d. BANDERA: %d\n", lista_barcos[i].fila, lista_barcos[i].columna, lista_barcos[i].direccion, lista_barcos[i].largo, bandera);
      }
      if(bandera!=0 && (lista_barcos[i].direccion == 1 && lista_barcos[i].fila + lista_barcos[i].largo-1 > filas)){
        bandera = 0;
      }
      if(bandera!=0 && (lista_barcos[i].direccion == 0 && lista_barcos[i].columna + lista_barcos[i].largo-1 > columnas)){
        bandera = 0;
      }
      if(j==0 && bandera != 0){ //No hay barcos y el barco se podria agregar
        tablero[lista_barcos[i].fila][lista_barcos[i].columna] = 1;
        for(int k=0; k<lista_barcos[i].largo; k++){
          if(lista_barcos[i].direccion == 0){
            tablero[lista_barcos[i].fila][lista_barcos[i].columna + k] = 1;
          }
          if(lista_barcos[i].direccion == 1){
            tablero[lista_barcos[i].fila + k][lista_barcos[i].columna] = 1;
          }
        }
      }
      if(j!=0 && bandera != 0){
        for(int k=0; k<lista_barcos[i].largo; k++){
          if(lista_barcos[i].direccion == 0){
            if(tablero[lista_barcos[i].fila][lista_barcos[i].columna + k] == 0){
              tablero[lista_barcos[i].fila][lista_barcos[i].columna + k]++;
            }else{
              tablero[lista_barcos[i].fila][lista_barcos[i].columna + k]++;
              bandera_interna = 0;
            }
          }
          if(lista_barcos[i].direccion == 1){
            if(tablero[lista_barcos[i].fila +k][lista_barcos[i].columna] == 0){
              tablero[lista_barcos[i].fila + k][lista_barcos[i].columna]++;
            }else{
              tablero[lista_barcos[i].fila + k][lista_barcos[i].columna]++;
              bandera_interna = 0;
            }
          }
        }
        if(bandera_interna == 0){
          bandera = 0;
          for(int k=0; k<lista_barcos[i].largo; k++){
            if(lista_barcos[i].direccion == 0){
              if(tablero[lista_barcos[i].fila][lista_barcos[i].columna + k] > 1){
                tablero[lista_barcos[i].fila][lista_barcos[i].columna + k] = 1;
              }else{
                tablero[lista_barcos[i].fila][lista_barcos[i].columna + k] = 0;
              }
            }
            if(lista_barcos[i].direccion == 1){
              if(tablero[lista_barcos[i].fila + k][lista_barcos[i].columna] > 1){
                tablero[lista_barcos[i].fila + k][lista_barcos[i].columna] = 1;
              }else{
                tablero[lista_barcos[i].fila + k][lista_barcos[i].columna] = 0;
              }
            }
          }
        }
      }

      if(bandera != 0){
        lista_final[j] = lista_barcos[i];
        j++;
      }
      bandera_interna = 1;
      bandera = 1;
     }
     printf("\nTOTAL BARCOS FINALES:\n TOPE: %d \n",tope);
     getchar();
     for(int k=0; k<j; k++){
      printf("Fila: %d, Columna: %d, Direccion: %d, Largo: %d\n", lista_final[k].fila, lista_final[k].columna, lista_final[k].direccion, lista_final[k].largo);
     }
     getchar();
}

void escribir_archivo(Barco lista_final[], int tope){

}


int main(){
  
  int filas, columnas, total_barcos, tope;
  Barco lista_barcos[100];
  Barco lista_final[100];

  leer_archivo(lista_barcos, &filas, &columnas, &total_barcos);
  getchar();
  tope = randomizar_lista(lista_barcos, total_barcos, filas, columnas);
  getchar();
  llena_lista_final(lista_barcos, tope, filas, columnas, lista_final);
  escribir_archivo(lista_final, tope);

  
  return 0;
}