/*
Ej. 1 (Pan y Manteca)

Supongamos que tenemos un proceso A que quiere hacerse un pan con manteca. 
La presencia del pan en la mesa se simboliza con una variable booleana P, 
e idem para la manteca con M. Ambas variables están protegidas por un mutex lk. 

El proceso A, al haber observado que no había ninguna de las dos cosas, 
se puso a esperar en una variable de condición cv a que alguien lo despierte 
cuando ambas cosas existan sobre la mesa. 

Si se despierta a A con un solo ingrediente (un estado inaceptable), 
A destruye la casa en un ataque de furia.

Ahora, el proceso B, habiendo obtenido ambos ingredientes, intenta despertar a A 
vía la siguiente secuencia:

    pthread_mutex_lock(&lk);
    P = true;
    pthread_cond_signal(&cv);
    M = true;
    pthread_mutex_unlock(&lk);

¿Es esto correcto? ¿Qué problema puede haber?

Respuesta:
En semántica MESA es correcto, pues el proceso A recibiría la señal, y quedaría LOCKEADO (no se desbloquea
por recibir señal como en Hoare). Hasta que no se desbloqueen los recursos, A no chequeará que la condición
este cumplida.

Viendo el código vemos que el proceso B desbloquea el Mutex SOLO cuando la condición de que 
P y M sean True. Al desbloquearse el recurso, el proceso A podrá competir por ellos y al momento de tomarlos
chequeará que la condición de que P y M sean true ocurra. Como esto es verdadero, puede continuar A.

Conclusión, A no destruirá la casa.



*/
