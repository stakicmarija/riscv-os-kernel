#include "../h/syscall_cpp.hpp"
#include "../test/printing.hpp"

void* operator new (size_t size){
    return mem_alloc(size);
}

void * operator new[] (size_t size){
    return mem_alloc(size);
}

void  operator delete (void* addr)noexcept{
    mem_free(addr);
}

void operator delete[](void *addr)noexcept{
    mem_free(addr);
}

Thread::Thread(void (*body)(void *), void *arg) : body(body), arg(arg){ //body fja koju ce nit izvrsavati
    myHandle = nullptr; //nit jos nije kreirana
}

Thread::~Thread() {}

int Thread::start() {
    if (!myHandle) return thread_create(&myHandle, body, arg);
    return  -1; //nit vec pokrenuta
}
Thread::Thread() : Thread(&threadWrapper, this) {} //za override run, posstavi se za body thread wrapper koji poziva run

void Thread::threadWrapper(void* t){
    ((Thread*)t)->run();
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep (time_t time){return -1;}


Semaphore::Semaphore(unsigned int val) {
    sem_open(&myHandle, val);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

int Semaphore::timedWait(time_t timeout) {
    return sem_timedwait (myHandle, timeout);
}

int Semaphore::tryWait() {
    return sem_trywait(myHandle);
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}