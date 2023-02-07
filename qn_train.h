#ifndef QN_TRAIN_H
#define QN_TRAIN_H

#include <map>
#include <iostream>
#include <string>
#include <set>
#include <vector>
#include <fstream>

#define simple_print(p) std::cout<<(p)<<std::endl

std::set<std::string> tldset = {"com", "net", "org", "gov", "edu", "cn", "uk", "us", "ru"};

bool is_suffix(std::string base, std::string suf);

std::vector<std::string> qn_train(std::string filename);

#endif