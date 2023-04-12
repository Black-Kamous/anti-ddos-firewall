#include "ur.h"

UrFilter::UrFilter(std::string filename)
{
    std::ifstream in(filename, std::ios::in);
    std::string ip;
    v6addr v6;
    uint32_t v4;
    while(in.good()){
        in>>ip;
        if(ip.find(':') != std::string::npos){
            inet_pton(AF_INET6, ip.c_str(), &v6);
            ipv6map[v6] = 1;
        }else{
            inet_pton(AF_INET, ip.c_str(), &v4);
            ipv4map[v4] = 1;
        }
    }
    this->type = "ur";
    this->outputToFile("midds/block_ip.t");
}

int UrFilter::filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl)
{
    v6addr v6;
    uint32_t v4;
    if(ipVer == 6){
        inet_pton(AF_INET6, ip.c_str(), &v6);
        if(ipv6map.find(v6) != ipv6map.end()){
            return F_PASSED;
        }else{
            return F_DROPPED;
        }
    }else{
        inet_pton(AF_INET, ip.c_str(), &v4);
        if(ipv4map.find(v4) != ipv4map.end()){
            return F_PASSED;
        }else{
            return F_DROPPED;
        }
    }
}

void UrFilter::outputToFile(std::string filename)
{
    std::ofstream out(filename, std::ios::out);
    auto mit = ipv4map.begin();
    for(;mit != ipv4map.end();++mit)
    {
        char ip[16];
        inet_ntop(AF_INET, &(mit->first), ip, 16);
        out << ip << std::endl;
    }
    out.close();
}