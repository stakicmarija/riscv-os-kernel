#ifndef SYSCALL_CPP_H
#define SYSCALL_CPP_H

#include "syscall_c.hpp"
#include "MemoryAllocator.hpp"


void* operator new (size_t);
void  operator delete (void*)noexcept;

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch ();
    static int sleep (time_t);
    static void threadWrapper(void* t);

protected:
    Thread ();
    virtual void run () {} //podrazumevana implementacija prazna

private:
    thread_t myHandle;
    void (*body)(void*); void* arg;
};

class Semaphore {
public:
    explicit Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
    int timedWait(time_t);
    int tryWait();
private:
    sem_t myHandle;
};

class Console {
public:
    static char getc ();
    static void putc (char);
};
//apstrakcije jezgra se predstavljaju klasama čiji objekti u sebi nose (kao atribute) identifikatore (ručke) odgovarajućih objekata napravljenih u jezgru
#endif //SYSCALL_CPP_H
