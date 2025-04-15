// a) Sigue estando el problema de la RC pues el hecho de que haya 1 o n procesadores no afect. 
// Se estan creando dos subprocesos que quieren acceder a la misma RC. El SO va a ir intercambiando entre
// los mismos según indique el scheduler sin importar el numero de procesadores. Lo que conllevaría 
// a la generacion del error visto.

// b) El procesador te garantiza la consistencia de datos en si mismo. Al no haber otros procesadores
// No es necesario coordinar caches. Te garantiza la consistencia de un mismo proceso siempre que sea ejecutado en un solo procesador.
// las optimizaciones de reordenamiento es el procesador, pero garantiza la consistencia de datos.

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

static inline void incl(int *p) {
    asm("incl %0" : "+m"(*p) : : "memory");
}

// c y d) En un procesador no habría problema pues es una instruccion de assembly ejecutada secuencialmente (atómica), como a todas las instrucciones, pues solo hay un procesador, solo puede hacer una a la vez.
// Si tengo varios procesadores, a cada una de las micro-operaciones (store, search, etc) se pueden ejecutar en paralelo.
// Con mfence no habria problema pues estamos compartiendo la cache entre los procesadores. Fuerza a actualizar la cache cada vez que corro mfence.
// Si no lo tengo, los printf me salvarian del problema porque generan un lock tratando de acceder al stdout.
// Si no tuviera printf ni mfence tendría el mismo problema que tengo en peterson con visitantes++.
// e) El lock obliga que el procesador no pueda cambiar de contexto durante la ejecucion del assembly.
// Lo hace atomico, no podes depender del cache. No necesataria mfence.

#define NUM_VISITANTES 400000
int turno = 0; // Turno de thread a entrar
int flags[2] = {0, 0}; // Intenciones de entrar a RC

int visitantes = 0;
pthread_mutex_t mutex_visitantes = PTHREAD_MUTEX_INITIALIZER;

void* molinete1(void *var){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){
        // LOCK
        flags[0] = 1; // Declaro que tengo intenciones de entrar
        turno = 2; // Cedo el turno
        asm("mfence"); // LEE LA MEMORIA SIN CACHE
        while(turno == 2 && flags[1] == 1){;} // Espero mientras no sea mi turno y el otro tenga intencion de entrar

        // RC
        incl(&visitantes);
        printf("[TH2] Visitantes: %d\n", visitantes);

        // UNLOCK
        flags[0] = 0;

    }

}

void* molinete2(void *var){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){
        // LOCK
        flags[1] = 1; // Declaro que tengo intenciones de entrar
        turno = 1; // Cedo el turno
        asm("mfence");
        while(turno == 1 && flags[0] == 1){;} // Espero mientras no sea mi turno y el otro tenga intencion de entrar

        // RC
        incl(&visitantes);
        printf("[TH1] Visitantes: %d\n", visitantes);

        // UNLOCK
        flags[1] = 0;
    }

}

int main(){

    printf("[MAIN] Creating threads...\n");

    pthread_t t1, t2;
    pthread_create(&t1, NULL, molinete1, NULL);
    pthread_create(&t2, NULL, molinete2, NULL);

    printf("[MAIN] Threads joining...\n");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    return 0;
}