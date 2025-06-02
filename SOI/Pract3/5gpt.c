#include <stdlib.h>
#include <stdio.h>
#include <semaphore.h>
#include <pthread.h>
#include <unistd.h>

#define N 5   // Número de sillas en la sala de espera
#define CLIENTES 10

sem_t sillasDisponibles;
sem_t clienteListo;
sem_t barberoListo;
sem_t corteTerminado;
sem_t pagoHecho;

void me_cortan(int id) {
    printf("Cliente %d: Me están cortando el pelo.\n", id);
    sleep(1);
}

void cortando() {
    printf("Barbero: Estoy cortando el pelo.\n");
    sleep(1);
}

void pagando(int id) {
    printf("Cliente %d: Me cortaron. Estoy pagando.\n", id);
    sleep(1);
}

void me_pagan() {
    printf("Barbero: Me pagaron.\n");
    sleep(1);
}

void* cliente(void* arg) {
    int id = *(int*)arg;
    free(arg);

    if (sem_trywait(&sillasDisponibles) != 0) {
        printf("Cliente %d: No hay sillas, me voy.\n", id);
        return NULL;
    }

    printf("Cliente %d: Me siento a esperar.\n", id);
    sem_post(&clienteListo);       // Notifica al barbero que hay un cliente
    sem_wait(&barberoListo);       // Espera a que el barbero lo llame

    me_cortan(id);
    pagando(id);
    sem_post(&corteTerminado);     // Notifica que terminó el corte

    sem_wait(&pagoHecho);          // Espera a que le cobren

    sem_post(&sillasDisponibles);  // Libera la silla
    return NULL;
}

void* barbero(void* arg) {
    while (1) {
        sem_wait(&clienteListo);    // Espera a un cliente
        sem_post(&barberoListo);    // Llama a un cliente

        cortando();

        sem_wait(&corteTerminado);  // Espera a que cliente confirme fin
        me_pagan();
        sem_post(&pagoHecho);       // Cobro realizado
    }
}

int main() {
    pthread_t tbarbero;
    pthread_t tclientes[CLIENTES];

    sem_init(&sillasDisponibles, 0, N);
    sem_init(&clienteListo, 0, 0);
    sem_init(&barberoListo, 0, 0);
    sem_init(&corteTerminado, 0, 0);
    sem_init(&pagoHecho, 0, 0);

    pthread_create(&tbarbero, NULL, barbero, NULL);

    for (int i = 0; i < CLIENTES; i++) {
        int* id = malloc(sizeof(int));
        *id = i + 1;
        pthread_create(&tclientes[i], NULL, cliente, id);
        sleep(1); // Clientes llegan con un poco de tiempo entre ellos
    }

    for (int i = 0; i < CLIENTES; i++) {
        pthread_join(tclientes[i], NULL);
    }

    // Nota: el barbero nunca termina en este ejemplo.

    return 0;
}
