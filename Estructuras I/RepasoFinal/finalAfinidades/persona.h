#ifndef _PERSONA_H_
#define _PERSONA_H_

typedef struct _Persona{
    char* nombre_apellido;
};
typedef struct _Persona* Persona;

typedef struct _Par{
    Persona persona1;
    Persona persona2;
    int son_afines;
};

typedef struct _Par* Par;


Persona persona_crear(char* nombre, char* apellido);

Par par_crear(Persona persona1, Persona persona2, int son_afines){
    Par par = malloc(sizeof(struct _Par));
    par->persona1 = persona1;
    par->persona2 = persona2;
    par->son_afines = son_afines;
    return par;
}


#endif