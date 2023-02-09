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
std::string qfile = "qname.midd";
std::string ufile = "ip.midd";
std::string hfile = "ipttl.midd";

double trafThres = 300.0;
std::deque<Filter> chosen;

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

    // 过滤器单独测试
    std::vector<Filter> singles = {*qptr, *uptr, *hptr};
    auto singleres = testSingle(singles);
    auto minit = std::min_element(singleres.begin(), singleres.end());
    if (*minit < trafThres)
    {
        chosen.clear();
        chosen.emplace_back(singles[minit - singleres.begin()]);
        goto deploy;
    }

    // 如果效果不好，联合测试

    

    // 部署过滤器
deploy:
}