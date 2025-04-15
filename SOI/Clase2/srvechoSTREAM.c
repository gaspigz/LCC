#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAXMSG 1024

#define MSG "HOLA MUNDO! Como Va"

int main(){

    struct sockaddr_un srv_name, cli_name;
    socklen_t srv_size, cli_size;
    ssize_t nbytes;
    char buff[MAXMSG + 1];

    srv_name.sun_family = AF_UNIX;
    strcpy(srv_name.sun_path, "SRV_NAME");

    int socket_srv = socket(AF_UNIX, SOCK_STREAM, 0);

    unlink(srv_name.sun_path);

    if(bind(socket_srv, (struct sockaddr *) &srv_name, sizeof(srv_name))){
        perror("Fallo la asignacion del nombre del server");
        exit(EXIT_FAILURE);
        // Bind da 0 si esta todo OK por lo que no entraria aca.
    }

    listen(socket_srv, 10); // 10 es el backlog, la cantidad maxima de cola que pueden esperar ser aceptados.

    int socket_cli = accept(socket_srv, (struct sockaddr *) &cli_name, &cli_size);
    // Accept me devuelve OTRO FD. El nuevo descriptor de socket. El que me permite conectarme con ese cliente.
    // Un socket por cada cliente.

    nbytes = recv(socket_cli, buff, MAXMSG, 0);

    printf("[SRV] Recibi: %s\n",buff);

    send(socket_cli, buff, nbytes, 0);

    printf("[CLI] Envie: %s\n",buff);

    close(socket_cli); // Cierro el cliente con el que me estoy comunicando.

    close(socket_srv);

    remove("SRV_NAME");

    return 0;
}