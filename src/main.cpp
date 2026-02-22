#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_cpp.hpp"

extern void userMain();

void userWrapper(void*){ //thread_create ocekuje funkciju tipa void (*)(void*)
    userMain();
}

int main(){ //supervisor
	MemoryAllocator::init();
    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);  //postavljanje trap handler-a, stvec adresa prekidne rutine

    TCB* idleThread = new TCB(nullptr, nullptr, nullptr); //kernel nit, nema telo, uvek spremna
	TCB::running = idleThread; //postavlja se kao tekuca nit

	TCB* userThread = nullptr; //priprema za korisnicki main
    thread_create(&userThread, &userWrapper, nullptr); //kreiranje niti za korisnicki kod

    while(!(userThread->isFinished())) { //dok se user main ne zavsrsi
        thread_dispatch();   //scheduler uzima userThread iz reda
    }
    return 0;
}