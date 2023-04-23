// include
#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <string>
#include <vector>
#include <algorithm>

#include "core.h"
#include "filter.h"
#include "qn.h"
#include "hc.h"
#include "ur.h"

#define TIME_INT (47+0.1)

std::string filename = "midds/all.midd";
std::string qfile = "midds/domains.t";
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
    while ((opt = getopt(argc, argv, "t:q:u:h:")) != -1)
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
        }
    }

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

    auto singleres = testSingle(singles);

    for (unsigned long i = 0; i < singles.size(); ++i)
    {
        simple_print(singles[i]->type + " " + std::to_string(singleres[i]*TIME_INT));
    }

    auto minit = std::min_element(singleres.begin(), singleres.end());
    if (*minit < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(singles[minit - singleres.begin()]);
        
        if(chosen[0]->type == "qn")
        {
            loadargs += " --qn=xdp_pass_kern.o --qfile=midds/block_domains.t";
        }else if(chosen[0]->type == "ur")
        {
            loadargs += " --ur=urf.o --ufile=midds/block_ip.t";
        }else if(chosen[0]->type == "hc")
        {
            loadargs += " --hc=lpm_test.o --hfile=midds/block_ipttl.t";
        }

        goto deploy;
    }

    // 如果效果不好，联合测试
    clearFilter();

    // 方案一
    deployFilter(*uptr);
    deployFilter(*hptr);

    res = testAllOnDeployed();
    if (res < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(uptr);
        chosen.emplace_back(hptr);
        loadargs += " --ur=urf.o --ufile=midds/block_ip.t";
        loadargs += " --hc=lpm_test.o --hfile=midds/block_ipttl.t";
        //goto deploy;
    }

    simple_print(res*TIME_INT);
    // 方案二
    deployFilter(*qptr);

    res = testAllOnDeployed();
    simple_print(res*TIME_INT);
    if (res < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(uptr);
        chosen.emplace_back(hptr);
        chosen.emplace_back(qptr);
        loadargs += " --ur=urf.o --ufile=midds/block_ip.t";
        loadargs += " --hc=lpm_test.o --hfile=midds/block_ipttl.t";
        loadargs += " --qn=xdp_pass_kern.o --qfile=midds/block_domains.t";
        //goto deploy;
    }


    // 部署过滤器
deploy:
    std::cout << "deployed filters:" << std::endl;
    for (auto cit = chosen.begin(); cit != chosen.end(); ++cit)
    {
        std::cout << (*cit)->type << std::endl;
    }
    std::system((loader+ifarg+" --unload-all").c_str());
    std::system((loader+ifarg+loadargs).c_str());
    return 0;
}