#include <stdio.h>
#include <omp.h>

#define N_VISITANTES = 10000

void molinete(void){
    for(int i = 0; i < N_VISITANTES ;i++){
        visitantes++;
    }
}

int visitantes = 0;

int main(){

    #pragma omp parallel
    {
        int id = omp_get_thread_num();
        int cantidad = omp_get_num_threads();

        printf("Estoy en el thread %d, hay un total de: %d\n",id,cantidad);        
    }

    #pragma omp parallel sections
    {
        #pragma omp section
        printf("Hello from thread %d (section 1)\n", omp_get_thread_num());
    
        #pragma omp section
        printf("Hello from thread %d (section 2)\n", omp_get_thread_num());

    }

    int a[100000];
    #pragma omp parallel
    {
        #pragma omp for
        for(int i = 0; i < 100000; i++){
            int id = omp_get_thread_num();
            a[i] = i;
            printf("EL thread %d metio en %i el valor %i",id, i, a[i]);
        }
    }

    int i = 10; // Var. global para la seccion a paralelizar
    #pragma omp parallel private(i) // La hago privada. Queda sin asignar.
    {
        printf("Thread %d, i: %d", omp_get_thread_num(), i); // i vale cualquier cosa.
        i = 1000;
    }
        printf("Global i: %d", i); // i vale 10. Bien
    
    int sum = 0, val = 1;
    #pragma omp parallel for reduction(+: sum) // Operador y variable con posible race condition. Asegura que la operación + sea atómica respecto a sum.
    {
        for(int i = 0; i<100; i++){
            sum = sum + val;
        }
    }

    int num_threads = 2;
    #pragma omp parallel num_threads(num_threads){
        molinete();
    }
    return 0;
}