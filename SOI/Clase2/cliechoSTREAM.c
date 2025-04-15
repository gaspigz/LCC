#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAXMSG 1024

#define MSG "HOLA MUNDO! Como Va"

int main(){

    struct sockaddr_un srv_name, cli_name;
    socklen_t srv_size;
    ssize_t nbytes;
    char buff[MAXMSG + 1];


    int socket_cli = socket(AF_UNIX, SOCK_STREAM, 0);
    if(socket_cli<0){
        perror("Fallo la creacion del socket cliente.");
        exit(EXIT_FAILURE);
    }

    //cli_name.sun_family = AF_UNIX;
    //strcpy(cli_name.sun_path, "CLIENTE");

    //unlink(srv_name.sun_path);

/*
    if(bind(socket_cli, (struct sockaddr_un *) &cli_name, sizeof(cli_name))){
        perror("Fallo la asignacion del nombre del cliente");
        exit(EXIT_FAILURE);
        // Bind da 0 si esta todo OK por lo que no entraria aca.
    }*/


    srv_name.sun_family = AF_UNIX;
    strcpy(srv_name.sun_path, "SRV_NAME");
    srv_size = sizeof(struct sockaddr_un);

    connect(socket_cli, (struct sockaddr*) &srv_name, srv_size);

    printf("[CLI] Conexion con %d OK\n", "SRV_NAME");
    send(socket_cli, MSG, sizeof(MSG), 0);

    recv(socket_cli, buff, MAXMSG, 0);
    printf("[CLI] Recibi: %s\n", buff);
    close(socket_cli);

    return 0;
}