#ifndef FILTER_H
#define FILTER_H

#include <stdlib.h>
#include <cstdint>
#include <string>

class Filter{
public:
    uint32_t nPassed, nDropped;
    time_t startTime, endTime;
    virtual int filter(std::string ip, int ipVer, std::string queryName, time_t time) = 0;
    virtual double getPassedRate() = 0;
};

#endif