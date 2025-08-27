#include <stdlib.h>
int main(){
	for(int i = 0;i<10000;++i)
		malloc(100000);
	for(int i = 0;i<100000;++i);
}
