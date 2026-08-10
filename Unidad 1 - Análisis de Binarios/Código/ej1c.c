#include <stdio.h>
#include <string.h>

#define FORTUNE_AMOUNT 6

const char *fortunes[FORTUNE_AMOUNT] = {
    "Never be led astray onto the path of virtue.",
    "You will forget that you ever knew me.",
    "Your society will be sought by people of taste and refinement.",
    "You will be honored for contributing your time and skill to a worthy cause.",
    "Expect the worst, it's the least you can do.",
    "Break into jail and claim police brutality."
};

int main(void) {

    char name[256];

    printf("Vienvenido a al adibinador de la fortuna! Este mensaje es muy largo, y puede ser muy molesto al usuario. Tal vez deberiamos acortarlo?\n");
    printf("Cual es tu nonbre?: ");

    while (1) {
        //Nota del autor (jojohuerta):  Si bien mas adelante en la guia vamos a aprender que para el fortune se uso
        //                              la funcion scanf, como todavia no llegamos a ese ejercicio todavia se supone
        //                              que no lo sabemos. La otra razon por la que no uso scanf es porque fgets es 
        //                              mucho mas seguro para evitar buffer overflows. Para mas informacion acerca de
        //                              esta funcion, pueden revisar el manual, el cual pueden acceder desde la 
        //                              terminal o bien buscandolo por internet. 
        //                              Dejo el siguiente link: https://man7.org/linux/man-pages/man3/fgets.3p.html
        //                              Como consejo de alumno les recomiendo que se acostumbren a leerlo, sobre todo
        //                              porque lo van a usar mucho en la materia Sistemas Operativos.   
        if (fgets(name, sizeof(name), stdin) != NULL) {
            
            int len = strlen(name);
            
            //fgets guarda el salto de linea, por lo que tenemos que verificar si esta y lo pisamos por un "null       
            //terminated"
            if (len > 0 && name[len - 1] == '\n') {
                name[len - 1] = '\0';
                len--; 
            }

            //Esto es por si un usuario apreto enter sin escribir nada
            if (len == 0) {
                continue;
            }

            int index = (len - 1) % FORTUNE_AMOUNT;
            printf("\nTu fortuna es:\n%s\n", fortunes[index]);
            
            break; 
            
        } else {
            break;
        }
    }

    return 0;
}
