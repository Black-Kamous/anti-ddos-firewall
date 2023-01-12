#ifndef CORE_H
#define CORE_H

#include <iostream>
#include <cstdint>
#include <fstream>

#include "filter.h"
#include "qn.h"

// 捕包结果 simpack = <ip ttl qname ...>
// 训练集 -> FQ(及时) UR, HC(提前定期)
// 构造时读取训练完成结果？
// 训练程序独立/引入
//      主程序使用定时器
// 
// 全局变量 vec管理filter序列
// 全局变量 运行simpack列表
//
// 函数 装载运行simpack
// 函数 管理filter序列（有序）
// 函数 测试filter序列（全部simpack）
// 函数 测试filter序列（单个simpack）


#endif