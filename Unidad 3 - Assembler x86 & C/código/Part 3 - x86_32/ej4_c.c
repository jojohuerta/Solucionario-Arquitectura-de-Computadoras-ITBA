#include <stdio.h>

extern int seven(void);

int main(void){
    printf("This should be the number seven:");
    int mysterious_number = seven();
    printf("%d", mysterious_number);
    return 0;
}