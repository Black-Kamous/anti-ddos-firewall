#include <map>
#include <iostream>
#include <string>
#include <set>
#include <fstream>

#define simple_print(p) std::cout<<(p)<<std::endl

std::set<std::string> tldset = {"com", "net", "org", "gov", "edu", "cn", "uk", "us", "ru"};

void domain2qname(char *domain, int len){
	if(len > 253)
		return;
	
    int i=0;
    for(;i<len;++i){
        if(domain[i] == '.'){
            int j;
            for(j=i;j<len;++j){
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
            maxiter = iter;
        }
        iter++;
    }

    if(!tldset.count(maxiter->first)){
        const int k=3;
        if(max >= k*sec){
            char s[256];
            maxiter->first.copy(s, maxiter->first.length());
            domain2qname(s, maxiter->first.length());
            simple_print(s);
        }
    }
    

    return 0;
}