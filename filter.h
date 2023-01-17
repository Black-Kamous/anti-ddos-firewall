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
    virtual double getPassedRate() = 0;
    bool sameType(Filter *ano){return (this->type == ano->type);}
};

#endif