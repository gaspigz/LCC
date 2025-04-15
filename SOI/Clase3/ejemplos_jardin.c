#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define NUM_VISITANTES 40000

int visitantes = 0;
// int flag = 0;
int turno = 0; // Si vale 0 no es turno de nadie, si vale 1 es el turno del molinete 1 y si vale 2 del molinete 2.

int flag[2] = {0, 0}; // 0 -> No tengo intencion de entrar a RC | 1 -> Tengo intenion de entrar a RC.

// RC = Region Critica

// De esta forma estoy secuencializando, para que pase una persona por un molinete tengo que 
// esperar que pase por el otro. No pueden pasar los dos en simultaneo lo que no tiene sentido.
void *molinete1_ambosGentiles(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){

        // lock

        // Si quiero que le toque al otro:

        turno = 2; // Le doy el turno al molinete dos
        // Me quedo bloqueado mientras sea el turno del otro
        while(turno == 2){;}

        // region critica
        visitantes++; // Esta funcion no es atomica
        printf("[MOL1] Visitantes: %d\n", visitantes);


        // unlock
        turno = 2;

    }
    return NULL;
}

void *molinete2_ambosGentiles(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){

        // lock
        
        // Si quiero que le toque al otro:
        
        turno = 1; // Le doy el turno al molinete dos
        // Me quedo bloqueado mientras sea el turno del otro
        while(turno == 1){;}

        // region critica

        visitantes++; // Esta funcion no es atomica
        printf("[MOL2] Visitantes: %d\n", visitantes);


        // unlock
        turno = 1;

    }
    return NULL;
}

void *molinete(void* v){
    for(int i = 0; i < NUM_VISITANTES; i++){
        visitantes++; // Esta funcion no es atomica
    }
    return NULL;
}

// RTA DOBLE FLAG) Se bloquean entre si los procesos, la unica forma de ejecucion es que se ejecute primero uno entero y luego el otro.

void *molinete1_dobleflag(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){

        // lock
        flag[0] = 1; // El molinete 1 tiene intencion de entrar a la RC.
        // Me quedo bloqueado mientras el otro tambien tenga intenciones de entrar
        while(flag[1] == 1){;}

        // region critica
        visitantes++; // Esta funcion no es atomica
        printf("[MOL1] Visitantes: %d\n", visitantes);

        // unlock
        flag[0] = 0;

    }
    return NULL;
}

void *molinete2_dobleflag(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){

        
        // lock
        flag[1] = 1; // El molinete 1 tiene intencion de entrar a la RC.
        // Me quedo bloqueado mientras el otro tambien tenga intenciones de entrar
        while(flag[0] == 1){;}

        // region critica
        visitantes++; // Esta funcion no es atomica
        printf("[MOL2] Visitantes: %d\n", visitantes);

        // unlock
        flag[1] = 0;

    }
    return NULL;
}

// RTA PETERSON) Mezcla de turnos y banderas.
// Siempre que un proceso quiera tomar un lock, eventualmente lo va a hacer. No me puedo quedar bloqueado.
// Se llama ausencia de inanicion. Ausencia de inanicion -> Ausencia de deadlock pero no al reves.
// Deadlock es cuando todos los procesos se bloquean.
// Un proceso va a entrar a la region critica con peterson siempre.
// Supongamos que ambos entraron a RC. Veamos que pasa si P1 entra ultimo a RC cuando P2 ya estaba.
// La condicion del while de P1 falla, osea si) flag[1] = 0 es claro que P2 no puede estar en RC, pues flag[1] es true antes de entrar a la RC, pues P2 estaba en region critica pero todavia no habia hecho el unlock.
// y si) turn = 1, dado que P1 hace turn = 2 antes del while, necesariamente paso que P2 ejecuto su asignacion
// de turn entre la sentencia de turn = 2 de P1 y el while. Pero para que eso suceda, P2 no debe estar en la RC, pues turn = 1 esta antes.
// Llegando a una contradiccion.

// SOLO SIRVE PARA DOS PROCESOS.

// El algoritmo falla si saco los print porque tengo varios procesadores con multiples cache.
// Puede que ocurra una ejecucion fuera de orden (distinto a como yo lo escribi).

// volatile int v -> La variable v puede cambiar por otro proceso en tiempos de ejecucion.


void *molinete1_peterson(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){

        // lock
        flag[0] = 1; // El molinete 1 tiene intencion de entrar a la RC.
        turno = 2; // Le cedo el turno
        // Me quedo bloqueado mientras el otro tambien tenga intenciones de entrar
        while(flag[1] == 1 && turno == 2){;} // Veo quien tiene la intencion de entrar y QUIEN TIENE EL TURNO de entrar

        // region critica
        visitantes++; // Esta funcion no es atomica
        printf("[MOL1] Visitantes: %d\n", visitantes);

        // unlock
        flag[0] = 0;

    }
    return NULL;
}

void *molinete2_peterson(void* v){
    for(int i = 0; i < NUM_VISITANTES / 2; i++){

        
        // lock
        flag[1] = 1; // El molinete 1 tiene intencion de entrar a la RC.
        turno = 1; // Le cedo el turno
        // Me quedo bloqueado mientras el otro tambien tenga intenciones de entrar
        while(flag[0] == 1 && turno == 1){;}

        // region critica
        visitantes++; // Esta funcion no es atomica
        printf("[MOL2] Visitantes: %d\n", visitantes);

        // unlock
        flag[1] = 0;

    }
    return NULL;
}


int main(){

    pthread_t m1, m2;
    printf("[MAIN] Creating threads...\n");

    pthread_create(&m1, NULL, molinete1_peterson, NULL);
    pthread_create(&m2, NULL, molinete2_peterson, NULL);

    printf("[MAIN] Threads joining...\n");

    pthread_join(m1, NULL);
    pthread_join(m2, NULL);

    printf("[MAIN] Total visitantes: %d\n", visitantes);

    return 0;
}