#include <stdlib.h>
#include <stdio.h>
#include <semaphore.h>
#include <pthread.h>
#include <unistd.h>
#include <errno.h>

#define N 5
sem_t sillasDisponibles, sillasOcupadas;
int barberoOcupado = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t barberoOcupadoCond = PTHREAD_COND_INITIALIZER;
int i = 1;

/*
Una barbería tiene una sala de espera con N sillas y un barbero. Si no hay clientes para atender, 
el barbero se pone a dormir. Si un cliente llega y todas las sillas están ocupadas, se va. 
Si el barbero está ocupado pero hay sillas disponibles, se sienta en una y espera a ser atendido. 
Si el barbero está dormido, despierta al barbero. El cliente y el barbero deben ejecutar concurrentemente las 
funciones me_cortan() y cortando(), y al terminar los dos deben ejecutar concurrentemente pagando() y me_pagan().

Escriba un programa que coordine el comportamiento del barbero y los clientes, y explíquelo.
*/

void me_cortan(int i){
    printf("Me estan cortando, cliente %d\n", i);
    sleep(1);
}

void cortando(){
    printf("Estoy cortando\n");
    sleep(1);
}

void pagando(){
    printf("Estoy pagando\n");
    sleep(1);
}

void me_pagan(){
    printf("Me estan pagando\n");
    sleep(1);
}


void* cliente(void* args){
    
    while(1){
        if(sem_trywait(&sillasDisponibles) != 0){
            printf("Todas las sillas tomadas me voy\n");
        }else{
            sem_post(&sillasOcupadas);
            pthread_mutex_lock(&mutex);
            while(barberoOcupado == 1){
                printf("El barbero esta ocupado espero \n");
                pthread_cond_wait(&barberoOcupadoCond, &mutex);
            }
            me_cortan(i);
            pagando();
            pthread_mutex_unlock(&mutex);

            sem_post(&sillasDisponibles);
            i++;
        }

    }
}

void* barbero(void* args){
    while(1){
        sem_wait(&sillasOcupadas);
        barberoOcupado = 1;
        cortando();
        me_pagan();
        barberoOcupado = 0;
        pthread_cond_signal(&barberoOcupadoCond);
    }
}


int main(){
    sem_init(&sillasDisponibles, 0, N);
    sem_init(&sillasOcupadas, 0, 0);
    pthread_t tb, tc1, tc2, tc3, tc4;
    pthread_create(&tb, NULL, barbero, NULL);
    pthread_create(&tc1, NULL, cliente, NULL);
    pthread_create(&tc2, NULL, cliente, NULL);
    pthread_create(&tc3, NULL, cliente, NULL);
    pthread_create(&tc4, NULL, cliente, NULL);
    pthread_join(tb, NULL);
    pthread_join(tc1, NULL);
    pthread_join(tc2, NULL);
    pthread_join(tc3, NULL);
    pthread_join(tc4, NULL);
    return 0;
}