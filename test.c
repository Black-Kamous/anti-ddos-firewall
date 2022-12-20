#include <dlfcn.h>

int main(){
    dlopen("/usr/lib/libclang.so", RTLD_NOW);
    return 0;
}