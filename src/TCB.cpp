#include "../h/TCB.hpp"

extern "C" void pushRegisters(); //da ne vrsi name mangling
extern "C" void popRegisters();

TCB *TCB::running = nullptr;

void TCB::wrapper(void* b) { //pocetna funkcija koju izvrsava svaka nit nakon sto je kreirana
    Riscv::popSppSpie(); //prelazi u odg mod
    running->body(running->arg); //izvrsava se kod niti
    thread_exit(); //zavrsetak niti, kernel preuzima kontrolu, u sebi sistemski poziv za gašenje niti
}

TCB *TCB::createThread(TCB::Body body, void *arg, uint64 *stack_space) {
    return new TCB(body, arg, stack_space);
}

void TCB::yield() {
  //  pushRegisters();
    __asm__ volatile ("mv a0, %0":: "r"(0x13)); //thread_dispatch
    __asm__ volatile ("ecall");
   // popRegisters();
}

void TCB::dispatch() { //trenutno izvrsavanu korutinu zameni nekom drugom
    TCB *old = running;
    if(!old->isFinished() && !old->isBlocked()) {
        Scheduler::put(old);
    }
    running = Scheduler::get();
    if(running != nullptr && running != old) TCB::contextSwitch(&old->context, &running->context);
}

int TCB::exit(){
    if(!TCB::running->isFinished()) {
        TCB::running->setFinished(true);
        TCB::dispatch();
        return 0;
    }else return -1;
}


