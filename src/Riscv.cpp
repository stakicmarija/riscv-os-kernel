#include "../h/Riscv.hpp"

void Riscv::popSppSpie(){
    if (TCB::isBodyNull()) //da li je kernel nit
        ms_sstatus(SSTATUS_SPP); //supervisor mod, 1
    else
        mc_sstatus(SSTATUS_SPP); //user mod, 0
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();
    if(scause == ECALL_USER || scause == ECALL_SUPERVISOR) {
        uint64 volatile code;
        __asm__ volatile("mv %0, a0": "=r"(code));

        uint64 volatile sepc = r_sepc() + 4;
        uint64 volatile sstatus = r_sstatus();

        switch(code) {
            //mem_alloc
            case 0x01: {
                size_t size;
                __asm__ volatile("mv %0, a1": "=r"(size));
                void* mem = MemoryAllocator::mem_alloc(size);
                __asm__ volatile("mv a0, %0":: "r"(mem));
                __asm__ volatile("sd a0, 80(s0)");
                //s0 frame pointer, oblast steka od koje pocinje aktivacioni blok
                break;
            }
            //mem_free
            case 0x02: {
                void* addr;
                __asm__ volatile("mv %0, a1": "=r"(addr));
                uint64 result = (uint64)MemoryAllocator::mem_free(addr);
                __asm__ volatile("mv a0, %0":: "r"(result));
                break;
            }
            //thread_create
            case 0x11: {
                thread_t* handle;
                TCB::Body start_routine;
                void* args;
                uint64* stack_space;

                __asm__ volatile("mv %0, a1": "=r"(handle));
                __asm__ volatile("mv %0, a2": "=r"(start_routine));
                __asm__ volatile("mv %0, a3": "=r"(args));
                __asm__ volatile("mv %0, a7": "=r"(stack_space));

                *handle = TCB::createThread(start_routine, args, stack_space);
                __asm__ volatile("mv a0, %0":: "r"(handle));
                break;
            }
            //thread_exit
            case 0x12: {
                int result = TCB::exit();
                __asm__ volatile("mv a0, %0":: "r"(result));
                break;
            }
            //thread_dispatch
            case 0x13: {
                TCB::dispatch();
                break;
            }
            //sem_open
            case 0x21: {
                SemaphoreC** handle;
                unsigned init;
                __asm__ volatile("mv %0, a1": "=r"(handle));
                __asm__ volatile("mv %0, a2": "=r"(init));

                if(SemaphoreC::createSem(handle, init)){
                    __asm__ volatile("li a0, 0");
                }
                else __asm__ volatile("li a0, -1");
                break;
            }
            //sem_close
            case 0x22: {
                sem_t s;
                __asm__ volatile("mv %0, a1": "=r"(s));
                int result = s->close();
                delete s;
                __asm__ volatile("mv a0, %0":: "r"(result));
                break;
            }
            //sem_wait
            case 0x23: {
                sem_t s;
                __asm__ volatile("mv %0, a1": "=r"(s));
                int result = s->wait();
                __asm__ volatile("mv a0, %0":: "r"(result));
                break;
            }
            //sem_signal
            case 0x24: {
                sem_t s;
                __asm__ volatile("mv %0, a1": "=r"(s));
                int result = s->signal();
                __asm__ volatile("mv a0, %0":: "r"(result));
                break;
            }
            //sem_trywait
            case 0x26: {
                sem_t s;
                __asm__ volatile("mv %0, a1": "=r"(s));
                int result = s->tryWait();
                __asm__ volatile("mv a0, %0":: "r"(result));
                break;
            }
            //getc
            case 0x41: {
                char c = __getc();
                __asm__ volatile("mv a0, %0"::"r"(c));
                __asm__ volatile("sd a0, 80(s0)");
                break;
            }
            //putc
            case 0x42: {
                char c;
                __asm__ volatile("mv %0, a1": "=r"(c));
                __putc(c);
                break;
            }
            default: break;
        }
        w_sepc(sepc);
        w_sstatus(sstatus);
    }
    else if(scause == CONSOLE_RISCV){
       console_handler();
    }
    else if(scause == TIMER){
        mc_sip(SIP_SSIP); //potvrda da smo primili prekid, brisemo zahtev za prekid, obradio se
    }
    else if(scause == LOAD_ACCESS_FAULT){
        printString("Nedozvoljena adresa upisa");
        while (true);
    }
    else if(scause == STORE_ACCESS_FAULT){
         printString("Nedozvoljena adresa citanja");
        while (true);
    }
    else if(scause == ILLEGAL_INSTRUCTION) {
         printString("Ilegalna instrukcija");
        while (true);
    }
    else{ //nepoznat prekid
         printString("Neobradjena greska \n");
         printString("SCAUSE ");
         printInt((int)scause);
		 printString("\n");
    }
}