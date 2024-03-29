#ifndef HC_H
#define HC_H

#include <cstdint>
#include <map>
#include <set>
#include "filter.h"
#include "lpm.h"
#include <iostream>
#include <fstream>
#include <algorithm>
#include <arpa/inet.h>

class HcFilter : public Filter
{
    std::map<uint32_t, std::set<uint8_t>> ipv4map;
    std::map<v6addr, std::set<uint8_t>> ipv6map;
public:
    HcFilter(std::string filename);
    int filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl);
    void outputToFile(std::string filename);
};

#endif