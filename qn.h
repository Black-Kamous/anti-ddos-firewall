#ifndef QN_H
#define QN_H

#include <cstdint>
#include "filter.h"
#include "lpm.h"
#include "plain_lpm.h"
#include "qn_train.h"
#include <iostream>
#include <fstream>
#include <string.h>
#include <algorithm>

#define QNAME_MAX 256

struct qname{
    char n[QNAME_MAX];
};

class QnFilter : public Filter
{
    LPM<struct qname, uint32_t> *lpm;
public:
    QnFilter(std::string filename);
    int filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl);
    
};

#endif