#include <types.h>
#include "filter.h"
#include "lpm.h"

#define QNAME_MAX 256

class QnFilter : public Filter
{
    LPM<char[QNAME_MAX], __u32> *lpm;
public:
    QnFilter(std::string filename);
    
};