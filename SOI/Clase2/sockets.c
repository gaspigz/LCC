#include <sys/socket.h>

int socket(int domain, int type, int protocol); // Dominio local o red, tipo de conexion datagrama o stream, protocolo, defecto 0.
// Retorna un File Descriptor
int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen);
// Bind asigna la direccion especificad en addr al socket al que hace referencia el FD sockfd. 

// Permite la comunicacion entre procesos no relacionados e incluso entre procesos ejecutados en distintas computadoras pero en la misma red.
