#include "qn_train.h"

static std::set<std::string> tldset = {"com", "net", "org", "gov", "edu", "cn", "uk", "us", "ru"};

bool is_suffix(std::string base, std::string suf){
    if(base.length() < suf.length())
        return false;
    int diff = base.length() - suf.length();
    for(int i=suf.length()-1;i>=0;--i){
        if(base[i+diff] != suf[i])
            return false;
    }
    return true;
}

std::vector<std::string> qn_train(std::string filename, int mult=3)
{
    std::map<std::string, int> sufmap;
    char dmbuf[256];

    std::ifstream in(filename);
    if(!in.is_open()){
        std::cout << "File error" << std::endl;
        return std::vector<std::string>();
    }

    int i, last, cnt;
    int dmlens[20];
    //将各个后缀存入map计数
    while(in.getline(dmbuf, 255)){
        memset(dmlens, 0, sizeof(dmlens));
        for(i=0,last=-1,cnt=0;i<256&&dmbuf[i];++i){
            if(dmbuf[i] == '.'){
                dmlens[cnt++] = i-last;
                last = i;
            }
        }
        while(cnt--){
            std::string suffix(dmbuf+last+1);
            if (tldset.find(suffix) == tldset.end()) {
                sufmap[suffix]++;
            }
            last -= dmlens[cnt];
        }
    }

    //计算出现频率，并比较大小
    int max=0, sec=0;
    std::map<std::string, int>::iterator iter, maxiter;
    iter = sufmap.begin();
    while(iter != sufmap.end()){
        std::cout << iter->first << " " << iter->second << std::endl;
        if(iter->second > max){
            sec = max;
            max = iter->second;
        }
        if(iter->second > sec && iter->second != max){
            sec = iter->second;
        }
        iter++;
    }
    

    simple_print(max);
    simple_print(sec);
    int k=mult;
    if(max < k*sec){
        return std::vector<std::string>();
    }

    //当一个后缀出现最多时，它的子后缀出现同样次数
    //例如.example.com和.com
    //本段将找出最长的后缀，能够找出多个不互为后缀的出现次数满足要求的
    //
    //注意不能先去掉子后缀再进行计数
    std::vector<std::string> maxv;
    iter = sufmap.begin();
    bool issuf;
    while(iter != sufmap.end()){
        if(iter->second == max){
            issuf = false;
            for(int i=0;i<maxv.size();++i){
                if(is_suffix(maxv[i], iter->first)){
                    issuf = true;
                    break;
                }else if(is_suffix(iter->first, maxv[i])){
                    maxv.erase(maxv.begin()+i);
                    break;
                }
            }
            if(!issuf){
                maxv.push_back(iter->first);
            }
        }
        iter++;
    }
    return maxv;
}
