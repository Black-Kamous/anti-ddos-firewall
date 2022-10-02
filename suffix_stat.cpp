#include <map>
#include <iostream>
#include <string>
#include <fstream>

#define simple_print(p) std::cout<<(p)<<std::endl;

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

    std::map<std::string, int>::iterator iter;
    iter = sufmap.begin();
    while(iter != sufmap.end()){
        std::cout << iter->first << " " << iter->second << std::endl;
        iter++;
    }

    

    return 0;
}