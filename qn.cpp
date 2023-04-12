#include "qn.h"


QnFilter::QnFilter(std::string filename, int mult){
    lpm = new PlainLPM<struct qname, uint32_t>();
    std::vector<std::string> res = qn_train(filename, mult);
    std::string qname;
    std::ofstream out("midds/block_domains.t", std::ios::out);
    for(auto rit = res.begin(); rit != res.end(); rit++) {
        qname = *rit;
        out << qname << std::endl;
        std::reverse(qname.begin(), qname.end());
        struct qname qn = {.n = {0}};
        strncpy(qn.n, qname.c_str(), QNAME_MAX);
        lpm->update(qn, qname.size()*8, 1);
    }
    this->type = "qn";
}

int QnFilter::filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl){
    std::reverse(queryName.begin(), queryName.end());
    struct qname qn = {.n = {0}};
    strncpy(qn.n, queryName.c_str(), QNAME_MAX);
    uint32_t* vptr = lpm->lookup(qn, queryName.size()*8);
    if(vptr == NULL){
        nPassed++;
        return F_PASSED;
    }else{
        nDropped++;
        return F_DROPPED;
    }
}

void QnFilter::outputToFile(std::string filename)
{
    return;
}