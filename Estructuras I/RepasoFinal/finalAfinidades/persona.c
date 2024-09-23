#include "persona.h"
#include <stdlib.h>
#include <string.h>

Persona persona_crear(char* nombre, char* apellido){
    Persona persona = malloc(sizeof(struct _Persona));
    persona->nombre_apellido = malloc(sizeof(char) * 100);
    persona->nombre_apellido = strcat(nombre, " ");
    persona->nombre_apellido = strcat(persona->nombre_apellido, apellido);
    return persona;

}