#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
    int duplicado = dup(1);
    printf("Estoy en el proceso de PID: %d antes de forkear\n", getpid());
    // execl("/home/gaspi/Documentos/Carrera/TODOACA/LCC/SOI/Prac1/getpid", "");

    pid_t pid = fork(); // No determinista
    int status;
    // RTA D) EN 1 AUMENTA. EL EXEC mantiene el mismo PID.

    if (pid == 0)
    {
        printf("Estoy en el proceso hijo de PID: %d\n", getpid()); // RTA C) Aunque haya matado el dup de 1, sigue mostrndo esto. Son independientes.
         exit(0); // APARWCE COMO ZOMBI PERO SIGUE OCUPANDO LUGAR
        int duplicado_1_en_hijo = dup(1);
        close(duplicado_1_en_hijo);
        // close(1);
        printf("RTA a) Esto no lo printea");
        // close(0);
        scanf("%d", status); // No hace el scanf en el hijo.
        getchar();
    }
    else
    {
        char c;
        scanf("%c",&c);
        void* prueba = malloc(1024*1024*1024);
        // RTA F) SI AUMENTA SE VE CON EL COMANDO TOP. AUMENTA EL TAMAÑO DE MEMORIA VIRTUAL PORQUE MALLOC HACE ESO.

        printf("Estoy en el proceso padre de PID: %d\n", getpid());
        // sleep(100000);
        wait(&status);
        printf("Esto si lo muestra, aunque el hijo no tenga FD de stdout.\n");
        scanf("%d", status); // Este si lo hace porque el padre nunca cerro el FD 0.
    }

    return 0;
}