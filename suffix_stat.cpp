#include <map>
#include <iostream>
#include <string>
#include <set>
#include <vector>
#include <fstream>

#define simple_print(p) std::cout<<(p)<<std::endl

std::set<std::string> tldset = {"com", "net", "org", "gov", "edu", "cn", "uk", "us", "ru"};

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

void domain2qname(char *domain, int len){
	if(len > 253)
		return;
	
    int i=0;
    for(;i<len;++i){
        if(domain[i] == '.'){
            int j;
            for(j=i+1;j<len;++j){
                if(domain[j] == '.'){
                    break;
                }
            }
            domain[i] = j-i-1+'0';
            i=j-1;
        }
    }
}

int main(int argc, char **argv){
    // if(argc != 2){
    //     std::cout << "Wrong arg" << std::endl;
    //     return 1;
    // }
    // std::string fname = std::string(argv[1]);
    
    std::map<std::string, int> sufmap;
    char dmbuf[256];

    std::ifstream in("domains.t");
    if(!in.is_open()){
        std::cout << "File error" << std::endl;
        return 1;
    }

    int i, last, cnt;
    int dmlens[20];
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
            sufmap[suffix]++;
            last -= dmlens[cnt];
        }
    }

    int max=0, sec=0;
    std::map<std::string, int>::iterator iter, maxiter;
    iter = sufmap.begin();
    while(iter != sufmap.end()){
        std::cout << iter->first << " " << iter->second << std::endl;
        if(iter->second > max){
            sec = max;
            max = iter->second;
        }
        iter++;
    }

    const int k=3;
    if(max < k*sec){
        return 0;
    }

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

    simple_print("-----");
    for(int i=0;i<maxv.size();++i){
        char s[256];
        maxv[i].copy(s, maxv[i].size());
        domain2qname(s, maxv[i].size());
        simple_print(s);
    }

    return 0;
}