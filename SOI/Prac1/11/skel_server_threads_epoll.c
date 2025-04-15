#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include <sys/wait.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <sys/epoll.h>

#include <pthread.h>

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int lsock;
struct epoll_event ev;
struct sockaddr_in sa;
int rc;
int yes = 1;

/*
 * Para probar, usar netcat. Ej:
 *
 *      $ nc localhost 4040
 *      NUEVO
 *      0
 *      NUEVO
 *      1
 *      CHAU
 */

void quit(char *s)
{
	perror(s);
	abort();
}

int U = 0;

int fd_readline(int fd, char *buf)
{
	int rc;
	int i = 0;

	/*
	 * Leemos de a un caracter (no muy eficiente...) hasta
	 * completar una línea.
	 */
	while ((rc = read(fd, buf + i, 1)) > 0) {
		if (buf[i] == '\n')
			break;
		i++;
	}

	if (rc < 0)
		return rc;

	buf[i] = 0;
	return i;
}

void* handle_conn(void* arg)
{
	char buf[200];
	int csock = *(int*)arg;
	int rc;
	printf("\n [SVP] Abriendo conexión...\n");

	while (1) {
		/* Atendemos pedidos, uno por linea */
		rc = fd_readline(csock, buf);
		if (rc < 0)
			quit("read... raro");

		if (rc == 0) {
			/* linea vacia, se cerró la conexión */
			close(csock);
			return NULL;
		}
		if (!strcmp(buf, "NUEVO")) {
			pthread_mutex_lock(&mutex);
			char reply[20];
			sprintf(reply, "%d\n", U);
			U++;
			pthread_mutex_unlock(&mutex);
			write(csock, reply, strlen(reply));
		} else if (!strcmp(buf, "CHAU")) {
			printf("\n [SVP] Cerrando conexión...\n");
			close(csock);
			return NULL;
		}
	}
}

void handle_line(int csock)
{
	char buf[200];
	int rc = fd_readline(csock, buf);

	if (rc <= 0) {
		close(csock);
		return;
	}
	if (!strcmp(buf, "NUEVO")) {
		pthread_mutex_lock(&mutex);
		char reply[20];
		sprintf(reply, "%d\n", U++);
		pthread_mutex_unlock(&mutex);
		write(csock, reply, strlen(reply));
	} else if (!strcmp(buf, "CHAU")) {
		printf("\n [SVP] Cerrando conexión...\n");
		close(csock);
	}
}

void* wait_for_clients(void* fde)
{
    struct epoll_event events[10];
    int conn_sock;

    socklen_t sa_len = sizeof(&sa);

    for(;;){
        int cantidad_eventos_para_leer = epoll_wait(*(int*)fde, events, 10, -1);
        for(int i = 0; i < cantidad_eventos_para_leer; i++){
            if(events[i].data.fd == lsock){
                conn_sock = accept(lsock, (struct sockaddr *)&sa, &sa_len);
                if (conn_sock == -1) {
                    perror("accept");
                    exit(EXIT_FAILURE);
                }

                ev.events = EPOLLIN | EPOLLET;
                ev.data.fd = conn_sock;

                if (epoll_ctl(*(int*)fde, EPOLL_CTL_ADD, conn_sock, &ev) == -1){
                    perror("epoll_ctl: conn_sock");
                    exit(EXIT_FAILURE);
                }

            }else{
                handle_line(events[i].data.fd);
            }
        }
    }

}

/* Crea un socket de escucha en puerto 4040 TCP */
int mk_lsock()
{
	/* Crear socket */
	lsock = socket(AF_INET, SOCK_STREAM, 0);
	if (lsock < 0)
		quit("socket");

	/* Setear opción reuseaddr... normalmente no es necesario */
	if (setsockopt(lsock, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof yes) == 1)
		quit("setsockopt");

	sa.sin_family = AF_INET;
	sa.sin_port = htons(4040);
	sa.sin_addr.s_addr = htonl(INADDR_ANY);

	/* Bindear al puerto 4040 TCP, en todas las direcciones disponibles */
	rc = bind(lsock, (struct sockaddr *)&sa, sizeof sa);
	if (rc < 0)
		quit("bind");

	/* Setear en modo escucha */
	rc = listen(lsock, 10);
	if (rc < 0)
		quit("listen");

	return lsock;
}

int main()
{
	int fde = epoll_create1(0);
	
    lsock = mk_lsock();

	ev.events = EPOLLIN;
	ev.data.fd = lsock;

	epoll_ctl(fde, EPOLL_CTL_ADD, lsock, &ev);

	pthread_t threads[4];
    for(int i = 0; i < 4; i++){
        pthread_create(&threads[i], NULL, wait_for_clients, &fde);
    }
    for(int i = 0; i < 4; i++){
        pthread_join(threads[i], NULL);
    }
}
