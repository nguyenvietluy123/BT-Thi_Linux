#include<stdio.h>

int main(int argc, char *argv[], char *env[])
{
    int i=0;
    printf("Content-type: text/plain\n");
    printf("Hello, you are still learning C!\n");
    printf("Number of arguments to the main function: %d\n", argc);
    for (i=0; i<argc; i++) {
        printf("Argument number %d is %s\n", i, argv[i]);
    }
    
    i=0;
    printf("Environment variable:\n");
    while (env[i]) {
        printf("Env[%d]=%s\n", i, env[i]);
        i++;
    }
    
    return 0;
}

