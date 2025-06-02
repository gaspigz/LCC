/*
Ej. 2 (Filósofos Comensales, Dijkstra)

Cinco filósofos se sientan alrededor de una mesa redonda y viven la buena vida 
alternando entre comer y pensar. Cada filósofo tiene su plato de pasta, 
un tipo particular de fideos que requieren dos tenedores para ser comidos. 

Entre cada par de filósofos consecutivos hay un tenedor, y cada filósofo 
solo puede alcanzar los que están a su izquierda y derecha. 

Para comer, los filósofos acordaron primero tomar el tenedor a su derecha 
y luego el de su izquierda. Si cualquier filósofo toma un tenedor y el otro 
está ocupado, se quedará esperando, con un tenedor en la mano, hasta que pueda 
tomar el otro tenedor, para luego empezar a comer. 

Una vez que un filósofo termina de comer, deja los tenedores sobre la mesa 
y piensa hasta que le vuelve a dar hambre, cuando repite el procedimiento.

Una implementación de esta situación con pthreads es como sigue:
*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

#define N_FILOSOFOS 5
#define ESPERA 1000
int j = 0;

sem_t hay_lugar_para_comer;

pthread_mutex_t tenedor[N_FILOSOFOS];

pthread_mutex_t* izq(int i) { return &tenedor[i]; }
pthread_mutex_t* der(int i) { return &tenedor[(i+1) % N_FILOSOFOS]; }

void pensar(int i)
{
    printf("Filósofo %d pensando...\n", i);
    usleep(random() % ESPERA);
}

void comer(int i)
{
    printf("Filósofo %d comiendo...\n", i);
    usleep(random() % ESPERA);
}

void tomar_tenedores(int i)
{
    printf("TOMA TENEDOR %d\n",i);
    pthread_mutex_lock(der(i));
    pthread_mutex_lock(izq(i));
}

void tomar_tenedores_d(int i)
{
    printf("TOMA TENEDOR %d\n",i);
    pthread_mutex_lock(der(i));
    while(1){
        if(pthread_mutex_trylock(izq(i)) == 0){
            break;
        }
        else{
            pthread_mutex_unlock(der(i));
            //j++;
            //printf("Tuve que dejar %i\n",j);
            usleep(random() % 1000);
        }

    }
}

void tomar_tenedores_un_zurdo(int i)
{   
    printf("TOMA TENEDOR %d\n",i);
    if(i == 0){
        pthread_mutex_lock(izq(i));
        pthread_mutex_lock(der(i));
    }else{
        pthread_mutex_lock(der(i));
        pthread_mutex_lock(izq(i));
    }
}

void dejar_tenedores(int i)
{
    pthread_mutex_unlock(der(i));
    pthread_mutex_unlock(izq(i));
}

void* filosofo_c(void* arg)
{
    int i = arg - (void*)0;
    while (1) {
        sem_wait(&hay_lugar_para_comer);
        tomar_tenedores(i);
        comer(i);
        dejar_tenedores(i);
        sem_post(&hay_lugar_para_comer);
        pensar(i);
    }
}

void* filosofo(void* arg)
{
    int i = arg - (void*)0;
    while (1) {
        tomar_tenedores_d(i);
        comer(i);
        dejar_tenedores(i);
        pensar(i);
    }
}


int main()
{
    pthread_t filo[N_FILOSOFOS];
    sem_init(&hay_lugar_para_comer, 0, N_FILOSOFOS - 1);
    int i;

    for (i = 0; i < N_FILOSOFOS; i++)
        pthread_mutex_init(&tenedor[i], NULL);

    for (i = 0; i < N_FILOSOFOS; i++)
        pthread_create(&filo[i], NULL, filosofo, i + (void*)0);

    pthread_join(filo[0], NULL);
    return 0;
}

/*
a) Este programa puede terminar en deadlock. Explique cómo.

Si tengo 5 filosofos. El primero toma el tenedor de su derecha, luego el segundo el de su derecha,
luego el tercero el de su derecha, luego el cuarto el de su derecha, luego el quinto el de su derecha, ahi 
todos los tenedores estarían tomados, y todos los filosofos pensando indefinidamente, pues ninguno
podría empezar a comer.

b) Cansados de no comer, los filósofos deciden pensar una solución a su problema. 
Uno razona que esto no sucedería si alguno de ellos fuese zurdo y tomara primero 
el tenedor de su izquierda. Implemente esta solución y explique por qué funciona.

Con un filosofo zurdo, este tiene dos opciones:
    - Si su tenedor izquierdo esta libre, lo toma. Allí puede haber un cambio de contexto y el siguiente
    filosofo tomaria el de SU derecha (no el de la derecha del zurdo). Si no hay cambio de contexto, el
    zurdo comerá (sin haber deadlock).
    - Si su tenedor izquierdo está tomado, espera a que este se libere SIN BLOQUEAR el de su derecha. En
    cuanto se libere, estoy en el caso de arriba.

c) Otro filósofo piensa que tampoco tendrían el problema si todos fuesen diestros 
pero solo intentasen comer a lo sumo N−1 de ellos a la vez.

Implemente esta solución y explique por qué funciona.

Si hay N-1 filosofos intentando comer, en el peor caso de que ninguno pueda comer se habrían tomado N-1 
tenedores. De esta forma cuando llegue el filosofo N este NO intentará comer, pasando de nuevo a otro filosofo,
que podrá tomar su tenedor izquierdo libre. Garantizando que al menos uno coma, y avance.

d) Un filósofo, ya sufriendo secuelas del hambre, sugiere que los comensales 
suelten su tenedor derecho si encuentran que el izquierdo ya está tomado, 
posiblemente esperando un tiempo antes de reintentar tomarlo. 

Implemente esta variante e investiguela. ¿Funciona? ¿Es eficiente? Cuantifique su respuesta.

Puede haber un livelock si todos toman al mismo tiempo el derecho, luego todos lo soltará, luego todos lo tomarán, etc.

*/
