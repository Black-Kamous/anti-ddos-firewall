#include "qn.h"


QnFilter::QnFilter(std::string filename){
    lpm = new PlainLPM<struct qname, uint32_t>();
    std::vector<std::string> res = qn_train(filename);
    std::string qname;
    for(auto rit = res.begin(); rit != res.end(); rit++) {
        qname = *rit;
        std::reverse(qname.begin(), qname.end());
        struct qname qn = {.n = {0}};
        strncpy(qn.n, qname.c_str(), QNAME_MAX);
        lpm->update(qn, qname.size(), 1);
    }
    this->type = "qn";
}

int QnFilter::filter(std::string ip, int ipVer, std::string queryName, time_t time, uint8_t ttl){
    std::reverse(queryName.begin(), queryName.end());
    struct qname qn = {.n = {0}};
    strncpy(qn.n, queryName.c_str(), QNAME_MAX);
    uint32_t* vptr = lpm->lookup(qn, queryName.size());
    if(vptr == NULL){
        nPassed++;
        return F_PASSED;
    }else{
        nDropped++;
        return F_DROPPED;
    }
}