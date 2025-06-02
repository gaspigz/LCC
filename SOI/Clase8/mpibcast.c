#include <stdio.h>
#include <mpi.h>
void main(int argc, char **argv){
    int num_procs, my_id, value;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_id);
    if(my_id == 0){ // Rank 0 = Proceso master
        printf("Enter a number to broadcast:\n");
        scanf("%d",&value);
    }else{
        printf("Process %d: Before MPI_Bcast, value is %d\n",my_id, value);
    }
    MPI_Bcast(&value, 1, MPI_INT, 0, MPI_COMM_WORLD); // El 0 indica quien es el que envía el mensaje y 1 es el tamaño del buffer
    printf("Process %d: After MPI_Bcast, value is %d\n",my_id, value);
    MPI_Finalize();
}