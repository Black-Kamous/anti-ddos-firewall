#include "lpm.h"
#include "plain_lpm.h"
#include <iostream>
#include <cstdint>

struct shell{
    uint8_t in[4];
};

int main(){
    auto plpm = PlainLPM<struct shell, char>();
    LPM<struct shell, char> *lpm = &plpm;
    
    struct shell ip1 = {.in = {255, 0, 0, 0}};
    struct shell ip2 = {.in = {240, 0, 0, 0}};

    
    lpm->update(ip1, 8, 1);
    lpm->update(ip2, 4, 0);

    

    struct shell ip3 = {.in = {224, 0, 0, 0}};
    char * v = lpm->lookup(ip3, 3);
    std::cout << (int)*v << std::endl;
    return 0;
}