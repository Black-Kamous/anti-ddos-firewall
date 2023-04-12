#include "hc.h"

HcFilter::HcFilter(std::string filename)
{
    std::ifstream in(filename, std::ios::in);
    std::string ip;
    v6addr v6;
    uint32_t v4;
    int ttl;
    while(in.good()){
        in >> ip >> ttl;
        if(ip.find(':') != std::string::npos){
            inet_pton(AF_INET6, ip.c_str(), &v6);
            ipv6map[v6].insert(ttl);
        }else{
            inet_pton(AF_INET, ip.c_str(), &v4);
            ipv4map[v4].insert(ttl);
        }
    }
    this->type = "hc";
    this->outputToFile("midds/block_ipttl.t");
}

int HcFilter::filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl)
{
    v6addr v6;
    uint32_t v4;
    if(ipVer == 6){
        inet_pton(AF_INET6, ip.c_str(), &v6);
        if(ipv6map.find(v6) != ipv6map.end()){
            if(find(ipv6map[v6].begin(), ipv6map[v6].end(), ttl) == ipv6map[v6].end()){
                return F_DROPPED;
            }
        }
    }else{
        inet_pton(AF_INET, ip.c_str(), &v4);
        if(ipv4map.find(v4) != ipv4map.end()){
            if(find(ipv4map[v4].begin(), ipv4map[v4].end(), ttl) == ipv4map[v4].end()){
                return F_DROPPED;
            }
        }
    }
    return F_PASSED;
}

void HcFilter::outputToFile(std::string filename)
{
    std::ofstream out(filename, std::ios::out);
    auto mit = ipv4map.begin();
    for(;mit != ipv4map.end();++mit)
    {
        char ip[16];
        inet_ntop(AF_INET, &(mit->first), ip, 16);
        out << ip;
        auto sit = mit->second.begin();
        for(;sit != mit->second.end(); ++sit)
        {
            out << " " << (int)(*sit);
        }
        out << std::endl;
    }
    out.close();
}