#include <types.h>

template<class K, class V>
class LPM{
    public:
    virtual LPM(int maxKeySize) = 0;
    virtual V* lookup(K key) = 0;
    virtual int update(K key, V val) = 0;
    virtual int remove(K key) = 0;
};