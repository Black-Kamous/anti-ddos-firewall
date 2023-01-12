#ifndef QN_H
#define QN_H

#include <cstdint>
#include "filter.h"
#include "lpm.h"

#define QNAME_MAX 256

struct qname{
    char n[QNAME_MAX];
};

class QnFilter : public Filter
{
    LPM<struct qname, uint32_t> *lpm;
public:
    QnFilter(std::string filename);
    int filter(std::string ip, int ipVer, std::string queryName, time_t time);
    
};

#endif