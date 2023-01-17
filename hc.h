#ifndef UR_H
#define UR_H

#include <cstdint>
#include <map>
#include <vector>
#include "filter.h"
#include "lpm.h"
#include <iostream>
#include <fstream>
#include <algorithm>
#include <arpa/inet.h>

typedef struct ipv6addrbin{
    uint64_t h64;
    uint64_t l64;
}v6addr;

class HcFilter : public Filter
{
    std::map<uint32_t, std::vector<uint8_t>> ipv4map;
    std::map<v6addr, std::vector<uint8_t>> ipv6map;
public:
    HcFilter(std::string filename);
    int filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl);
};

#endif