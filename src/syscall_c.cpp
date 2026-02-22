#include "../h/syscall_c.hpp"

void* mem_alloc(size_t size){ //prima bajtove
    if(!size) return nullptr;
    size_t sz = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE; //C API-a treba da zadatu vrednost u bajtovima zaokruži na cele blokove
    __asm__ volatile("mv a1, %0":: "r"(sz));
    __asm__ volatile("mv a0, %0":: "r"(0x01));

    __asm__ volatile("ecall"); //prelazak u sys rezim
    uint64* result;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return result;
}

int mem_free(void* addr){
    __asm__ volatile("mv a1, %0":: "r"(addr));
    __asm__ volatile("mv a0, %0":: "r"(0x02));

    __asm__ volatile("ecall");
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return result;
}

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    TCB** result = handle;
    uint64* stack_space = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);  //thread_create iz C API-a treba najpre da alocira stek
    __asm__ volatile("mv a7, %0":: "r"(stack_space));
    __asm__ volatile("mv a3, %0":: "r"(arg));
    __asm__ volatile("mv a2, %0":: "r"(start_routine));
    __asm__ volatile("mv a1, %0":: "r"(handle));
    __asm__ volatile("mv a0, %0":: "r"(0x11));

    __asm__ volatile("ecall");

    __asm__ volatile("mv %0, a0": "=r"(result));
    if(!result) return -1;
    return 0;
}

int thread_exit (){
    __asm__ volatile("mv a0, %0":: "r"(0x12));

    __asm__ volatile("ecall");
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return (int)result;
}

void thread_dispatch (){
    __asm__ volatile("mv a0, %0":: "r"(0x13));
    __asm__ volatile("ecall");
}

int sem_open (sem_t* handle, unsigned init){
    __asm__ volatile("mv a2, %0":: "r"(init));
    __asm__ volatile("mv a1, %0":: "r"(handle));
    __asm__ volatile("mv a0, %0":: "r"(0x21));

    __asm__ volatile("ecall");
    uint64 result;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return (int)result;
}

int sem_close (sem_t handle){
    __asm__ volatile("mv a1, %0":: "r"(handle)) ;
    __asm__ volatile("mv a0, %0":: "r"(0x22));

    __asm__ volatile("ecall");
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return (int)result;
}

int sem_wait (sem_t id){
    __asm__ volatile("mv a1, %0":: "r"(id)) ;
    __asm__ volatile("mv a0, %0":: "r"(0x23));

    __asm__ volatile("ecall");
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return (int)result;
}

int sem_signal (sem_t id){
    __asm__ volatile("mv a1, %0":: "r"(id)) ;
    __asm__ volatile("mv a0, %0":: "r"(0x24));

    __asm__ volatile("ecall");
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return (int)result;
}

int sem_timedwait (sem_t id, time_t timeout){ return -3;}

int sem_trywait (sem_t id){
    __asm__ volatile("mv a1, %0":: "r"(id)) ;
    __asm__ volatile("mv a0, %0":: "r"(0x26));

    __asm__ volatile("ecall");
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return (int)result;
}

int time_sleep (time_t){ return -1;}

char getc(){
    __asm__ volatile("mv a0, %0":: "r"(0x41));

    __asm__ volatile("ecall");
    char result;
    __asm__ volatile("mv %0, a0": "=r"(result));
    return result;
}

void putc(char c){
    __asm__ volatile("mv a1, %0":: "r"(c));
    __asm__ volatile("mv a0, %0":: "r"(0x42));

    __asm__ volatile("ecall");
}
