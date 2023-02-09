#ifndef CORE_H
#define CORE_H

#include <iostream>
#include <cstdint>
#include <fstream>
#include <vector>
#include <deque>
#include <string>

#include "filter.h"
#include "qn.h"
#include "hc.h"
#include "ur.h"

// 捕包结果 simpack = <ip ttl qname ...>

typedef struct simpack{
    std::string ip;
    uint8_t ttl;
    std::string qname;
    time_t time;
}simplePacket;

// 训练集 -> FQ(及时) UR, HC(提前定期)
// 构造时读取训练完成结果？
// 训练程序独立/引入
//      主程序使用定时器
// 
// 全局变量 vec管理filter序列
// 全局变量 运行simpack列表
//

std::deque<Filter> deployed;
std::vector<simplePacket> packets;

// 装载运行simpack

void loadPackets(std::string filename);

// 管理filter序列（有序）

int deployFilter(Filter &f);
int clearFilter();

// 函数 测试filter序列（全部simpack）

double testAllOnDeployed();

// 函数 测试filter序列（单个simpack）

int testDeployed(simplePacket t);

// 单独测试一系列filter

std::vector<double> testSingle(std::vector<Filter> test);

#endif