#ifndef LPM_H
#define LPM_H

#include <cstdint>
#include <cstdlib>

template <class K, class V>
class LPM
{
public:
    //keylen应为前缀的位数（bits）
    virtual V *lookup(K key, int keylen) = 0;
    virtual int update(K key, int keylen, V val) = 0;
    virtual int remove(K key) = 0;
};

#endif