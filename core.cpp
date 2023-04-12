#include "core.h"

void loadPackets(std::string filename)
{
    std::ifstream in(filename, std::ios::in);
    SimplePacket simpack;
    int ttl;
    
    while(in.good()){
        in >> simpack.ip >> ttl >> simpack.qname >> simpack.time;
        simpack.ttl = ttl;
        if(simpack.ttl)
        {
            packets.push_back(simpack);
        }
        ttl = 0;
    }

    in.close();
    std::cout << "Loaded " + std::to_string(packets.size()) + " packets" << std::endl;
}

void splitQnameToFile(std::string filename)
{
    std::ofstream out(filename, std::ios::out);
    auto pit = packets.begin();
    for(;pit != packets.end();++pit)
    {
        out << pit->qname << std::endl;
    }

    out.close();
}

int deployFilter(Filter &f)
{
    for (auto dit = deployed.begin(); dit != deployed.end(); dit++)
    {
        if ((*dit)->sameType(&f))
        {
            deployed.erase(dit);
            break;
        }
    }
    if (f.type == "qn")
    {
        deployed.push_front(&f);
    }
    else if (f.type == "ur")
    {
        for (auto dit = deployed.begin(); dit != deployed.end(); dit++)
        {
            if ((*dit)->type == "hc")
            {
                deployed.emplace(dit, &f);
                break;
            }
        }
    }
    else if (f.type == "hc")
    {
        deployed.push_back(&f);
    }
    return 0;
}

int clearFilter()
{
    deployed.clear();
    return 0;
}

double testAllOnDeployed()
{
    time_t st = ~0u>>1, et = 0;
    int res;
    int passed = 0;
    for(auto pit = packets.begin(); pit != packets.end(); ++pit){
        if(pit->time < st){
            st = pit->time;
        }
        if(pit->time > et){
            et = pit->time;
        }
        res = testDeployed(*pit);
        if(res == F_PASSED){
            passed++;
        }
    }
    double passedRate = (passed)/(et-st+0.1);
    return passedRate;
}

int testDeployed(SimplePacket t)
{
    int ipVer = 4;
    if(t.ip.find(':') != std::string::npos){
        ipVer = 6;
    }
    int res;
    for (auto dit = deployed.begin();dit != deployed.end(); dit++){
        res = (*dit)->filter(t.ip, ipVer, t.qname, t.time, t.ttl);
        if(res == F_PASSED){
            continue;
        }else if(res == F_DROPPED){
            return F_DROPPED;
        }
    }
    return F_PASSED;
}

std::vector<double> testSingle(std::vector<Filter*> test)
{
    time_t st = ~0u>>1, et = 0;
    int res;
    int ipVer;
    std::vector<int> passed(test.size(), 0);
    for(auto pit = packets.begin(); pit != packets.end(); ++pit){
        ipVer = 4;
        if(pit->ip.find(':') != std::string::npos){
            ipVer = 6;
        }
        if(pit->time < st){
            st = pit->time;
        }
        if(pit->time > et){
            et = pit->time;
        }
        for(auto tit = test.begin(); tit < test.end(); ++tit)
        {
            res = (*tit)->filter(pit->ip, ipVer, pit->qname, pit->time, pit->ttl);
            if(res == F_PASSED){
                passed[tit-test.begin()]++;
            }
        }
    }
    std::vector<double> val(test.size());
    for(unsigned long cnt = 0; cnt < test.size(); ++cnt)
    {
        val[cnt] = (passed[cnt])/(et-st+0.1);
    }
    return val;
}
