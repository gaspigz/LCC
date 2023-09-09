#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

typedef struct{
    char nombre[100];
    char apellido[100];
    int edad;
    char localidad[100];
}Persona;

void Archivo_escribir(Persona *lista_personas, int cantidad){
    FILE *archivo_salida;
    if(cantidad == 0){
        printf("Debe ingresar personas primero. ");
    }else{
        archivo_salida = fopen("salida.txt", "w+");
        for(int i=0; i<cantidad;i++){
            fprintf(archivo_salida, "%s,%s,%d,%s\n", lista_personas[i].nombre, lista_personas[i].apellido, lista_personas[i].edad, lista_personas[i].localidad);
        }
        fclose(archivo_salida);
        printf("Archivo escrito!! \n");
    }
}

int Personas_mostrar(Persona *lista_personas, int cantidad){
    if(cantidad == 0){
        printf("No hay personas. ");
    }else{
        for(int i = 0; i<cantidad; i++){
            printf("Persona %d:\n",i+1);
            printf("Nombre: %s, Apellido: %s, Edad: %d, Localidad: %s\n", lista_personas[i].nombre, lista_personas[i].apellido, lista_personas[i].edad, lista_personas[i].localidad); 
        }
        printf("Total personas: %d\n", cantidad);
    }
    return 0;
}

int Persona_new(Persona *lista_personas, int cantidad){
    if(cantidad == 1000){
        printf("\nNo hay mas espacio en la lista\n");
        return 0;
    }
    
    printf("\n--------------------------\n");
    printf("INGRESO NUEVA PERSONA:\n");
    printf("Ingrese nombre: ");
    scanf("%[^\n]",lista_personas[cantidad].nombre);
    getchar();
    printf("Ingrese apellido: ");
    scanf("%[^\n]",lista_personas[cantidad].apellido);
    getchar();
    printf("Ingrese edad: ");
    scanf("%d",&lista_personas[cantidad].edad);
    getchar();
    printf("Ingrese localidad: ");
    scanf("%[^\n]",lista_personas[cantidad].localidad);
    getchar();
    return 1;
}

void menu(Persona *lista_personas){
    int n=0;
    int seguir_jugando = 1, cantidad_de_personas;
    cantidad_de_personas = 0;
    while(seguir_jugando == 1){
        switch(n){
            case 0:
                printf("Bienvenido al menu del amor <3\nIngrese una opcion:\n");
                printf("1 para ingresar personas.\n");
                printf("2 para armar parejas.\n");
                printf("3 para mostrar parejas.\n");
                printf("4 para mostrar personas que quedaron solas.\n");
                printf("5 para mostrar y escribir el archivo con personas.\n");
                printf("Cualquier numero distinto para salir.\n");
                printf("--------------------------------------------------------------------------------------\n");
                printf("En caso de querer ver este menu ingresar 0\nPara ingresar a las opciones 3 y 4 se debe ingresar primero a la 1 de lo contrario verá un mensaje de error.\n");
                scanf("%d",&n);
                getchar();
                break;
            case 1:
                if(Persona_new(lista_personas, cantidad_de_personas) == 0){
                    printf("\nNo hay mas lugar en la lista. ");
                    n = 0;
                    break;
                }else{
                    printf("Persona agregada! ");
                    cantidad_de_personas++;
                    n=0;
                    break;
                }
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                n = Personas_mostrar(lista_personas, cantidad_de_personas);
                Archivo_escribir(lista_personas, cantidad_de_personas);
                printf("\nEnter para continuar...");
                getchar();
                break;

            default:
                seguir_jugando=0;
                break;
        }
    }
    
}

int main(){
    Persona *lista_personas ;
    lista_personas = (Persona *) calloc(1000, sizeof(Persona));

    menu(lista_personas);

    free(lista_personas);

    return 0;
}