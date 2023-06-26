// include
#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>

#include "core.h"
#include "filter.h"
#include "qn.h"
#include "hc.h"
#include "ur.h"

#define TIME_INT (47+0.1)

std::string filename = "midds/all.midd";
std::string qfile = "midds/qname.midd";
bool set_qfile = false;
std::string ufile = "midds/ip.midd";
std::string hfile = "midds/ipttl.midd";

std::string loader = "./myloader";
std::string ifarg = " --iface=eth0";
std::string loadargs = " ";

double trafThres = 300.0;
std::deque<Filter *> chosen;

int main(int argc, char **argv)
{
    char opt;
    while ((opt = getopt(argc, argv, "t:q:u:h:s:")) != -1)
    {
        switch (opt)
        {
        case 't':
            filename = optarg;
            break;
        case 'q':
            qfile = optarg;
            set_qfile = true;
            break;
        case 'u':
            ufile = optarg;
            break;
        case 'h':
            hfile = optarg;
            break;
        case 's':
            trafThres = atoi(optarg);
            break;
        }
    }

    clock_t start = clock();
    // 初始化测试流量
    loadPackets(filename);
    splitQnameToFile("midds/.in_domains.t");

    // 初始化过滤器
    Filter *qptr = NULL;
    if(set_qfile)
        qptr = new QnFilter(qfile);
    else
        qptr = new QnFilter("midds/.in_domains.t");
    Filter *uptr = new UrFilter(ufile);
    Filter *hptr = new HcFilter(hfile);
    double res;

    // 过滤器单独测试
    std::vector<Filter *> singles;
    singles.push_back(qptr);
    singles.push_back(uptr);
    singles.push_back(hptr);

    clock_t loaded = clock();

    auto singleres = testSingle(singles);

    for (unsigned long i = 0; i < singles.size(); ++i)
    {
        simple_print(singles[i]->type + " " + std::to_string(singleres[i]));
    }

    auto minit = std::min_element(singleres.begin(), singleres.end());
    if (*minit < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(singles[minit - singleres.begin()]);
        
        if(chosen[0]->type == "qn")
        {
            loadargs += " --qn=qn.o --qfile=midds/block_domains.t";
        }else if(chosen[0]->type == "ur")
        {
            loadargs += " --ur=ur.o --ufile=midds/block_ip.t";
        }else if(chosen[0]->type == "hc")
        {
            loadargs += " --hc=hc.o --hfile=midds/block_ipttl.t";
        }

        //goto deploy;
    }

    // 如果效果不好，联合测试
    clearFilter();

    // 方案一
    deployFilter(*uptr);
    deployFilter(*hptr);

    res = testAllOnDeployed();
    simple_print("scheme1:"+ std::to_string(res));
    if (res < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(uptr);
        chosen.emplace_back(hptr);
        loadargs += " --ur=ur.o --ufile=midds/block_ip.t";
        loadargs += " --hc=hc.o --hfile=midds/block_ipttl.t";
        //goto deploy;
    }

    
    // 方案二
    clearFilter();
    deployFilter(*qptr);
    deployFilter(*uptr);

    res = testAllOnDeployed();
    simple_print("scheme2:"+ std::to_string(res));
    if (res < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(uptr);
        chosen.emplace_back(qptr);
        loadargs += " --ur=ur.o --ufile=midds/block_ip.t";
        loadargs += " --qn=qn.o --qfile=midds/block_domains.t";
        //goto deploy;
    }

    //方案三
    deployFilter(*hptr);

    res = testAllOnDeployed();
    simple_print("scheme3:"+ std::to_string(res));
    if (res < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(uptr);
        chosen.emplace_back(hptr);
        chosen.emplace_back(qptr);
        loadargs += " --ur=ur.o --ufile=midds/block_ip.t";
        loadargs += " --hc=hc.o --hfile=midds/block_ipttl.t";
        loadargs += " --qn=qn.o --qfile=midds/block_domains.t";
        //goto deploy;
    }


    // 部署过滤器
deploy:
    clock_t choosed = clock();

    simple_print("loading time: " + std::to_string(loaded-start) + "ms");
    simple_print("choosing time: " + std::to_string(choosed-loaded) + "ms");
    simple_print("total time: " + std::to_string(choosed-start) + "ms");

    simple_print("\ndeployed filters:");
    for (auto cit = chosen.begin(); cit != chosen.end(); ++cit)
    {
        std::cout << (*cit)->type << std::endl;
    }
    std::system((loader+ifarg+" --unload-all").c_str());
    std::system((loader+ifarg+loadargs).c_str());
    return 0;
}