#include <stdlib.h>
#include <types.h>
#include <string>

class Filter{
public:
    __u32 nPassed, nDropped;
    time_t startTime, endTime;
    virtual int filter(std::string ip, int ipVer, std::string queryName, time_t time) = 0;
    virtual double getPassedRate() = 0;
};