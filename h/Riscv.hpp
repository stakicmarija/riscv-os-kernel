#ifndef RISCV_H
#define RISCV_H

#include "../lib/hw.h"
#include "MemoryAllocator.hpp"
#include "TCB.hpp"
#include "SemaphoreC.hpp"
#include "../lib/console.h"
#include "../test/printing.hpp"


enum Interrupts{ // BNT | vrednost
    ECALL_USER = 0x00UL  | 0x08, //ecall iz korisnickog rezima 0000000000000008
    ECALL_SUPERVISOR = 0x00UL  | 0x09, //ecall iz sistemskog rezima 0000000000000009
    ILLEGAL_INSTRUCTION = 0x00UL  | 0x02, //ilegalna instrukcija
    STORE_ACCESS_FAULT = 0x00UL  | 0x05, //nedozvoljena adresa citanja
    LOAD_ACCESS_FAULT = 0x00UL  | 0x07, //nedozvoljena adresa upisa
    TIMER = 0x01UL << 63 | 0x1,
    CONSOLE_RISCV = 0x01UL << 63 | 0x9
 };


class Riscv {
public:

  static void handleSupervisorTrap();
  static void supervisorTrap();
  static void popSppSpie();

//opis razloga prelaska u sistemski rezim
  static uint64 r_scause();
  static void w_scause(uint64 scause);

//sacuvana vrednost registra pc u korisnickom rezimu
  static uint64 r_sepc();
  static void w_sepc(uint64 sepc);

//adresa prekinute rutine poravnata na 4 bajta
  static uint64 r_stvec();
  static void w_stvec(uint64 stvec);

//supervison trap value
  static uint64 r_stval();
  static void w_stval(uint64 stval);

//sip supervisor interupt pending
//sie supervisor interupt enable

  enum BitMaskSstatus{
    SSTATUS_SPP=(1UL<<8),
    SSTATUS_SIE=(1UL<<1),
    SSTATUS_SPIE=(1UL<<5)
  };

  enum BitMaskSip: uint64 {
    SIP_SSIP=(1UL<<1),
    SIP_SEIP=(1UL<<9)
  };

  static void ms_sip(uint64 mask); //mask set
  static void mc_sip(uint64 mask); //mask clear
  static uint64 r_sip(); //read
  static void w_sip(uint64 sip); //write

  static void ms_sstatus(uint64 mask);
  static void mc_sstatus(uint64 mask);
  static uint64 r_sstatus();
  static void w_sstatus(uint64 sip);

};

inline uint64 Riscv::r_scause(){
  uint64 volatile scause;
  __asm__ volatile("csrr %[scause], scause" : [scause] "=r" (scause));
  return scause;
}

inline void Riscv::w_scause(uint64 scause){
  __asm__ volatile("csrw scause, %[scause]" : : [scause] "r" (scause));
}

inline uint64 Riscv::r_sepc(){
  uint64 volatile sepc;
  __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
  return sepc;
}

inline void Riscv::w_sepc(uint64 sepc){
  __asm__ volatile("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
}

inline uint64 Riscv::r_stvec(){
  uint64 volatile stvec;
  __asm__ volatile("csrr %[stvec], stvec" : [stvec] "=r" (stvec));
  return stvec;
}

inline void Riscv::w_stvec(uint64 stvec){
  __asm__ volatile("csrw stvec, %[stvec]" : : [stvec] "r" (stvec));
}

inline uint64 Riscv::r_stval(){
  uint64 volatile stval;
  __asm__ volatile("csrr %[stval], stval" : [stval] "=r" (stval));
  return stval;
}

inline void Riscv::w_stval(uint64 stval){
  __asm__ volatile("csrw stval, %[stval]" : : [stval] "r" (stval));
}

inline void Riscv::ms_sip(uint64 mask){
  __asm__ volatile("csrs sip, %[mask]" : : [mask] "r" (mask));
}

inline void Riscv::mc_sip(uint64 mask){
  __asm__ volatile("csrc sip, %[mask]" : : [mask] "r" (mask));
 }

inline uint64 Riscv::r_sip(){
  uint64 volatile sip;
  __asm__ volatile("csrr %[sip], sip" : [sip] "=r" (sip));
  return sip;
}

inline void Riscv::w_sip(uint64 sip){
  __asm__ volatile("csrw sip, %[sip]" : : [sip] "r" (sip));
}

inline void Riscv::ms_sstatus(uint64 mask){
  __asm__ volatile("csrs sstatus, %[mask]" : : [mask] "r" (mask));
}

inline void Riscv::mc_sstatus(uint64 mask){
  __asm__ volatile("csrc sstatus, %[mask]" : : [mask] "r" (mask));
}

inline uint64 Riscv::r_sstatus(){
  uint64 volatile sstatus;
  __asm__ volatile("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
  return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus){
  __asm__ volatile("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
}


#endif //RISCV_H
