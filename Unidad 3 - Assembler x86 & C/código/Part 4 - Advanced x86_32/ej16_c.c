#include <stdio.h>

extern char msg[];
extern int checkLong(char *vector, int cantidad_elementos);

int main(void) {
    int valor_informado = 10; 
    
    int resultado = checkLong(msg, valor_informado);
    
    if (resultado == 0) {
        printf("Chequeo exitoso: La longitud calculada coincide con la informada.\n");
    } else if (resultado > 0) {
        printf("Error: La longitud calculada es MAYOR a la informada por %d bytes.\n", resultado);
    } else {
        printf("Error: La longitud calculada es MENOR a la informada por %d bytes.\n", resultado * -1);
    }

    return 0;
}