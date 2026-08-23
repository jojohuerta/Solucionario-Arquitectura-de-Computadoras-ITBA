#include <stdio.h>

extern int fibonacci(int n);

int main(void){
    int calculated_number;
    
    printf("El fibonacci de 0 deberia ser 0. Y al calcular (ASM x86) da: ");
    calculated_number = fibonacci(0);
    printf("%d \n", calculated_number);
    
    printf("El fibonacci de 1 deberia ser 1. Y al calcular (ASM x86) da: ");
    calculated_number = fibonacci(1);
    printf("%d \n", calculated_number);

    printf("El fibonacci de 5 deberia ser 5. Y al calcular (ASM x86) da: ");
    calculated_number = fibonacci(5);
    printf("%d \n", calculated_number);

    printf("El fibonacci de 8 deberia ser 21. Y al calcular (ASM x86) da: ");
    calculated_number = fibonacci(8);
    printf("%d \n", calculated_number);

    return 0;
}