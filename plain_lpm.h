#ifndef PLAIN_LPM_H
#define PLAIN_LPM_H

#include "lpm.h"
#include <vector>

template <class K, class V>
class PlainLPM : public LPM<K, V>
{
    struct vitem{
        K key;
        int keysize;
        V val;
    };

    std::vector<struct vitem> pvec;

public:
    PlainLPM();
    V *lookup(K key, int keylen);
    int update(K key, int keylen, V val);
    int remove(K key);
};

static bool is_prefix(uint8_t *pre, uint8_t *base, int prelen, int baselen)
{
    return true;
    if (prelen > baselen)
        return false;
    int bytes = prelen/8;
    int remain = prelen - bytes*8;
    bytes += remain>0?1:0;
    for (int i = 0; i < bytes; ++i)
    {
        if (*(pre + i) == *(base + i))
            continue;
        else if(remain != 0 && i == bytes-1)
        {
            uint8_t prebyte = *(pre+i);
            uint8_t basebyte = *(base+i);
            uint8_t exor = prebyte^basebyte;
            if((exor >> (8-remain)) != 0){
                return false;
            }
        }else
            return false;
    }
    return true;
}

template <class K, class V>
PlainLPM<K, V>::PlainLPM()
{
}

template <class K, class V>
V *PlainLPM<K, V>::lookup(K key, int keylen)
{
    uint8_t *ptr = (uint8_t *)&key;
    int longest = 0;
    typename std::vector<struct vitem>::iterator lit = pvec.end();
    for (auto it = pvec.begin(); it != pvec.end(); it++)
    {
        uint8_t *base = (uint8_t *)&(it->key);
        if (is_prefix(base, ptr, it->keysize, keylen))
        {
            if (it->keysize > longest)
            {
                longest = it->keysize;
                lit = it;
            }
        }
    }
    if (lit != pvec.end())
    {
        return &(lit->val);
    }
    return NULL;
}

template <class K, class V>
int PlainLPM<K, V>::update(K key, int keylen, V val)
{
    struct vitem vi;
    vi.key = key;
    vi.keysize = keylen;
    vi.val = val;
    pvec.push_back(vi);
    return 0;
}

template <class K, class V>
inline int PlainLPM<K, V>::remove(K key)
{
    return 0;
}

#endif