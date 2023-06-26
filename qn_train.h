#ifndef QN_TRAIN_H
#define QN_TRAIN_H

#include <map>
#include <iostream>
#include <string>
#include <set>
#include <vector>
#include <fstream>
#include <cstring>

#define simple_print(p) std::cout<<(p)<<std::endl

bool is_suffix(std::string base, std::string suf);

std::vector<std::string> qn_train(std::string filename, int mult);

#endif
