#ifndef UR_H
#define UR_H

#include <cstdint>
#include <map>
#include "filter.h"
#include "lpm.h"
#include <iostream>
#include <fstream>
#include <arpa/inet.h>


class UrFilter : public Filter
{
    std::map<uint32_t, uint8_t> ipv4map;
    std::map<v6addr, uint8_t> ipv6map;
public:
    UrFilter(std::string filename);
    int filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl);
    void outputToFile(std::string filename);
};

#endif