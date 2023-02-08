// include
#include <iostream>
#include <unistd.h>
#include <string>

#include "core.h"
#include "filter.h"
#include "qn.h"
#include "hc.h"
#include "ur.h"

int main(int argc, char **argv)
{
    std::string filename = "all.midd";
    std::string qfile = "qname.midd";
    std::string ufile = "ip.midd";
    std::string hfile = "ipttl.midd";
    char opt;
    while ((opt = getopt(argc, argv, "t:q:u:h:")) != -1)
    {
        switch(opt)
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
    Filter* qptr = new QnFilter(qfile);
    Filter* uptr = new UrFilter(ufile);
    Filter* hptr = new HcFilter(hfile);

    // 过滤器单独测试
    clearFilter();
    deployFilter(*qptr);


    // 如果效果不好，联合测试

    // 部署过滤器
}