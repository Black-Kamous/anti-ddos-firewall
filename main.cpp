// include
#include <iostream>
#include <unistd.h>
#include <string>
#include <vector>
#include <algorithm>

#include "core.h"
#include "filter.h"
#include "qn.h"
#include "hc.h"
#include "ur.h"

std::string filename = "all.midd";
std::string qfile = "domains.t";
std::string ufile = "ip.midd";
std::string hfile = "ipttl.midd";

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

    // 初始化过滤器
    Filter *qptr = new QnFilter(qfile);
    Filter *uptr = new UrFilter(ufile);
    Filter *hptr = new HcFilter(hfile);
    double res;

    // 过滤器单独测试
    std::vector<Filter *> singles;
    singles.push_back(qptr);
    singles.push_back(uptr);
    singles.push_back(hptr);

    auto singleres = testSingle(singles);

    for (int i = 0; i < singles.size(); ++i)
    {
        simple_print(singles[i]->type + " " + std::to_string(singleres[i]*131));
    }

    // auto minit = std::min_element(singleres.begin(), singleres.end());
    // if (*minit < trafThres)
    // {
    //     chosen.clear();
    //     chosen.emplace_back(singles[minit - singleres.begin()]);
    //     goto deploy;
    // }

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
        //goto deploy;
    }

    simple_print(res*131);
    // 方案二
    deployFilter(*qptr);

    res = testAllOnDeployed();
    simple_print(res*131);
    if (res < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(uptr);
        chosen.emplace_back(hptr);
        chosen.emplace_back(qptr);
        //goto deploy;
    }


    // 部署过滤器
deploy:
    for (auto cit = chosen.begin(); cit != chosen.end(); ++cit)
    {
        std::cout << (*cit)->type << std::endl;
    }
    return 0;
}