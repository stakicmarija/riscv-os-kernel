#include "../h/SemaphoreC.hpp"

SemaphoreC::SemaphoreC(unsigned init){
    value = (int)init;
    mutexClosed = false;
}

SemaphoreC *SemaphoreC::createSem(SemaphoreC **handle, unsigned init) {
    *handle = new SemaphoreC(init);
    return *handle;
}

void SemaphoreC::block() {
    TCB::running->setBlocked(true);
    blocked.addLast(TCB::running);
    TCB::dispatch();
}

void SemaphoreC::unblock() {
    TCB* ready = blocked.removeFirst();
    ready->setBlocked(false);
    Scheduler::put(ready);
}

int SemaphoreC::wait() {
    if(mutexClosed) return -1;
    if(--value < 0) block();
    return 0;
}

int SemaphoreC::signal() {
    if(mutexClosed) return -1;
    value++;
    if(value<=0) unblock();
    return 0;
}

int SemaphoreC::close() {
    if(mutexClosed) return -1;
    mutexClosed = true;
    while(blocked.peekFirst()) unblock();
    return 0;
}

SemaphoreC::~SemaphoreC() {
    close();
}

int SemaphoreC::tryWait() { //neblokirajuca verzija wait
    if (mutexClosed) return -1;
    if (--value < 0) { //ako semafor nije dostupan odmah se vraća sa rezultatom umesto da blokira nit
        ++value;
        return 0;
    }
    return 1;
}