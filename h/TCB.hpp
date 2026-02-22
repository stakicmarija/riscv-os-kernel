#ifndef TCB_H
#define TCB_H

#include "../lib/hw.h"
#include "list.hpp"
#include "Scheduler.hpp"
#include "MemoryAllocator.hpp"
#include "Riscv.hpp"

class TCB{
public:
    using Body = void(*)(void*);

	//overwrite new i delete
    void *operator new(size_t size){
      return MemoryAllocator::mem_alloc((size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    }
    void operator delete(void* el) noexcept{
      MemoryAllocator::mem_free(el);
    }
    void *operator new[](size_t size){
      return MemoryAllocator::mem_alloc((size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    }
    void operator delete[](void* el) noexcept{
       MemoryAllocator::mem_free(el);
    }

    //destruktor
    ~TCB(){
      MemoryAllocator::mem_free(stack);
    }

	//konstruktor
	explicit TCB(Body body, void* arg, uint64* stack_space) :
		body(body),
		finished(false),
		blocked(false)
	{
        stack = stack_space != nullptr ? stack_space : nullptr;
        context.ra = (uint64)&wrapper; //postavi wrapper kao pocetnu tacku
        context.sp = (uint64)&stack[DEFAULT_STACK_SIZE/sizeof(uint64)];
        this->arg = arg;
        if(body != nullptr) {Scheduler::put(this);}
    }

	//getteri i setteri
    bool isFinished() const{ return finished; }
    void setFinished(bool value){ finished = value; }

    bool isBlocked() const{ return blocked; }
    void setBlocked(bool value){ blocked = value; }

	static bool isBodyNull(){return running->body == nullptr;}

    static TCB *createThread(Body body, void *arg, uint64* stack_space);

    static TCB *running;
    static void wrapper(void*);
    static void yield();
    static void dispatch();
	static int exit();

private:
    struct Context{
        uint64 ra; //gde korutina treba da se vrati, return address(X1)
        uint64 sp; // X2
    };
    Body body;
    void *arg;
    uint64 *stack;
    Context context;
    bool finished;
    bool blocked;

    static void contextSwitch(Context *oldContext, Context *newContext);
};


#endif //TCB_H
