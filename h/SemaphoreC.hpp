#ifndef SEMAPHOREC_H
#define SEMAPHOREC_H

#include "list.hpp"
#include "TCB.hpp"

class SemaphoreC {
public:
    SemaphoreC(unsigned init);
    ~SemaphoreC();

    int wait();
    int signal();
    int close();
    int tryWait();

    void block();
    void unblock();
    static SemaphoreC* createSem(SemaphoreC **handle, unsigned init);

private:
    int value;
    List<TCB> blocked;
    bool mutexClosed;
};



#endif //SEMAPHOREC_H
