int global_not_initialized[10];
int global_initialized[5] = {1,2,3,4,5};

int main(void){
    int not_initialized[10];
    int initialized[3] = {3,6,9};
    int not_initialized_updated[15];
    int initialized_updated[20] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};

    not_initialized_updated[10] = 42;
    initialized_updated[10] = 999;
    
    return 0;
}