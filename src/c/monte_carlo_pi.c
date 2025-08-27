#include <stdio.h>
#include <stdlib.h>
#define f float
#define r (f)rand()/RAND_MAX
int main(int, char *v[]){
    int n = atoi(v[1]),c=0;
    float x,y;
    for(int i=0;i<n;++i,x=r,y=r)
        c+=(x*x+y*y)<1;
    printf("%f",4.*c/n);
}
