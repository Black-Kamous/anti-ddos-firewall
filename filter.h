#ifndef FILTER_H
#define FILTER_H

#include <stdlib.h>
#include <cstdint>
#include <string>

#define F_PASSED 0
#define F_DROPPED 1

class Filter{
public:
    uint32_t nPassed = 0, nDropped = 0;
    time_t startTime, endTime;
    std::string type;
    virtual int filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl) = 0;
    double getPassedRate(){return (nPassed/(nPassed + nDropped + 1.0f));}
    bool sameType(Filter *ano){return (this->type == ano->type);}
};

typedef struct ipv6addrbin{
    uint64_t h64;
    uint64_t l64;

    friend bool operator<(const struct ipv6addrbin& ad1, const struct ipv6addrbin& ad2){
        if(ad1.h64 != ad2.h64)
            return (ad1.h64<ad2.h64);
        else
            return (ad1.l64<ad2.l64);
    }
}v6addr;


#endif