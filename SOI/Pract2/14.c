/*14. La siguiente funci´on recorre una cadena s de longitud len y guarda en el array r cuales caracteres
aparecieron en la cadena (asuma, por un momento, que podemos usar esta construcci´on de parallel for).
¿Hay condici´on de carrera?
*/
/*


void charsof(char *s, int len, bool r[256])
{
    int i;
    for (i = 0; i < 256; i++)
        r[i] = false;

    parallel for (i = 0; i < len; i++)
        r[s[i]] = true;
}


Si parallel for esta implementado de forma que cada proceso que crea recorre una porcion del array por ejemplo de 0 a 1/3 len el th1, de 1/3 len a 2/3 len el th2 y de 2/3 len a len el th3, no habria race condition. Pero puede que si si esta implementado diferente, habria que hacer locks.

*/