
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	17013103          	ld	sp,368(sp) # 8000a170 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4a4050ef          	jal	ra,800054c0 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <pushRegisters>:
.global pushRegisters
.type pushRegisters, @function
pushRegisters:
    addi sp, sp, -256 //alociran prostor na steku
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 //makro direktiva za ponavljanje bloka koda za svaki element u listi
    sd x\index, \index * 8(sp) //store doubleword na adresu ukazanu sp
    .endr
    80001004:	00313c23          	sd	gp,24(sp)
    80001008:	02413023          	sd	tp,32(sp)
    8000100c:	02513423          	sd	t0,40(sp)
    80001010:	02613823          	sd	t1,48(sp)
    80001014:	02713c23          	sd	t2,56(sp)
    80001018:	04813023          	sd	s0,64(sp)
    8000101c:	04913423          	sd	s1,72(sp)
    80001020:	04a13823          	sd	a0,80(sp)
    80001024:	04b13c23          	sd	a1,88(sp)
    80001028:	06c13023          	sd	a2,96(sp)
    8000102c:	06d13423          	sd	a3,104(sp)
    80001030:	06e13823          	sd	a4,112(sp)
    80001034:	06f13c23          	sd	a5,120(sp)
    80001038:	09013023          	sd	a6,128(sp)
    8000103c:	09113423          	sd	a7,136(sp)
    80001040:	09213823          	sd	s2,144(sp)
    80001044:	09313c23          	sd	s3,152(sp)
    80001048:	0b413023          	sd	s4,160(sp)
    8000104c:	0b513423          	sd	s5,168(sp)
    80001050:	0b613823          	sd	s6,176(sp)
    80001054:	0b713c23          	sd	s7,184(sp)
    80001058:	0d813023          	sd	s8,192(sp)
    8000105c:	0d913423          	sd	s9,200(sp)
    80001060:	0da13823          	sd	s10,208(sp)
    80001064:	0db13c23          	sd	s11,216(sp)
    80001068:	0fc13023          	sd	t3,224(sp)
    8000106c:	0fd13423          	sd	t4,232(sp)
    80001070:	0fe13823          	sd	t5,240(sp)
    80001074:	0ff13c23          	sd	t6,248(sp)
    ret
    80001078:	00008067          	ret

000000008000107c <popRegisters>:
.global popRegisters
.type popRegisters, @function
popRegisters:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 //makro direktiva za ponavljanje bloka koda za svaki element u listi
    ld x\index, \index * 8(sp) //load doubleword na adresu ukazanu sp
    .endr
    8000107c:	01813183          	ld	gp,24(sp)
    80001080:	02013203          	ld	tp,32(sp)
    80001084:	02813283          	ld	t0,40(sp)
    80001088:	03013303          	ld	t1,48(sp)
    8000108c:	03813383          	ld	t2,56(sp)
    80001090:	04013403          	ld	s0,64(sp)
    80001094:	04813483          	ld	s1,72(sp)
    80001098:	05013503          	ld	a0,80(sp)
    8000109c:	05813583          	ld	a1,88(sp)
    800010a0:	06013603          	ld	a2,96(sp)
    800010a4:	06813683          	ld	a3,104(sp)
    800010a8:	07013703          	ld	a4,112(sp)
    800010ac:	07813783          	ld	a5,120(sp)
    800010b0:	08013803          	ld	a6,128(sp)
    800010b4:	08813883          	ld	a7,136(sp)
    800010b8:	09013903          	ld	s2,144(sp)
    800010bc:	09813983          	ld	s3,152(sp)
    800010c0:	0a013a03          	ld	s4,160(sp)
    800010c4:	0a813a83          	ld	s5,168(sp)
    800010c8:	0b013b03          	ld	s6,176(sp)
    800010cc:	0b813b83          	ld	s7,184(sp)
    800010d0:	0c013c03          	ld	s8,192(sp)
    800010d4:	0c813c83          	ld	s9,200(sp)
    800010d8:	0d013d03          	ld	s10,208(sp)
    800010dc:	0d813d83          	ld	s11,216(sp)
    800010e0:	0e013e03          	ld	t3,224(sp)
    800010e4:	0e813e83          	ld	t4,232(sp)
    800010e8:	0f013f03          	ld	t5,240(sp)
    800010ec:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    800010f0:	10010113          	addi	sp,sp,256
    800010f4:	00008067          	ret
	...

0000000080001100 <_ZN5Riscv14supervisorTrapEv>:

.align 4 //adr prekidne rutine poravnata na 4B
.global _ZN5Riscv14supervisorTrapEv //da bude vidljivo spolja
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:
    addi sp, sp, -256 //alokacija steka
    80001100:	f0010113          	addi	sp,sp,-256

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 //makro direktiva za ponavljanje bloka koda za svaki element u listi
    sd x\index, \index * 8(sp) //store doubleword na adresu ukazanu sp
    .endr
    80001104:	00013023          	sd	zero,0(sp)
    80001108:	00113423          	sd	ra,8(sp)
    8000110c:	00213823          	sd	sp,16(sp)
    80001110:	00313c23          	sd	gp,24(sp)
    80001114:	02413023          	sd	tp,32(sp)
    80001118:	02513423          	sd	t0,40(sp)
    8000111c:	02613823          	sd	t1,48(sp)
    80001120:	02713c23          	sd	t2,56(sp)
    80001124:	04813023          	sd	s0,64(sp)
    80001128:	04913423          	sd	s1,72(sp)
    8000112c:	04a13823          	sd	a0,80(sp)
    80001130:	04b13c23          	sd	a1,88(sp)
    80001134:	06c13023          	sd	a2,96(sp)
    80001138:	06d13423          	sd	a3,104(sp)
    8000113c:	06e13823          	sd	a4,112(sp)
    80001140:	06f13c23          	sd	a5,120(sp)
    80001144:	09013023          	sd	a6,128(sp)
    80001148:	09113423          	sd	a7,136(sp)
    8000114c:	09213823          	sd	s2,144(sp)
    80001150:	09313c23          	sd	s3,152(sp)
    80001154:	0b413023          	sd	s4,160(sp)
    80001158:	0b513423          	sd	s5,168(sp)
    8000115c:	0b613823          	sd	s6,176(sp)
    80001160:	0b713c23          	sd	s7,184(sp)
    80001164:	0d813023          	sd	s8,192(sp)
    80001168:	0d913423          	sd	s9,200(sp)
    8000116c:	0da13823          	sd	s10,208(sp)
    80001170:	0db13c23          	sd	s11,216(sp)
    80001174:	0fc13023          	sd	t3,224(sp)
    80001178:	0fd13423          	sd	t4,232(sp)
    8000117c:	0fe13823          	sd	t5,240(sp)
    80001180:	0ff13c23          	sd	t6,248(sp)


    call _ZN5Riscv20handleSupervisorTrapEv
    80001184:	4d1000ef          	jal	ra,80001e54 <_ZN5Riscv20handleSupervisorTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp) //load doubleword, ucitavamo ih nazad u registre
    .endr
    80001188:	00013003          	ld	zero,0(sp)
    8000118c:	00813083          	ld	ra,8(sp)
    80001190:	01013103          	ld	sp,16(sp)
    80001194:	01813183          	ld	gp,24(sp)
    80001198:	02013203          	ld	tp,32(sp)
    8000119c:	02813283          	ld	t0,40(sp)
    800011a0:	03013303          	ld	t1,48(sp)
    800011a4:	03813383          	ld	t2,56(sp)
    800011a8:	04013403          	ld	s0,64(sp)
    800011ac:	04813483          	ld	s1,72(sp)
    800011b0:	05013503          	ld	a0,80(sp)
    800011b4:	05813583          	ld	a1,88(sp)
    800011b8:	06013603          	ld	a2,96(sp)
    800011bc:	06813683          	ld	a3,104(sp)
    800011c0:	07013703          	ld	a4,112(sp)
    800011c4:	07813783          	ld	a5,120(sp)
    800011c8:	08013803          	ld	a6,128(sp)
    800011cc:	08813883          	ld	a7,136(sp)
    800011d0:	09013903          	ld	s2,144(sp)
    800011d4:	09813983          	ld	s3,152(sp)
    800011d8:	0a013a03          	ld	s4,160(sp)
    800011dc:	0a813a83          	ld	s5,168(sp)
    800011e0:	0b013b03          	ld	s6,176(sp)
    800011e4:	0b813b83          	ld	s7,184(sp)
    800011e8:	0c013c03          	ld	s8,192(sp)
    800011ec:	0c813c83          	ld	s9,200(sp)
    800011f0:	0d013d03          	ld	s10,208(sp)
    800011f4:	0d813d83          	ld	s11,216(sp)
    800011f8:	0e013e03          	ld	t3,224(sp)
    800011fc:	0e813e83          	ld	t4,232(sp)
    80001200:	0f013f03          	ld	t5,240(sp)
    80001204:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256 //oslobodimo prostor
    80001208:	10010113          	addi	sp,sp,256

    8000120c:	10200073          	sret

0000000080001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    //a0 - &old->context
    //a1 - &running->context

    sd ra, 0 * 8(a0) //cuvam stari
    80001210:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001214:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1) //loadujem novi
    80001218:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000121c:	0085b103          	ld	sp,8(a1)

    80001220:	00008067          	ret

0000000080001224 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001224:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001228:	00b29a63          	bne	t0,a1,8000123c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000122c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001230:	fe029ae3          	bnez	t0,80001224 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001234:	00000513          	li	a0,0
    jr ra                  # Return.
    80001238:	00008067          	ret

000000008000123c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000123c:	00100513          	li	a0,1
    80001240:	00008067          	ret

0000000080001244 <_Z9mem_allocm>:
#include "../h/syscall_c.hpp"

void* mem_alloc(size_t size){ //prima bajtove
    80001244:	ff010113          	addi	sp,sp,-16
    80001248:	00813423          	sd	s0,8(sp)
    8000124c:	01010413          	addi	s0,sp,16
    if(!size) return nullptr;
    80001250:	02050663          	beqz	a0,8000127c <_Z9mem_allocm+0x38>
    size_t sz = (size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE; //C API-a treba da zadatu vrednost u bajtovima zaokruži na cele blokove
    80001254:	03f50513          	addi	a0,a0,63
    80001258:	00655513          	srli	a0,a0,0x6
    __asm__ volatile("mv a1, %0":: "r"(sz));
    8000125c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x01));
    80001260:	00100793          	li	a5,1
    80001264:	00078513          	mv	a0,a5

    __asm__ volatile("ecall"); //prelazak u sys rezim
    80001268:	00000073          	ecall
    uint64* result;
    __asm__ volatile("mv %0, a0": "=r"(result));
    8000126c:	00050513          	mv	a0,a0
    return result;
}
    80001270:	00813403          	ld	s0,8(sp)
    80001274:	01010113          	addi	sp,sp,16
    80001278:	00008067          	ret
    if(!size) return nullptr;
    8000127c:	00000513          	li	a0,0
    80001280:	ff1ff06f          	j	80001270 <_Z9mem_allocm+0x2c>

0000000080001284 <_Z8mem_freePv>:

int mem_free(void* addr){
    80001284:	ff010113          	addi	sp,sp,-16
    80001288:	00813423          	sd	s0,8(sp)
    8000128c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0":: "r"(addr));
    80001290:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x02));
    80001294:	00200793          	li	a5,2
    80001298:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    8000129c:	00000073          	ecall
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    800012a0:	00050513          	mv	a0,a0
    return result;
}
    800012a4:	0005051b          	sext.w	a0,a0
    800012a8:	00813403          	ld	s0,8(sp)
    800012ac:	01010113          	addi	sp,sp,16
    800012b0:	00008067          	ret

00000000800012b4 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    800012b4:	fd010113          	addi	sp,sp,-48
    800012b8:	02113423          	sd	ra,40(sp)
    800012bc:	02813023          	sd	s0,32(sp)
    800012c0:	00913c23          	sd	s1,24(sp)
    800012c4:	01213823          	sd	s2,16(sp)
    800012c8:	01313423          	sd	s3,8(sp)
    800012cc:	03010413          	addi	s0,sp,48
    800012d0:	00050493          	mv	s1,a0
    800012d4:	00058913          	mv	s2,a1
    800012d8:	00060993          	mv	s3,a2
    TCB** result = handle;
    uint64* stack_space = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);  //thread_create iz C API-a treba najpre da alocira stek
    800012dc:	00001537          	lui	a0,0x1
    800012e0:	00000097          	auipc	ra,0x0
    800012e4:	f64080e7          	jalr	-156(ra) # 80001244 <_Z9mem_allocm>
    __asm__ volatile("mv a7, %0":: "r"(stack_space));
    800012e8:	00050893          	mv	a7,a0
    __asm__ volatile("mv a3, %0":: "r"(arg));
    800012ec:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %0":: "r"(start_routine));
    800012f0:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %0":: "r"(handle));
    800012f4:	00048593          	mv	a1,s1
    __asm__ volatile("mv a0, %0":: "r"(0x11));
    800012f8:	01100793          	li	a5,17
    800012fc:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001300:	00000073          	ecall

    __asm__ volatile("mv %0, a0": "=r"(result));
    80001304:	00050793          	mv	a5,a0
    if(!result) return -1;
    80001308:	02078263          	beqz	a5,8000132c <_Z13thread_createPP3TCBPFvPvES2_+0x78>
    return 0;
    8000130c:	00000513          	li	a0,0
}
    80001310:	02813083          	ld	ra,40(sp)
    80001314:	02013403          	ld	s0,32(sp)
    80001318:	01813483          	ld	s1,24(sp)
    8000131c:	01013903          	ld	s2,16(sp)
    80001320:	00813983          	ld	s3,8(sp)
    80001324:	03010113          	addi	sp,sp,48
    80001328:	00008067          	ret
    if(!result) return -1;
    8000132c:	fff00513          	li	a0,-1
    80001330:	fe1ff06f          	j	80001310 <_Z13thread_createPP3TCBPFvPvES2_+0x5c>

0000000080001334 <_Z11thread_exitv>:

int thread_exit (){
    80001334:	ff010113          	addi	sp,sp,-16
    80001338:	00813423          	sd	s0,8(sp)
    8000133c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0":: "r"(0x12));
    80001340:	01200793          	li	a5,18
    80001344:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001348:	00000073          	ecall
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    8000134c:	00050513          	mv	a0,a0
    return (int)result;
}
    80001350:	0005051b          	sext.w	a0,a0
    80001354:	00813403          	ld	s0,8(sp)
    80001358:	01010113          	addi	sp,sp,16
    8000135c:	00008067          	ret

0000000080001360 <_Z15thread_dispatchv>:

void thread_dispatch (){
    80001360:	ff010113          	addi	sp,sp,-16
    80001364:	00813423          	sd	s0,8(sp)
    80001368:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0":: "r"(0x13));
    8000136c:	01300793          	li	a5,19
    80001370:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001374:	00000073          	ecall
}
    80001378:	00813403          	ld	s0,8(sp)
    8000137c:	01010113          	addi	sp,sp,16
    80001380:	00008067          	ret

0000000080001384 <_Z8sem_openPP10SemaphoreCj>:

int sem_open (sem_t* handle, unsigned init){
    80001384:	ff010113          	addi	sp,sp,-16
    80001388:	00813423          	sd	s0,8(sp)
    8000138c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0":: "r"(init));
    80001390:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0":: "r"(handle));
    80001394:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x21));
    80001398:	02100793          	li	a5,33
    8000139c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800013a0:	00000073          	ecall
    uint64 result;
    __asm__ volatile("mv %0, a0": "=r"(result));
    800013a4:	00050513          	mv	a0,a0
    return (int)result;
}
    800013a8:	0005051b          	sext.w	a0,a0
    800013ac:	00813403          	ld	s0,8(sp)
    800013b0:	01010113          	addi	sp,sp,16
    800013b4:	00008067          	ret

00000000800013b8 <_Z9sem_closeP10SemaphoreC>:

int sem_close (sem_t handle){
    800013b8:	ff010113          	addi	sp,sp,-16
    800013bc:	00813423          	sd	s0,8(sp)
    800013c0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0":: "r"(handle)) ;
    800013c4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x22));
    800013c8:	02200793          	li	a5,34
    800013cc:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800013d0:	00000073          	ecall
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    800013d4:	00050513          	mv	a0,a0
    return (int)result;
}
    800013d8:	0005051b          	sext.w	a0,a0
    800013dc:	00813403          	ld	s0,8(sp)
    800013e0:	01010113          	addi	sp,sp,16
    800013e4:	00008067          	ret

00000000800013e8 <_Z8sem_waitP10SemaphoreC>:

int sem_wait (sem_t id){
    800013e8:	ff010113          	addi	sp,sp,-16
    800013ec:	00813423          	sd	s0,8(sp)
    800013f0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0":: "r"(id)) ;
    800013f4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x23));
    800013f8:	02300793          	li	a5,35
    800013fc:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001400:	00000073          	ecall
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    80001404:	00050513          	mv	a0,a0
    return (int)result;
}
    80001408:	0005051b          	sext.w	a0,a0
    8000140c:	00813403          	ld	s0,8(sp)
    80001410:	01010113          	addi	sp,sp,16
    80001414:	00008067          	ret

0000000080001418 <_Z10sem_signalP10SemaphoreC>:

int sem_signal (sem_t id){
    80001418:	ff010113          	addi	sp,sp,-16
    8000141c:	00813423          	sd	s0,8(sp)
    80001420:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0":: "r"(id)) ;
    80001424:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x24));
    80001428:	02400793          	li	a5,36
    8000142c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001430:	00000073          	ecall
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    80001434:	00050513          	mv	a0,a0
    return (int)result;
}
    80001438:	0005051b          	sext.w	a0,a0
    8000143c:	00813403          	ld	s0,8(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <_Z13sem_timedwaitP10SemaphoreCm>:

int sem_timedwait (sem_t id, time_t timeout){ return -3;}
    80001448:	ff010113          	addi	sp,sp,-16
    8000144c:	00813423          	sd	s0,8(sp)
    80001450:	01010413          	addi	s0,sp,16
    80001454:	ffd00513          	li	a0,-3
    80001458:	00813403          	ld	s0,8(sp)
    8000145c:	01010113          	addi	sp,sp,16
    80001460:	00008067          	ret

0000000080001464 <_Z11sem_trywaitP10SemaphoreC>:

int sem_trywait (sem_t id){
    80001464:	ff010113          	addi	sp,sp,-16
    80001468:	00813423          	sd	s0,8(sp)
    8000146c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0":: "r"(id)) ;
    80001470:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x26));
    80001474:	02600793          	li	a5,38
    80001478:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    8000147c:	00000073          	ecall
    uint64 result = 0;
    __asm__ volatile("mv %0, a0": "=r"(result));
    80001480:	00050513          	mv	a0,a0
    return (int)result;
}
    80001484:	0005051b          	sext.w	a0,a0
    80001488:	00813403          	ld	s0,8(sp)
    8000148c:	01010113          	addi	sp,sp,16
    80001490:	00008067          	ret

0000000080001494 <_Z10time_sleepm>:

int time_sleep (time_t){ return -1;}
    80001494:	ff010113          	addi	sp,sp,-16
    80001498:	00813423          	sd	s0,8(sp)
    8000149c:	01010413          	addi	s0,sp,16
    800014a0:	fff00513          	li	a0,-1
    800014a4:	00813403          	ld	s0,8(sp)
    800014a8:	01010113          	addi	sp,sp,16
    800014ac:	00008067          	ret

00000000800014b0 <_Z4getcv>:

char getc(){
    800014b0:	ff010113          	addi	sp,sp,-16
    800014b4:	00813423          	sd	s0,8(sp)
    800014b8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0":: "r"(0x41));
    800014bc:	04100793          	li	a5,65
    800014c0:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800014c4:	00000073          	ecall
    char result;
    __asm__ volatile("mv %0, a0": "=r"(result));
    800014c8:	00050513          	mv	a0,a0
    return result;
}
    800014cc:	0ff57513          	andi	a0,a0,255
    800014d0:	00813403          	ld	s0,8(sp)
    800014d4:	01010113          	addi	sp,sp,16
    800014d8:	00008067          	ret

00000000800014dc <_Z4putcc>:

void putc(char c){
    800014dc:	ff010113          	addi	sp,sp,-16
    800014e0:	00813423          	sd	s0,8(sp)
    800014e4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0":: "r"(c));
    800014e8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0":: "r"(0x42));
    800014ec:	04200793          	li	a5,66
    800014f0:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800014f4:	00000073          	ecall
}
    800014f8:	00813403          	ld	s0,8(sp)
    800014fc:	01010113          	addi	sp,sp,16
    80001500:	00008067          	ret

0000000080001504 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"

#endif

void userMain() {
    80001504:	fe010113          	addi	sp,sp,-32
    80001508:	00113c23          	sd	ra,24(sp)
    8000150c:	00813823          	sd	s0,16(sp)
    80001510:	00913423          	sd	s1,8(sp)
    80001514:	01213023          	sd	s2,0(sp)
    80001518:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    8000151c:	00007517          	auipc	a0,0x7
    80001520:	b0450513          	addi	a0,a0,-1276 # 80008020 <CONSOLE_STATUS+0x10>
    80001524:	00003097          	auipc	ra,0x3
    80001528:	fcc080e7          	jalr	-52(ra) # 800044f0 <_Z11printStringPKc>
    int test = getc() - '0';
    8000152c:	00000097          	auipc	ra,0x0
    80001530:	f84080e7          	jalr	-124(ra) # 800014b0 <_Z4getcv>
    80001534:	00050913          	mv	s2,a0
    80001538:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    8000153c:	00000097          	auipc	ra,0x0
    80001540:	f74080e7          	jalr	-140(ra) # 800014b0 <_Z4getcv>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    80001544:	fcb9091b          	addiw	s2,s2,-53
    80001548:	00100793          	li	a5,1
    8000154c:	0327f463          	bgeu	a5,s2,80001574 <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80001550:	00700793          	li	a5,7
    80001554:	0e97e263          	bltu	a5,s1,80001638 <_Z8userMainv+0x134>
    80001558:	00249493          	slli	s1,s1,0x2
    8000155c:	00007717          	auipc	a4,0x7
    80001560:	cdc70713          	addi	a4,a4,-804 # 80008238 <CONSOLE_STATUS+0x228>
    80001564:	00e484b3          	add	s1,s1,a4
    80001568:	0004a783          	lw	a5,0(s1)
    8000156c:	00e787b3          	add	a5,a5,a4
    80001570:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    80001574:	00007517          	auipc	a0,0x7
    80001578:	acc50513          	addi	a0,a0,-1332 # 80008040 <CONSOLE_STATUS+0x30>
    8000157c:	00003097          	auipc	ra,0x3
    80001580:	f74080e7          	jalr	-140(ra) # 800044f0 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80001584:	01813083          	ld	ra,24(sp)
    80001588:	01013403          	ld	s0,16(sp)
    8000158c:	00813483          	ld	s1,8(sp)
    80001590:	00013903          	ld	s2,0(sp)
    80001594:	02010113          	addi	sp,sp,32
    80001598:	00008067          	ret
            Threads_C_API_test();
    8000159c:	00002097          	auipc	ra,0x2
    800015a0:	5cc080e7          	jalr	1484(ra) # 80003b68 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800015a4:	00007517          	auipc	a0,0x7
    800015a8:	acc50513          	addi	a0,a0,-1332 # 80008070 <CONSOLE_STATUS+0x60>
    800015ac:	00003097          	auipc	ra,0x3
    800015b0:	f44080e7          	jalr	-188(ra) # 800044f0 <_Z11printStringPKc>
            break;
    800015b4:	fd1ff06f          	j	80001584 <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    800015b8:	00002097          	auipc	ra,0x2
    800015bc:	c14080e7          	jalr	-1004(ra) # 800031cc <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800015c0:	00007517          	auipc	a0,0x7
    800015c4:	af050513          	addi	a0,a0,-1296 # 800080b0 <CONSOLE_STATUS+0xa0>
    800015c8:	00003097          	auipc	ra,0x3
    800015cc:	f28080e7          	jalr	-216(ra) # 800044f0 <_Z11printStringPKc>
            break;
    800015d0:	fb5ff06f          	j	80001584 <_Z8userMainv+0x80>
            producerConsumer_C_API();
    800015d4:	00001097          	auipc	ra,0x1
    800015d8:	44c080e7          	jalr	1100(ra) # 80002a20 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800015dc:	00007517          	auipc	a0,0x7
    800015e0:	b1450513          	addi	a0,a0,-1260 # 800080f0 <CONSOLE_STATUS+0xe0>
    800015e4:	00003097          	auipc	ra,0x3
    800015e8:	f0c080e7          	jalr	-244(ra) # 800044f0 <_Z11printStringPKc>
            break;
    800015ec:	f99ff06f          	j	80001584 <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    800015f0:	00003097          	auipc	ra,0x3
    800015f4:	8bc080e7          	jalr	-1860(ra) # 80003eac <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800015f8:	00007517          	auipc	a0,0x7
    800015fc:	b4850513          	addi	a0,a0,-1208 # 80008140 <CONSOLE_STATUS+0x130>
    80001600:	00003097          	auipc	ra,0x3
    80001604:	ef0080e7          	jalr	-272(ra) # 800044f0 <_Z11printStringPKc>
            break;
    80001608:	f7dff06f          	j	80001584 <_Z8userMainv+0x80>
            System_Mode_test();
    8000160c:	00004097          	auipc	ra,0x4
    80001610:	a98080e7          	jalr	-1384(ra) # 800050a4 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80001614:	00007517          	auipc	a0,0x7
    80001618:	b8450513          	addi	a0,a0,-1148 # 80008198 <CONSOLE_STATUS+0x188>
    8000161c:	00003097          	auipc	ra,0x3
    80001620:	ed4080e7          	jalr	-300(ra) # 800044f0 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80001624:	00007517          	auipc	a0,0x7
    80001628:	b9450513          	addi	a0,a0,-1132 # 800081b8 <CONSOLE_STATUS+0x1a8>
    8000162c:	00003097          	auipc	ra,0x3
    80001630:	ec4080e7          	jalr	-316(ra) # 800044f0 <_Z11printStringPKc>
            break;
    80001634:	f51ff06f          	j	80001584 <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    80001638:	00007517          	auipc	a0,0x7
    8000163c:	bd850513          	addi	a0,a0,-1064 # 80008210 <CONSOLE_STATUS+0x200>
    80001640:	00003097          	auipc	ra,0x3
    80001644:	eb0080e7          	jalr	-336(ra) # 800044f0 <_Z11printStringPKc>
    80001648:	f3dff06f          	j	80001584 <_Z8userMainv+0x80>

000000008000164c <_Z41__static_initialization_and_destruction_0ii>:
  threadQueue.addLast(tcb);
}

TCB* Scheduler::get() {
  return threadQueue.removeFirst();
}
    8000164c:	ff010113          	addi	sp,sp,-16
    80001650:	00813423          	sd	s0,8(sp)
    80001654:	01010413          	addi	s0,sp,16
    80001658:	00100793          	li	a5,1
    8000165c:	00f50863          	beq	a0,a5,8000166c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001660:	00813403          	ld	s0,8(sp)
    80001664:	01010113          	addi	sp,sp,16
    80001668:	00008067          	ret
    8000166c:	000107b7          	lui	a5,0x10
    80001670:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001674:	fef596e3          	bne	a1,a5,80001660 <_Z41__static_initialization_and_destruction_0ii+0x14>
      Elem* next;
      Elem(T* data, Elem* next) : data(data), next(next) {}
    };
    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001678:	00009797          	auipc	a5,0x9
    8000167c:	b5878793          	addi	a5,a5,-1192 # 8000a1d0 <_ZN9Scheduler11threadQueueE>
    80001680:	0007b023          	sd	zero,0(a5)
    80001684:	0007b423          	sd	zero,8(a5)
    80001688:	fd9ff06f          	j	80001660 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000168c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    8000168c:	fe010113          	addi	sp,sp,-32
    80001690:	00113c23          	sd	ra,24(sp)
    80001694:	00813823          	sd	s0,16(sp)
    80001698:	00913423          	sd	s1,8(sp)
    8000169c:	02010413          	addi	s0,sp,32
    800016a0:	00050493          	mv	s1,a0
      head = newElem;
      if(!tail) tail = head;
    }

    void addLast(T *data){
      Elem* newElem = new Elem(data, 0);
    800016a4:	01000513          	li	a0,16
    800016a8:	00000097          	auipc	ra,0x0
    800016ac:	23c080e7          	jalr	572(ra) # 800018e4 <_Znwm>
      Elem(T* data, Elem* next) : data(data), next(next) {}
    800016b0:	00953023          	sd	s1,0(a0)
    800016b4:	00053423          	sd	zero,8(a0)
      if(tail){
    800016b8:	00009797          	auipc	a5,0x9
    800016bc:	b207b783          	ld	a5,-1248(a5) # 8000a1d8 <_ZN9Scheduler11threadQueueE+0x8>
    800016c0:	02078263          	beqz	a5,800016e4 <_ZN9Scheduler3putEP3TCB+0x58>
        tail->next = newElem;
    800016c4:	00a7b423          	sd	a0,8(a5)
        tail = newElem;
    800016c8:	00009797          	auipc	a5,0x9
    800016cc:	b0a7b823          	sd	a0,-1264(a5) # 8000a1d8 <_ZN9Scheduler11threadQueueE+0x8>
}
    800016d0:	01813083          	ld	ra,24(sp)
    800016d4:	01013403          	ld	s0,16(sp)
    800016d8:	00813483          	ld	s1,8(sp)
    800016dc:	02010113          	addi	sp,sp,32
    800016e0:	00008067          	ret
      }else head = tail = newElem;
    800016e4:	00009797          	auipc	a5,0x9
    800016e8:	aec78793          	addi	a5,a5,-1300 # 8000a1d0 <_ZN9Scheduler11threadQueueE>
    800016ec:	00a7b423          	sd	a0,8(a5)
    800016f0:	00a7b023          	sd	a0,0(a5)
    800016f4:	fddff06f          	j	800016d0 <_ZN9Scheduler3putEP3TCB+0x44>

00000000800016f8 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() {
    800016f8:	fe010113          	addi	sp,sp,-32
    800016fc:	00113c23          	sd	ra,24(sp)
    80001700:	00813823          	sd	s0,16(sp)
    80001704:	00913423          	sd	s1,8(sp)
    80001708:	02010413          	addi	s0,sp,32
    }

    T* removeFirst(){
      if(!head) return 0;
    8000170c:	00009517          	auipc	a0,0x9
    80001710:	ac453503          	ld	a0,-1340(a0) # 8000a1d0 <_ZN9Scheduler11threadQueueE>
    80001714:	04050263          	beqz	a0,80001758 <_ZN9Scheduler3getEv+0x60>
      Elem *elem = head;
      head = head->next;
    80001718:	00853783          	ld	a5,8(a0)
    8000171c:	00009717          	auipc	a4,0x9
    80001720:	aaf73a23          	sd	a5,-1356(a4) # 8000a1d0 <_ZN9Scheduler11threadQueueE>
      if(!head) tail = 0;
    80001724:	02078463          	beqz	a5,8000174c <_ZN9Scheduler3getEv+0x54>

      T* data = elem->data;
    80001728:	00053483          	ld	s1,0(a0)
      delete elem;
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	208080e7          	jalr	520(ra) # 80001934 <_ZdlPv>
}
    80001734:	00048513          	mv	a0,s1
    80001738:	01813083          	ld	ra,24(sp)
    8000173c:	01013403          	ld	s0,16(sp)
    80001740:	00813483          	ld	s1,8(sp)
    80001744:	02010113          	addi	sp,sp,32
    80001748:	00008067          	ret
      if(!head) tail = 0;
    8000174c:	00009797          	auipc	a5,0x9
    80001750:	a807b623          	sd	zero,-1396(a5) # 8000a1d8 <_ZN9Scheduler11threadQueueE+0x8>
    80001754:	fd5ff06f          	j	80001728 <_ZN9Scheduler3getEv+0x30>
      if(!head) return 0;
    80001758:	00050493          	mv	s1,a0
  return threadQueue.removeFirst();
    8000175c:	fd9ff06f          	j	80001734 <_ZN9Scheduler3getEv+0x3c>

0000000080001760 <_GLOBAL__sub_I__ZN9Scheduler11threadQueueE>:
}
    80001760:	ff010113          	addi	sp,sp,-16
    80001764:	00113423          	sd	ra,8(sp)
    80001768:	00813023          	sd	s0,0(sp)
    8000176c:	01010413          	addi	s0,sp,16
    80001770:	000105b7          	lui	a1,0x10
    80001774:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001778:	00100513          	li	a0,1
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	ed0080e7          	jalr	-304(ra) # 8000164c <_Z41__static_initialization_and_destruction_0ii>
    80001784:	00813083          	ld	ra,8(sp)
    80001788:	00013403          	ld	s0,0(sp)
    8000178c:	01010113          	addi	sp,sp,16
    80001790:	00008067          	ret

0000000080001794 <_Z11userWrapperPv>:
#include "../h/Riscv.hpp"
#include "../h/syscall_cpp.hpp"

extern void userMain();

void userWrapper(void*){ //thread_create ocekuje funkciju tipa void (*)(void*)
    80001794:	ff010113          	addi	sp,sp,-16
    80001798:	00113423          	sd	ra,8(sp)
    8000179c:	00813023          	sd	s0,0(sp)
    800017a0:	01010413          	addi	s0,sp,16
    userMain();
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	d60080e7          	jalr	-672(ra) # 80001504 <_Z8userMainv>
}
    800017ac:	00813083          	ld	ra,8(sp)
    800017b0:	00013403          	ld	s0,0(sp)
    800017b4:	01010113          	addi	sp,sp,16
    800017b8:	00008067          	ret

00000000800017bc <main>:

int main(){ //supervisor
    800017bc:	fe010113          	addi	sp,sp,-32
    800017c0:	00113c23          	sd	ra,24(sp)
    800017c4:	00813823          	sd	s0,16(sp)
    800017c8:	02010413          	addi	s0,sp,32
	MemoryAllocator::init();
    800017cc:	00001097          	auipc	ra,0x1
    800017d0:	934080e7          	jalr	-1740(ra) # 80002100 <_ZN15MemoryAllocator4initEv>
    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);  //postavljanje trap handler-a, stvec adresa prekidne rutine
    800017d4:	00009797          	auipc	a5,0x9
    800017d8:	9947b783          	ld	a5,-1644(a5) # 8000a168 <_GLOBAL_OFFSET_TABLE_+0x18>
  __asm__ volatile("csrr %[stvec], stvec" : [stvec] "=r" (stvec));
  return stvec;
}

inline void Riscv::w_stvec(uint64 stvec){
  __asm__ volatile("csrw stvec, %[stvec]" : : [stvec] "r" (stvec));
    800017dc:	10579073          	csrw	stvec,a5
public:
    using Body = void(*)(void*);

	//overwrite new i delete
    void *operator new(size_t size){
      return MemoryAllocator::mem_alloc((size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    800017e0:	00100513          	li	a0,1
    800017e4:	00001097          	auipc	ra,0x1
    800017e8:	984080e7          	jalr	-1660(ra) # 80002168 <_ZN15MemoryAllocator9mem_allocEm>

	//konstruktor
	explicit TCB(Body body, void* arg, uint64* stack_space) :
		body(body),
		finished(false),
		blocked(false)
    800017ec:	00053023          	sd	zero,0(a0)
    800017f0:	02050423          	sb	zero,40(a0)
    800017f4:	020504a3          	sb	zero,41(a0)
	{
        stack = stack_space != nullptr ? stack_space : nullptr;
    800017f8:	00053823          	sd	zero,16(a0)
        context.ra = (uint64)&wrapper; //postavi wrapper kao pocetnu tacku
    800017fc:	00009797          	auipc	a5,0x9
    80001800:	95c7b783          	ld	a5,-1700(a5) # 8000a158 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001804:	00f53c23          	sd	a5,24(a0)
        context.sp = (uint64)&stack[DEFAULT_STACK_SIZE/sizeof(uint64)];
    80001808:	000017b7          	lui	a5,0x1
    8000180c:	02f53023          	sd	a5,32(a0)
        this->arg = arg;
    80001810:	00053423          	sd	zero,8(a0)

    TCB* idleThread = new TCB(nullptr, nullptr, nullptr); //kernel nit, nema telo, uvek spremna
	TCB::running = idleThread; //postavlja se kao tekuca nit
    80001814:	00009797          	auipc	a5,0x9
    80001818:	9647b783          	ld	a5,-1692(a5) # 8000a178 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000181c:	00a7b023          	sd	a0,0(a5)

	TCB* userThread = nullptr; //priprema za korisnicki main
    80001820:	fe043423          	sd	zero,-24(s0)
    thread_create(&userThread, &userWrapper, nullptr); //kreiranje niti za korisnicki kod
    80001824:	00000613          	li	a2,0
    80001828:	00000597          	auipc	a1,0x0
    8000182c:	f6c58593          	addi	a1,a1,-148 # 80001794 <_Z11userWrapperPv>
    80001830:	fe840513          	addi	a0,s0,-24
    80001834:	00000097          	auipc	ra,0x0
    80001838:	a80080e7          	jalr	-1408(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>

    while(!(userThread->isFinished())) { //dok se user main ne zavsrsi
    8000183c:	fe843783          	ld	a5,-24(s0)
        if(body != nullptr) {Scheduler::put(this);}
    }

	//getteri i setteri
    bool isFinished() const{ return finished; }
    80001840:	0287c783          	lbu	a5,40(a5)
    80001844:	00079863          	bnez	a5,80001854 <main+0x98>
        thread_dispatch();   //scheduler uzima userThread iz reda
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	b18080e7          	jalr	-1256(ra) # 80001360 <_Z15thread_dispatchv>
    80001850:	fedff06f          	j	8000183c <main+0x80>
    }
    return 0;
    80001854:	00000513          	li	a0,0
    80001858:	01813083          	ld	ra,24(sp)
    8000185c:	01013403          	ld	s0,16(sp)
    80001860:	02010113          	addi	sp,sp,32
    80001864:	00008067          	ret

0000000080001868 <_ZN6ThreadD1Ev>:

Thread::Thread(void (*body)(void *), void *arg) : body(body), arg(arg){ //body fja koju ce nit izvrsavati
    myHandle = nullptr; //nit jos nije kreirana
}

Thread::~Thread() {}
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00813423          	sd	s0,8(sp)
    80001870:	01010413          	addi	s0,sp,16
    80001874:	00813403          	ld	s0,8(sp)
    80001878:	01010113          	addi	sp,sp,16
    8000187c:	00008067          	ret

0000000080001880 <_ZN6Thread13threadWrapperEPv>:
    if (!myHandle) return thread_create(&myHandle, body, arg);
    return  -1; //nit vec pokrenuta
}
Thread::Thread() : Thread(&threadWrapper, this) {} //za override run, posstavi se za body thread wrapper koji poziva run

void Thread::threadWrapper(void* t){
    80001880:	ff010113          	addi	sp,sp,-16
    80001884:	00113423          	sd	ra,8(sp)
    80001888:	00813023          	sd	s0,0(sp)
    8000188c:	01010413          	addi	s0,sp,16
    ((Thread*)t)->run();
    80001890:	00053783          	ld	a5,0(a0)
    80001894:	0107b783          	ld	a5,16(a5)
    80001898:	000780e7          	jalr	a5
}
    8000189c:	00813083          	ld	ra,8(sp)
    800018a0:	00013403          	ld	s0,0(sp)
    800018a4:	01010113          	addi	sp,sp,16
    800018a8:	00008067          	ret

00000000800018ac <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int val) {
    sem_open(&myHandle, val);
}

Semaphore::~Semaphore() {
    800018ac:	ff010113          	addi	sp,sp,-16
    800018b0:	00113423          	sd	ra,8(sp)
    800018b4:	00813023          	sd	s0,0(sp)
    800018b8:	01010413          	addi	s0,sp,16
    800018bc:	00008797          	auipc	a5,0x8
    800018c0:	74c78793          	addi	a5,a5,1868 # 8000a008 <_ZTV9Semaphore+0x10>
    800018c4:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800018c8:	00853503          	ld	a0,8(a0)
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	aec080e7          	jalr	-1300(ra) # 800013b8 <_Z9sem_closeP10SemaphoreC>
}
    800018d4:	00813083          	ld	ra,8(sp)
    800018d8:	00013403          	ld	s0,0(sp)
    800018dc:	01010113          	addi	sp,sp,16
    800018e0:	00008067          	ret

00000000800018e4 <_Znwm>:
void* operator new (size_t size){
    800018e4:	ff010113          	addi	sp,sp,-16
    800018e8:	00113423          	sd	ra,8(sp)
    800018ec:	00813023          	sd	s0,0(sp)
    800018f0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	950080e7          	jalr	-1712(ra) # 80001244 <_Z9mem_allocm>
}
    800018fc:	00813083          	ld	ra,8(sp)
    80001900:	00013403          	ld	s0,0(sp)
    80001904:	01010113          	addi	sp,sp,16
    80001908:	00008067          	ret

000000008000190c <_Znam>:
void * operator new[] (size_t size){
    8000190c:	ff010113          	addi	sp,sp,-16
    80001910:	00113423          	sd	ra,8(sp)
    80001914:	00813023          	sd	s0,0(sp)
    80001918:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000191c:	00000097          	auipc	ra,0x0
    80001920:	928080e7          	jalr	-1752(ra) # 80001244 <_Z9mem_allocm>
}
    80001924:	00813083          	ld	ra,8(sp)
    80001928:	00013403          	ld	s0,0(sp)
    8000192c:	01010113          	addi	sp,sp,16
    80001930:	00008067          	ret

0000000080001934 <_ZdlPv>:
void  operator delete (void* addr)noexcept{
    80001934:	ff010113          	addi	sp,sp,-16
    80001938:	00113423          	sd	ra,8(sp)
    8000193c:	00813023          	sd	s0,0(sp)
    80001940:	01010413          	addi	s0,sp,16
    mem_free(addr);
    80001944:	00000097          	auipc	ra,0x0
    80001948:	940080e7          	jalr	-1728(ra) # 80001284 <_Z8mem_freePv>
}
    8000194c:	00813083          	ld	ra,8(sp)
    80001950:	00013403          	ld	s0,0(sp)
    80001954:	01010113          	addi	sp,sp,16
    80001958:	00008067          	ret

000000008000195c <_ZN6ThreadD0Ev>:
Thread::~Thread() {}
    8000195c:	ff010113          	addi	sp,sp,-16
    80001960:	00113423          	sd	ra,8(sp)
    80001964:	00813023          	sd	s0,0(sp)
    80001968:	01010413          	addi	s0,sp,16
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	fc8080e7          	jalr	-56(ra) # 80001934 <_ZdlPv>
    80001974:	00813083          	ld	ra,8(sp)
    80001978:	00013403          	ld	s0,0(sp)
    8000197c:	01010113          	addi	sp,sp,16
    80001980:	00008067          	ret

0000000080001984 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001984:	fe010113          	addi	sp,sp,-32
    80001988:	00113c23          	sd	ra,24(sp)
    8000198c:	00813823          	sd	s0,16(sp)
    80001990:	00913423          	sd	s1,8(sp)
    80001994:	02010413          	addi	s0,sp,32
    80001998:	00050493          	mv	s1,a0
}
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	f10080e7          	jalr	-240(ra) # 800018ac <_ZN9SemaphoreD1Ev>
    800019a4:	00048513          	mv	a0,s1
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	f8c080e7          	jalr	-116(ra) # 80001934 <_ZdlPv>
    800019b0:	01813083          	ld	ra,24(sp)
    800019b4:	01013403          	ld	s0,16(sp)
    800019b8:	00813483          	ld	s1,8(sp)
    800019bc:	02010113          	addi	sp,sp,32
    800019c0:	00008067          	ret

00000000800019c4 <_ZdaPv>:
void operator delete[](void *addr)noexcept{
    800019c4:	ff010113          	addi	sp,sp,-16
    800019c8:	00113423          	sd	ra,8(sp)
    800019cc:	00813023          	sd	s0,0(sp)
    800019d0:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	8b0080e7          	jalr	-1872(ra) # 80001284 <_Z8mem_freePv>
}
    800019dc:	00813083          	ld	ra,8(sp)
    800019e0:	00013403          	ld	s0,0(sp)
    800019e4:	01010113          	addi	sp,sp,16
    800019e8:	00008067          	ret

00000000800019ec <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) : body(body), arg(arg){ //body fja koju ce nit izvrsavati
    800019ec:	ff010113          	addi	sp,sp,-16
    800019f0:	00813423          	sd	s0,8(sp)
    800019f4:	01010413          	addi	s0,sp,16
    800019f8:	00008797          	auipc	a5,0x8
    800019fc:	5e878793          	addi	a5,a5,1512 # 80009fe0 <_ZTV6Thread+0x10>
    80001a00:	00f53023          	sd	a5,0(a0)
    80001a04:	00b53823          	sd	a1,16(a0)
    80001a08:	00c53c23          	sd	a2,24(a0)
    myHandle = nullptr; //nit jos nije kreirana
    80001a0c:	00053423          	sd	zero,8(a0)
}
    80001a10:	00813403          	ld	s0,8(sp)
    80001a14:	01010113          	addi	sp,sp,16
    80001a18:	00008067          	ret

0000000080001a1c <_ZN6Thread5startEv>:
    if (!myHandle) return thread_create(&myHandle, body, arg);
    80001a1c:	00853783          	ld	a5,8(a0)
    80001a20:	02079c63          	bnez	a5,80001a58 <_ZN6Thread5startEv+0x3c>
int Thread::start() {
    80001a24:	ff010113          	addi	sp,sp,-16
    80001a28:	00113423          	sd	ra,8(sp)
    80001a2c:	00813023          	sd	s0,0(sp)
    80001a30:	01010413          	addi	s0,sp,16
    if (!myHandle) return thread_create(&myHandle, body, arg);
    80001a34:	01853603          	ld	a2,24(a0)
    80001a38:	01053583          	ld	a1,16(a0)
    80001a3c:	00850513          	addi	a0,a0,8
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	874080e7          	jalr	-1932(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001a48:	00813083          	ld	ra,8(sp)
    80001a4c:	00013403          	ld	s0,0(sp)
    80001a50:	01010113          	addi	sp,sp,16
    80001a54:	00008067          	ret
    return  -1; //nit vec pokrenuta
    80001a58:	fff00513          	li	a0,-1
}
    80001a5c:	00008067          	ret

0000000080001a60 <_ZN6ThreadC1Ev>:
Thread::Thread() : Thread(&threadWrapper, this) {} //za override run, posstavi se za body thread wrapper koji poziva run
    80001a60:	ff010113          	addi	sp,sp,-16
    80001a64:	00113423          	sd	ra,8(sp)
    80001a68:	00813023          	sd	s0,0(sp)
    80001a6c:	01010413          	addi	s0,sp,16
    80001a70:	00050613          	mv	a2,a0
    80001a74:	00000597          	auipc	a1,0x0
    80001a78:	e0c58593          	addi	a1,a1,-500 # 80001880 <_ZN6Thread13threadWrapperEPv>
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	f70080e7          	jalr	-144(ra) # 800019ec <_ZN6ThreadC1EPFvPvES0_>
    80001a84:	00813083          	ld	ra,8(sp)
    80001a88:	00013403          	ld	s0,0(sp)
    80001a8c:	01010113          	addi	sp,sp,16
    80001a90:	00008067          	ret

0000000080001a94 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001a94:	ff010113          	addi	sp,sp,-16
    80001a98:	00113423          	sd	ra,8(sp)
    80001a9c:	00813023          	sd	s0,0(sp)
    80001aa0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	8bc080e7          	jalr	-1860(ra) # 80001360 <_Z15thread_dispatchv>
}
    80001aac:	00813083          	ld	ra,8(sp)
    80001ab0:	00013403          	ld	s0,0(sp)
    80001ab4:	01010113          	addi	sp,sp,16
    80001ab8:	00008067          	ret

0000000080001abc <_ZN6Thread5sleepEm>:
int Thread::sleep (time_t time){return -1;}
    80001abc:	ff010113          	addi	sp,sp,-16
    80001ac0:	00813423          	sd	s0,8(sp)
    80001ac4:	01010413          	addi	s0,sp,16
    80001ac8:	fff00513          	li	a0,-1
    80001acc:	00813403          	ld	s0,8(sp)
    80001ad0:	01010113          	addi	sp,sp,16
    80001ad4:	00008067          	ret

0000000080001ad8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int val) {
    80001ad8:	ff010113          	addi	sp,sp,-16
    80001adc:	00113423          	sd	ra,8(sp)
    80001ae0:	00813023          	sd	s0,0(sp)
    80001ae4:	01010413          	addi	s0,sp,16
    80001ae8:	00008797          	auipc	a5,0x8
    80001aec:	52078793          	addi	a5,a5,1312 # 8000a008 <_ZTV9Semaphore+0x10>
    80001af0:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, val);
    80001af4:	00850513          	addi	a0,a0,8
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	88c080e7          	jalr	-1908(ra) # 80001384 <_Z8sem_openPP10SemaphoreCj>
}
    80001b00:	00813083          	ld	ra,8(sp)
    80001b04:	00013403          	ld	s0,0(sp)
    80001b08:	01010113          	addi	sp,sp,16
    80001b0c:	00008067          	ret

0000000080001b10 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80001b10:	ff010113          	addi	sp,sp,-16
    80001b14:	00113423          	sd	ra,8(sp)
    80001b18:	00813023          	sd	s0,0(sp)
    80001b1c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001b20:	00853503          	ld	a0,8(a0)
    80001b24:	00000097          	auipc	ra,0x0
    80001b28:	8c4080e7          	jalr	-1852(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>
}
    80001b2c:	00813083          	ld	ra,8(sp)
    80001b30:	00013403          	ld	s0,0(sp)
    80001b34:	01010113          	addi	sp,sp,16
    80001b38:	00008067          	ret

0000000080001b3c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80001b3c:	ff010113          	addi	sp,sp,-16
    80001b40:	00113423          	sd	ra,8(sp)
    80001b44:	00813023          	sd	s0,0(sp)
    80001b48:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001b4c:	00853503          	ld	a0,8(a0)
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	8c8080e7          	jalr	-1848(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>
}
    80001b58:	00813083          	ld	ra,8(sp)
    80001b5c:	00013403          	ld	s0,0(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret

0000000080001b68 <_ZN9Semaphore9timedWaitEm>:

int Semaphore::timedWait(time_t timeout) {
    80001b68:	ff010113          	addi	sp,sp,-16
    80001b6c:	00113423          	sd	ra,8(sp)
    80001b70:	00813023          	sd	s0,0(sp)
    80001b74:	01010413          	addi	s0,sp,16
    return sem_timedwait (myHandle, timeout);
    80001b78:	00853503          	ld	a0,8(a0)
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	8cc080e7          	jalr	-1844(ra) # 80001448 <_Z13sem_timedwaitP10SemaphoreCm>
}
    80001b84:	00813083          	ld	ra,8(sp)
    80001b88:	00013403          	ld	s0,0(sp)
    80001b8c:	01010113          	addi	sp,sp,16
    80001b90:	00008067          	ret

0000000080001b94 <_ZN9Semaphore7tryWaitEv>:

int Semaphore::tryWait() {
    80001b94:	ff010113          	addi	sp,sp,-16
    80001b98:	00113423          	sd	ra,8(sp)
    80001b9c:	00813023          	sd	s0,0(sp)
    80001ba0:	01010413          	addi	s0,sp,16
    return sem_trywait(myHandle);
    80001ba4:	00853503          	ld	a0,8(a0)
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	8bc080e7          	jalr	-1860(ra) # 80001464 <_Z11sem_trywaitP10SemaphoreC>
}
    80001bb0:	00813083          	ld	ra,8(sp)
    80001bb4:	00013403          	ld	s0,0(sp)
    80001bb8:	01010113          	addi	sp,sp,16
    80001bbc:	00008067          	ret

0000000080001bc0 <_ZN7Console4getcEv>:

char Console::getc() {
    80001bc0:	ff010113          	addi	sp,sp,-16
    80001bc4:	00113423          	sd	ra,8(sp)
    80001bc8:	00813023          	sd	s0,0(sp)
    80001bcc:	01010413          	addi	s0,sp,16
    return ::getc();
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	8e0080e7          	jalr	-1824(ra) # 800014b0 <_Z4getcv>
}
    80001bd8:	00813083          	ld	ra,8(sp)
    80001bdc:	00013403          	ld	s0,0(sp)
    80001be0:	01010113          	addi	sp,sp,16
    80001be4:	00008067          	ret

0000000080001be8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80001be8:	ff010113          	addi	sp,sp,-16
    80001bec:	00113423          	sd	ra,8(sp)
    80001bf0:	00813023          	sd	s0,0(sp)
    80001bf4:	01010413          	addi	s0,sp,16
    ::putc(c);
    80001bf8:	00000097          	auipc	ra,0x0
    80001bfc:	8e4080e7          	jalr	-1820(ra) # 800014dc <_Z4putcc>
    80001c00:	00813083          	ld	ra,8(sp)
    80001c04:	00013403          	ld	s0,0(sp)
    80001c08:	01010113          	addi	sp,sp,16
    80001c0c:	00008067          	ret

0000000080001c10 <_ZN6Thread3runEv>:
    static int sleep (time_t);
    static void threadWrapper(void* t);

protected:
    Thread ();
    virtual void run () {} //podrazumevana implementacija prazna
    80001c10:	ff010113          	addi	sp,sp,-16
    80001c14:	00813423          	sd	s0,8(sp)
    80001c18:	01010413          	addi	s0,sp,16
    80001c1c:	00813403          	ld	s0,8(sp)
    80001c20:	01010113          	addi	sp,sp,16
    80001c24:	00008067          	ret

0000000080001c28 <_ZN3TCB7wrapperEPv>:
extern "C" void pushRegisters(); //da ne vrsi name mangling
extern "C" void popRegisters();

TCB *TCB::running = nullptr;

void TCB::wrapper(void* b) { //pocetna funkcija koju izvrsava svaka nit nakon sto je kreirana
    80001c28:	ff010113          	addi	sp,sp,-16
    80001c2c:	00113423          	sd	ra,8(sp)
    80001c30:	00813023          	sd	s0,0(sp)
    80001c34:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie(); //prelazi u odg mod
    80001c38:	00000097          	auipc	ra,0x0
    80001c3c:	1d4080e7          	jalr	468(ra) # 80001e0c <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg); //izvrsava se kod niti
    80001c40:	00008797          	auipc	a5,0x8
    80001c44:	5a07b783          	ld	a5,1440(a5) # 8000a1e0 <_ZN3TCB7runningE>
    80001c48:	0007b703          	ld	a4,0(a5)
    80001c4c:	0087b503          	ld	a0,8(a5)
    80001c50:	000700e7          	jalr	a4
    thread_exit(); //zavrsetak niti, kernel preuzima kontrolu, u sebi sistemski poziv za gašenje niti
    80001c54:	fffff097          	auipc	ra,0xfffff
    80001c58:	6e0080e7          	jalr	1760(ra) # 80001334 <_Z11thread_exitv>
}
    80001c5c:	00813083          	ld	ra,8(sp)
    80001c60:	00013403          	ld	s0,0(sp)
    80001c64:	01010113          	addi	sp,sp,16
    80001c68:	00008067          	ret

0000000080001c6c <_ZN3TCB12createThreadEPFvPvES0_Pm>:

TCB *TCB::createThread(TCB::Body body, void *arg, uint64 *stack_space) {
    80001c6c:	fd010113          	addi	sp,sp,-48
    80001c70:	02113423          	sd	ra,40(sp)
    80001c74:	02813023          	sd	s0,32(sp)
    80001c78:	00913c23          	sd	s1,24(sp)
    80001c7c:	01213823          	sd	s2,16(sp)
    80001c80:	01313423          	sd	s3,8(sp)
    80001c84:	01413023          	sd	s4,0(sp)
    80001c88:	03010413          	addi	s0,sp,48
    80001c8c:	00050993          	mv	s3,a0
    80001c90:	00058a13          	mv	s4,a1
    80001c94:	00060913          	mv	s2,a2
      return MemoryAllocator::mem_alloc((size + MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80001c98:	00100513          	li	a0,1
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	4cc080e7          	jalr	1228(ra) # 80002168 <_ZN15MemoryAllocator9mem_allocEm>
    80001ca4:	00050493          	mv	s1,a0
		blocked(false)
    80001ca8:	01353023          	sd	s3,0(a0)
    80001cac:	02050423          	sb	zero,40(a0)
    80001cb0:	020504a3          	sb	zero,41(a0)
        stack = stack_space != nullptr ? stack_space : nullptr;
    80001cb4:	01253823          	sd	s2,16(a0)
        context.ra = (uint64)&wrapper; //postavi wrapper kao pocetnu tacku
    80001cb8:	00000797          	auipc	a5,0x0
    80001cbc:	f7078793          	addi	a5,a5,-144 # 80001c28 <_ZN3TCB7wrapperEPv>
    80001cc0:	00f53c23          	sd	a5,24(a0)
        context.sp = (uint64)&stack[DEFAULT_STACK_SIZE/sizeof(uint64)];
    80001cc4:	00001637          	lui	a2,0x1
    80001cc8:	00c90933          	add	s2,s2,a2
    80001ccc:	03253023          	sd	s2,32(a0)
        this->arg = arg;
    80001cd0:	01453423          	sd	s4,8(a0)
        if(body != nullptr) {Scheduler::put(this);}
    80001cd4:	02098663          	beqz	s3,80001d00 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x94>
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	9b4080e7          	jalr	-1612(ra) # 8000168c <_ZN9Scheduler3putEP3TCB>
    80001ce0:	0200006f          	j	80001d00 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x94>
    80001ce4:	00050913          	mv	s2,a0
      MemoryAllocator::mem_free(el);
    80001ce8:	00048513          	mv	a0,s1
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	6a0080e7          	jalr	1696(ra) # 8000238c <_ZN15MemoryAllocator8mem_freeEPv>
    80001cf4:	00090513          	mv	a0,s2
    80001cf8:	00009097          	auipc	ra,0x9
    80001cfc:	600080e7          	jalr	1536(ra) # 8000b2f8 <_Unwind_Resume>
    return new TCB(body, arg, stack_space);
}
    80001d00:	00048513          	mv	a0,s1
    80001d04:	02813083          	ld	ra,40(sp)
    80001d08:	02013403          	ld	s0,32(sp)
    80001d0c:	01813483          	ld	s1,24(sp)
    80001d10:	01013903          	ld	s2,16(sp)
    80001d14:	00813983          	ld	s3,8(sp)
    80001d18:	00013a03          	ld	s4,0(sp)
    80001d1c:	03010113          	addi	sp,sp,48
    80001d20:	00008067          	ret

0000000080001d24 <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001d24:	ff010113          	addi	sp,sp,-16
    80001d28:	00813423          	sd	s0,8(sp)
    80001d2c:	01010413          	addi	s0,sp,16
  //  pushRegisters();
    __asm__ volatile ("mv a0, %0":: "r"(0x13)); //thread_dispatch
    80001d30:	01300793          	li	a5,19
    80001d34:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001d38:	00000073          	ecall
   // popRegisters();
}
    80001d3c:	00813403          	ld	s0,8(sp)
    80001d40:	01010113          	addi	sp,sp,16
    80001d44:	00008067          	ret

0000000080001d48 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() { //trenutno izvrsavanu korutinu zameni nekom drugom
    80001d48:	fe010113          	addi	sp,sp,-32
    80001d4c:	00113c23          	sd	ra,24(sp)
    80001d50:	00813823          	sd	s0,16(sp)
    80001d54:	00913423          	sd	s1,8(sp)
    80001d58:	02010413          	addi	s0,sp,32
    TCB *old = running;
    80001d5c:	00008497          	auipc	s1,0x8
    80001d60:	4844b483          	ld	s1,1156(s1) # 8000a1e0 <_ZN3TCB7runningE>
    bool isFinished() const{ return finished; }
    80001d64:	0284c783          	lbu	a5,40(s1)
    if(!old->isFinished() && !old->isBlocked()) {
    80001d68:	00079663          	bnez	a5,80001d74 <_ZN3TCB8dispatchEv+0x2c>
    void setFinished(bool value){ finished = value; }

    bool isBlocked() const{ return blocked; }
    80001d6c:	0294c783          	lbu	a5,41(s1)
    80001d70:	04078063          	beqz	a5,80001db0 <_ZN3TCB8dispatchEv+0x68>
        Scheduler::put(old);
    }
    running = Scheduler::get();
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	984080e7          	jalr	-1660(ra) # 800016f8 <_ZN9Scheduler3getEv>
    80001d7c:	00008797          	auipc	a5,0x8
    80001d80:	46a7b223          	sd	a0,1124(a5) # 8000a1e0 <_ZN3TCB7runningE>
    if(running != nullptr && running != old) TCB::contextSwitch(&old->context, &running->context);
    80001d84:	00050c63          	beqz	a0,80001d9c <_ZN3TCB8dispatchEv+0x54>
    80001d88:	00a48a63          	beq	s1,a0,80001d9c <_ZN3TCB8dispatchEv+0x54>
    80001d8c:	01850593          	addi	a1,a0,24
    80001d90:	01848513          	addi	a0,s1,24
    80001d94:	fffff097          	auipc	ra,0xfffff
    80001d98:	47c080e7          	jalr	1148(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001d9c:	01813083          	ld	ra,24(sp)
    80001da0:	01013403          	ld	s0,16(sp)
    80001da4:	00813483          	ld	s1,8(sp)
    80001da8:	02010113          	addi	sp,sp,32
    80001dac:	00008067          	ret
        Scheduler::put(old);
    80001db0:	00048513          	mv	a0,s1
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	8d8080e7          	jalr	-1832(ra) # 8000168c <_ZN9Scheduler3putEP3TCB>
    80001dbc:	fb9ff06f          	j	80001d74 <_ZN3TCB8dispatchEv+0x2c>

0000000080001dc0 <_ZN3TCB4exitEv>:

int TCB::exit(){
    if(!TCB::running->isFinished()) {
    80001dc0:	00008797          	auipc	a5,0x8
    80001dc4:	4207b783          	ld	a5,1056(a5) # 8000a1e0 <_ZN3TCB7runningE>
    bool isFinished() const{ return finished; }
    80001dc8:	0287c703          	lbu	a4,40(a5)
    80001dcc:	02071c63          	bnez	a4,80001e04 <_ZN3TCB4exitEv+0x44>
int TCB::exit(){
    80001dd0:	ff010113          	addi	sp,sp,-16
    80001dd4:	00113423          	sd	ra,8(sp)
    80001dd8:	00813023          	sd	s0,0(sp)
    80001ddc:	01010413          	addi	s0,sp,16
    void setFinished(bool value){ finished = value; }
    80001de0:	00100713          	li	a4,1
    80001de4:	02e78423          	sb	a4,40(a5)
        TCB::running->setFinished(true);
        TCB::dispatch();
    80001de8:	00000097          	auipc	ra,0x0
    80001dec:	f60080e7          	jalr	-160(ra) # 80001d48 <_ZN3TCB8dispatchEv>
        return 0;
    80001df0:	00000513          	li	a0,0
    }else return -1;
}
    80001df4:	00813083          	ld	ra,8(sp)
    80001df8:	00013403          	ld	s0,0(sp)
    80001dfc:	01010113          	addi	sp,sp,16
    80001e00:	00008067          	ret
    }else return -1;
    80001e04:	fff00513          	li	a0,-1
}
    80001e08:	00008067          	ret

0000000080001e0c <_ZN5Riscv10popSppSpieEv>:
#include "../h/Riscv.hpp"

void Riscv::popSppSpie(){
    80001e0c:	ff010113          	addi	sp,sp,-16
    80001e10:	00813423          	sd	s0,8(sp)
    80001e14:	01010413          	addi	s0,sp,16
    void setBlocked(bool value){ blocked = value; }

	static bool isBodyNull(){return running->body == nullptr;}
    80001e18:	00008797          	auipc	a5,0x8
    80001e1c:	3607b783          	ld	a5,864(a5) # 8000a178 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001e20:	0007b783          	ld	a5,0(a5)
    80001e24:	0007b783          	ld	a5,0(a5)
    if (TCB::isBodyNull()) //da li je kernel nit
    80001e28:	02078063          	beqz	a5,80001e48 <_ZN5Riscv10popSppSpieEv+0x3c>
inline void Riscv::ms_sstatus(uint64 mask){
  __asm__ volatile("csrs sstatus, %[mask]" : : [mask] "r" (mask));
}

inline void Riscv::mc_sstatus(uint64 mask){
  __asm__ volatile("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    80001e2c:	10000793          	li	a5,256
    80001e30:	1007b073          	csrc	sstatus,a5
        ms_sstatus(SSTATUS_SPP); //supervisor mod, 1
    else
        mc_sstatus(SSTATUS_SPP); //user mod, 0
    __asm__ volatile ("csrw sepc, ra");
    80001e34:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001e38:	10200073          	sret
}
    80001e3c:	00813403          	ld	s0,8(sp)
    80001e40:	01010113          	addi	sp,sp,16
    80001e44:	00008067          	ret
  __asm__ volatile("csrs sstatus, %[mask]" : : [mask] "r" (mask));
    80001e48:	10000793          	li	a5,256
    80001e4c:	1007a073          	csrs	sstatus,a5
}
    80001e50:	fe5ff06f          	j	80001e34 <_ZN5Riscv10popSppSpieEv+0x28>

0000000080001e54 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80001e54:	fb010113          	addi	sp,sp,-80
    80001e58:	04113423          	sd	ra,72(sp)
    80001e5c:	04813023          	sd	s0,64(sp)
    80001e60:	02913c23          	sd	s1,56(sp)
    80001e64:	03213823          	sd	s2,48(sp)
    80001e68:	05010413          	addi	s0,sp,80
  __asm__ volatile("csrr %[scause], scause" : [scause] "=r" (scause));
    80001e6c:	142027f3          	csrr	a5,scause
    80001e70:	fcf43423          	sd	a5,-56(s0)
  return scause;
    80001e74:	fc843483          	ld	s1,-56(s0)
    uint64 scause = r_scause();
    if(scause == ECALL_USER || scause == ECALL_SUPERVISOR) {
    80001e78:	ff848713          	addi	a4,s1,-8
    80001e7c:	00100793          	li	a5,1
    80001e80:	08e7f263          	bgeu	a5,a4,80001f04 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
            default: break;
        }
        w_sepc(sepc);
        w_sstatus(sstatus);
    }
    else if(scause == CONSOLE_RISCV){
    80001e84:	fff00793          	li	a5,-1
    80001e88:	03f79793          	slli	a5,a5,0x3f
    80001e8c:	00978793          	addi	a5,a5,9
    80001e90:	20f48e63          	beq	s1,a5,800020ac <_ZN5Riscv20handleSupervisorTrapEv+0x258>
       console_handler();
    }
    else if(scause == TIMER){
    80001e94:	fff00793          	li	a5,-1
    80001e98:	03f79793          	slli	a5,a5,0x3f
    80001e9c:	00178793          	addi	a5,a5,1
    80001ea0:	20f48c63          	beq	s1,a5,800020b8 <_ZN5Riscv20handleSupervisorTrapEv+0x264>
        mc_sip(SIP_SSIP); //potvrda da smo primili prekid, brisemo zahtev za prekid, obradio se
    }
    else if(scause == LOAD_ACCESS_FAULT){
    80001ea4:	00700793          	li	a5,7
    80001ea8:	20f48e63          	beq	s1,a5,800020c4 <_ZN5Riscv20handleSupervisorTrapEv+0x270>
        printString("Nedozvoljena adresa upisa");
        while (true);
    }
    else if(scause == STORE_ACCESS_FAULT){
    80001eac:	00500793          	li	a5,5
    80001eb0:	22f48463          	beq	s1,a5,800020d8 <_ZN5Riscv20handleSupervisorTrapEv+0x284>
         printString("Nedozvoljena adresa citanja");
        while (true);
    }
    else if(scause == ILLEGAL_INSTRUCTION) {
    80001eb4:	00200793          	li	a5,2
    80001eb8:	22f48a63          	beq	s1,a5,800020ec <_ZN5Riscv20handleSupervisorTrapEv+0x298>
         printString("Ilegalna instrukcija");
        while (true);
    }
    else{ //nepoznat prekid
         printString("Neobradjena greska \n");
    80001ebc:	00006517          	auipc	a0,0x6
    80001ec0:	3f450513          	addi	a0,a0,1012 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80001ec4:	00002097          	auipc	ra,0x2
    80001ec8:	62c080e7          	jalr	1580(ra) # 800044f0 <_Z11printStringPKc>
         printString("SCAUSE ");
    80001ecc:	00006517          	auipc	a0,0x6
    80001ed0:	3fc50513          	addi	a0,a0,1020 # 800082c8 <CONSOLE_STATUS+0x2b8>
    80001ed4:	00002097          	auipc	ra,0x2
    80001ed8:	61c080e7          	jalr	1564(ra) # 800044f0 <_Z11printStringPKc>
         printInt((int)scause);
    80001edc:	00000613          	li	a2,0
    80001ee0:	00a00593          	li	a1,10
    80001ee4:	0004851b          	sext.w	a0,s1
    80001ee8:	00002097          	auipc	ra,0x2
    80001eec:	7b8080e7          	jalr	1976(ra) # 800046a0 <_Z8printIntiii>
		 printString("\n");
    80001ef0:	00006517          	auipc	a0,0x6
    80001ef4:	2a050513          	addi	a0,a0,672 # 80008190 <CONSOLE_STATUS+0x180>
    80001ef8:	00002097          	auipc	ra,0x2
    80001efc:	5f8080e7          	jalr	1528(ra) # 800044f0 <_Z11printStringPKc>
    }
    80001f00:	07c0006f          	j	80001f7c <_ZN5Riscv20handleSupervisorTrapEv+0x128>
        __asm__ volatile("mv %0, a0": "=r"(code));
    80001f04:	00050793          	mv	a5,a0
    80001f08:	faf43823          	sd	a5,-80(s0)
  __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80001f0c:	141027f3          	csrr	a5,sepc
    80001f10:	fcf43c23          	sd	a5,-40(s0)
  return sepc;
    80001f14:	fd843783          	ld	a5,-40(s0)
        uint64 volatile sepc = r_sepc() + 4;
    80001f18:	00478793          	addi	a5,a5,4
    80001f1c:	faf43c23          	sd	a5,-72(s0)
}

inline uint64 Riscv::r_sstatus(){
  uint64 volatile sstatus;
  __asm__ volatile("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80001f20:	100027f3          	csrr	a5,sstatus
    80001f24:	fcf43823          	sd	a5,-48(s0)
  return sstatus;
    80001f28:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sstatus = r_sstatus();
    80001f2c:	fcf43023          	sd	a5,-64(s0)
        switch(code) {
    80001f30:	fb043783          	ld	a5,-80(s0)
    80001f34:	04200713          	li	a4,66
    80001f38:	02f76a63          	bltu	a4,a5,80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    80001f3c:	00279793          	slli	a5,a5,0x2
    80001f40:	00006717          	auipc	a4,0x6
    80001f44:	39070713          	addi	a4,a4,912 # 800082d0 <CONSOLE_STATUS+0x2c0>
    80001f48:	00e787b3          	add	a5,a5,a4
    80001f4c:	0007a783          	lw	a5,0(a5)
    80001f50:	00e787b3          	add	a5,a5,a4
    80001f54:	00078067          	jr	a5
                __asm__ volatile("mv %0, a1": "=r"(size));
    80001f58:	00058513          	mv	a0,a1
                void* mem = MemoryAllocator::mem_alloc(size);
    80001f5c:	00000097          	auipc	ra,0x0
    80001f60:	20c080e7          	jalr	524(ra) # 80002168 <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile("mv a0, %0":: "r"(mem));
    80001f64:	00050513          	mv	a0,a0
                __asm__ volatile("sd a0, 80(s0)");
    80001f68:	04a43823          	sd	a0,80(s0)
        w_sepc(sepc);
    80001f6c:	fb843783          	ld	a5,-72(s0)
  __asm__ volatile("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80001f70:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    80001f74:	fc043783          	ld	a5,-64(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus){
  __asm__ volatile("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80001f78:	10079073          	csrw	sstatus,a5
    80001f7c:	04813083          	ld	ra,72(sp)
    80001f80:	04013403          	ld	s0,64(sp)
    80001f84:	03813483          	ld	s1,56(sp)
    80001f88:	03013903          	ld	s2,48(sp)
    80001f8c:	05010113          	addi	sp,sp,80
    80001f90:	00008067          	ret
                __asm__ volatile("mv %0, a1": "=r"(addr));
    80001f94:	00058513          	mv	a0,a1
                uint64 result = (uint64)MemoryAllocator::mem_free(addr);
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	3f4080e7          	jalr	1012(ra) # 8000238c <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile("mv a0, %0":: "r"(result));
    80001fa0:	00050513          	mv	a0,a0
                break;
    80001fa4:	fc9ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001fa8:	00058493          	mv	s1,a1
                __asm__ volatile("mv %0, a2": "=r"(start_routine));
    80001fac:	00060513          	mv	a0,a2
                __asm__ volatile("mv %0, a3": "=r"(args));
    80001fb0:	00068593          	mv	a1,a3
                __asm__ volatile("mv %0, a7": "=r"(stack_space));
    80001fb4:	00088613          	mv	a2,a7
                *handle = TCB::createThread(start_routine, args, stack_space);
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	cb4080e7          	jalr	-844(ra) # 80001c6c <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001fc0:	00a4b023          	sd	a0,0(s1)
                __asm__ volatile("mv a0, %0":: "r"(handle));
    80001fc4:	00048513          	mv	a0,s1
                break;
    80001fc8:	fa5ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                int result = TCB::exit();
    80001fcc:	00000097          	auipc	ra,0x0
    80001fd0:	df4080e7          	jalr	-524(ra) # 80001dc0 <_ZN3TCB4exitEv>
                __asm__ volatile("mv a0, %0":: "r"(result));
    80001fd4:	00050513          	mv	a0,a0
                break;
    80001fd8:	f95ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                TCB::dispatch();
    80001fdc:	00000097          	auipc	ra,0x0
    80001fe0:	d6c080e7          	jalr	-660(ra) # 80001d48 <_ZN3TCB8dispatchEv>
                break;
    80001fe4:	f89ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001fe8:	00058513          	mv	a0,a1
                __asm__ volatile("mv %0, a2": "=r"(init));
    80001fec:	00060593          	mv	a1,a2
                if(SemaphoreC::createSem(handle, init)){
    80001ff0:	0005859b          	sext.w	a1,a1
    80001ff4:	00000097          	auipc	ra,0x0
    80001ff8:	524080e7          	jalr	1316(ra) # 80002518 <_ZN10SemaphoreC9createSemEPPS_j>
    80001ffc:	00050663          	beqz	a0,80002008 <_ZN5Riscv20handleSupervisorTrapEv+0x1b4>
                    __asm__ volatile("li a0, 0");
    80002000:	00000513          	li	a0,0
    80002004:	f69ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                else __asm__ volatile("li a0, -1");
    80002008:	fff00513          	li	a0,-1
    8000200c:	f61ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv %0, a1": "=r"(s));
    80002010:	00058493          	mv	s1,a1
                int result = s->close();
    80002014:	00048513          	mv	a0,s1
    80002018:	00000097          	auipc	ra,0x0
    8000201c:	700080e7          	jalr	1792(ra) # 80002718 <_ZN10SemaphoreC5closeEv>
    80002020:	00050913          	mv	s2,a0
                delete s;
    80002024:	00048e63          	beqz	s1,80002040 <_ZN5Riscv20handleSupervisorTrapEv+0x1ec>
    80002028:	00048513          	mv	a0,s1
    8000202c:	00000097          	auipc	ra,0x0
    80002030:	75c080e7          	jalr	1884(ra) # 80002788 <_ZN10SemaphoreCD1Ev>
    80002034:	00048513          	mv	a0,s1
    80002038:	00000097          	auipc	ra,0x0
    8000203c:	8fc080e7          	jalr	-1796(ra) # 80001934 <_ZdlPv>
                __asm__ volatile("mv a0, %0":: "r"(result));
    80002040:	00090513          	mv	a0,s2
                break;
    80002044:	f29ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv %0, a1": "=r"(s));
    80002048:	00058513          	mv	a0,a1
                int result = s->wait();
    8000204c:	00000097          	auipc	ra,0x0
    80002050:	61c080e7          	jalr	1564(ra) # 80002668 <_ZN10SemaphoreC4waitEv>
                __asm__ volatile("mv a0, %0":: "r"(result));
    80002054:	00050513          	mv	a0,a0
                break;
    80002058:	f15ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv %0, a1": "=r"(s));
    8000205c:	00058513          	mv	a0,a1
                int result = s->signal();
    80002060:	00000097          	auipc	ra,0x0
    80002064:	660080e7          	jalr	1632(ra) # 800026c0 <_ZN10SemaphoreC6signalEv>
                __asm__ volatile("mv a0, %0":: "r"(result));
    80002068:	00050513          	mv	a0,a0
                break;
    8000206c:	f01ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv %0, a1": "=r"(s));
    80002070:	00058513          	mv	a0,a1
                int result = s->tryWait();
    80002074:	00000097          	auipc	ra,0x0
    80002078:	73c080e7          	jalr	1852(ra) # 800027b0 <_ZN10SemaphoreC7tryWaitEv>
                __asm__ volatile("mv a0, %0":: "r"(result));
    8000207c:	00050513          	mv	a0,a0
                break;
    80002080:	eedff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                char c = __getc();
    80002084:	00005097          	auipc	ra,0x5
    80002088:	534080e7          	jalr	1332(ra) # 800075b8 <__getc>
                __asm__ volatile("mv a0, %0"::"r"(c));
    8000208c:	00050513          	mv	a0,a0
                __asm__ volatile("sd a0, 80(s0)");
    80002090:	04a43823          	sd	a0,80(s0)
                break;
    80002094:	ed9ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv %0, a1": "=r"(c));
    80002098:	00058513          	mv	a0,a1
                __putc(c);
    8000209c:	0ff57513          	andi	a0,a0,255
    800020a0:	00005097          	auipc	ra,0x5
    800020a4:	4dc080e7          	jalr	1244(ra) # 8000757c <__putc>
                break;
    800020a8:	ec5ff06f          	j	80001f6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
       console_handler();
    800020ac:	00005097          	auipc	ra,0x5
    800020b0:	544080e7          	jalr	1348(ra) # 800075f0 <console_handler>
    800020b4:	ec9ff06f          	j	80001f7c <_ZN5Riscv20handleSupervisorTrapEv+0x128>
  __asm__ volatile("csrc sip, %[mask]" : : [mask] "r" (mask));
    800020b8:	00200793          	li	a5,2
    800020bc:	1447b073          	csrc	sip,a5
 }
    800020c0:	ebdff06f          	j	80001f7c <_ZN5Riscv20handleSupervisorTrapEv+0x128>
        printString("Nedozvoljena adresa upisa");
    800020c4:	00006517          	auipc	a0,0x6
    800020c8:	19450513          	addi	a0,a0,404 # 80008258 <CONSOLE_STATUS+0x248>
    800020cc:	00002097          	auipc	ra,0x2
    800020d0:	424080e7          	jalr	1060(ra) # 800044f0 <_Z11printStringPKc>
        while (true);
    800020d4:	0000006f          	j	800020d4 <_ZN5Riscv20handleSupervisorTrapEv+0x280>
         printString("Nedozvoljena adresa citanja");
    800020d8:	00006517          	auipc	a0,0x6
    800020dc:	1a050513          	addi	a0,a0,416 # 80008278 <CONSOLE_STATUS+0x268>
    800020e0:	00002097          	auipc	ra,0x2
    800020e4:	410080e7          	jalr	1040(ra) # 800044f0 <_Z11printStringPKc>
        while (true);
    800020e8:	0000006f          	j	800020e8 <_ZN5Riscv20handleSupervisorTrapEv+0x294>
         printString("Ilegalna instrukcija");
    800020ec:	00006517          	auipc	a0,0x6
    800020f0:	1ac50513          	addi	a0,a0,428 # 80008298 <CONSOLE_STATUS+0x288>
    800020f4:	00002097          	auipc	ra,0x2
    800020f8:	3fc080e7          	jalr	1020(ra) # 800044f0 <_Z11printStringPKc>
        while (true);
    800020fc:	0000006f          	j	800020fc <_ZN5Riscv20handleSupervisorTrapEv+0x2a8>

0000000080002100 <_ZN15MemoryAllocator4initEv>:
#include "../h/MemoryAllocator.hpp"

BlockHeader* MemoryAllocator::freeHead = nullptr;
BlockHeader* MemoryAllocator::allocHead = nullptr;

void MemoryAllocator::init() {
    80002100:	ff010113          	addi	sp,sp,-16
    80002104:	00813423          	sd	s0,8(sp)
    80002108:	01010413          	addi	s0,sp,16
    uint64 start = ((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1); //poravnanje
    8000210c:	00008797          	auipc	a5,0x8
    80002110:	0547b783          	ld	a5,84(a5) # 8000a160 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002114:	0007b783          	ld	a5,0(a5)
    80002118:	03f78793          	addi	a5,a5,63
    8000211c:	fc07f793          	andi	a5,a5,-64
    freeHead = (BlockHeader*)start;
    80002120:	00008697          	auipc	a3,0x8
    80002124:	0c868693          	addi	a3,a3,200 # 8000a1e8 <_ZN15MemoryAllocator8freeHeadE>
    80002128:	00f6b023          	sd	a5,0(a3)
    freeHead->size = ((uint64)HEAP_END_ADDR - start) / MEM_BLOCK_SIZE - HEADER_BLOCKS; //u blokovima
    8000212c:	00008717          	auipc	a4,0x8
    80002130:	05473703          	ld	a4,84(a4) # 8000a180 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002134:	00073703          	ld	a4,0(a4)
    80002138:	40f70733          	sub	a4,a4,a5
    8000213c:	00675713          	srli	a4,a4,0x6
    80002140:	fff70713          	addi	a4,a4,-1
    80002144:	00e7b023          	sd	a4,0(a5)
    freeHead->next = nullptr;
    80002148:	0006b783          	ld	a5,0(a3)
    8000214c:	0007b423          	sd	zero,8(a5)
    freeHead->prev = nullptr;
    80002150:	0007b823          	sd	zero,16(a5)
    freeHead->isFree = true;
    80002154:	00100713          	li	a4,1
    80002158:	00e78c23          	sb	a4,24(a5)
}
    8000215c:	00813403          	ld	s0,8(sp)
    80002160:	01010113          	addi	sp,sp,16
    80002164:	00008067          	ret

0000000080002168 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    80002168:	ff010113          	addi	sp,sp,-16
    8000216c:	00813423          	sd	s0,8(sp)
    80002170:	01010413          	addi	s0,sp,16
    if(!size || !freeHead) return nullptr;
    80002174:	14050663          	beqz	a0,800022c0 <_ZN15MemoryAllocator9mem_allocEm+0x158>
    80002178:	00050713          	mv	a4,a0
    8000217c:	00008517          	auipc	a0,0x8
    80002180:	06c53503          	ld	a0,108(a0) # 8000a1e8 <_ZN15MemoryAllocator8freeHeadE>
    80002184:	10050263          	beqz	a0,80002288 <_ZN15MemoryAllocator9mem_allocEm+0x120>
    if(size > ((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR)) return nullptr;
    80002188:	00008797          	auipc	a5,0x8
    8000218c:	ff87b783          	ld	a5,-8(a5) # 8000a180 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002190:	0007b783          	ld	a5,0(a5)
    80002194:	00008697          	auipc	a3,0x8
    80002198:	fcc6b683          	ld	a3,-52(a3) # 8000a160 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000219c:	0006b683          	ld	a3,0(a3)
    800021a0:	40d787b3          	sub	a5,a5,a3
    800021a4:	12e7e263          	bltu	a5,a4,800022c8 <_ZN15MemoryAllocator9mem_allocEm+0x160>

    size_t totalBlocks = size + HEADER_BLOCKS;
    800021a8:	00170693          	addi	a3,a4,1
    BlockHeader* curr = freeHead;
    BlockHeader* allocatedBlock = nullptr; //blok koji alociram
    800021ac:	0480006f          	j	800021f4 <_ZN15MemoryAllocator9mem_allocEm+0x8c>
        if(curr->isFree && curr->size >= totalBlocks) {
            allocatedBlock = curr;

            if(curr->size == totalBlocks) { //tacno odgovara
                //izbacivanje iz slobodnih
                if(curr->prev) curr->prev->next = curr->next;
    800021b0:	01053783          	ld	a5,16(a0)
    800021b4:	02078063          	beqz	a5,800021d4 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    800021b8:	00853703          	ld	a4,8(a0)
    800021bc:	00e7b423          	sd	a4,8(a5)
                else freeHead = curr->next;
                if(curr->next) curr->next->prev = curr->prev;
    800021c0:	00853783          	ld	a5,8(a0)
    800021c4:	08078463          	beqz	a5,8000224c <_ZN15MemoryAllocator9mem_allocEm+0xe4>
    800021c8:	01053703          	ld	a4,16(a0)
    800021cc:	00e7b823          	sd	a4,16(a5)
    800021d0:	07c0006f          	j	8000224c <_ZN15MemoryAllocator9mem_allocEm+0xe4>
                else freeHead = curr->next;
    800021d4:	00853783          	ld	a5,8(a0)
    800021d8:	00008717          	auipc	a4,0x8
    800021dc:	00f73823          	sd	a5,16(a4) # 8000a1e8 <_ZN15MemoryAllocator8freeHeadE>
    800021e0:	fe1ff06f          	j	800021c0 <_ZN15MemoryAllocator9mem_allocEm+0x58>
                free->isFree = true;

                free->next = curr->next;
                free->prev = curr->prev;
                if(curr->prev) curr->prev->next = free;
                else freeHead = free;
    800021e4:	00008797          	auipc	a5,0x8
    800021e8:	00c7b223          	sd	a2,4(a5) # 8000a1e8 <_ZN15MemoryAllocator8freeHeadE>
    800021ec:	0500006f          	j	8000223c <_ZN15MemoryAllocator9mem_allocEm+0xd4>
            allocatedBlock->isFree = false;
            allocatedBlock->next = nullptr;
            allocatedBlock->prev = nullptr;
            break;
        }
        curr = curr->next;
    800021f0:	00853503          	ld	a0,8(a0)
    while(curr) {
    800021f4:	06050263          	beqz	a0,80002258 <_ZN15MemoryAllocator9mem_allocEm+0xf0>
        if(curr->isFree && curr->size >= totalBlocks) {
    800021f8:	01854783          	lbu	a5,24(a0)
    800021fc:	fe078ae3          	beqz	a5,800021f0 <_ZN15MemoryAllocator9mem_allocEm+0x88>
    80002200:	00053783          	ld	a5,0(a0)
    80002204:	fed7e6e3          	bltu	a5,a3,800021f0 <_ZN15MemoryAllocator9mem_allocEm+0x88>
            if(curr->size == totalBlocks) { //tacno odgovara
    80002208:	fad784e3          	beq	a5,a3,800021b0 <_ZN15MemoryAllocator9mem_allocEm+0x48>
                BlockHeader* free = (BlockHeader*)((char*)curr + totalBlocks * MEM_BLOCK_SIZE);
    8000220c:	00669613          	slli	a2,a3,0x6
    80002210:	00c50633          	add	a2,a0,a2
                free->size = curr->size - totalBlocks;
    80002214:	40d787b3          	sub	a5,a5,a3
    80002218:	00f63023          	sd	a5,0(a2) # 1000 <_entry-0x7ffff000>
                free->isFree = true;
    8000221c:	00100793          	li	a5,1
    80002220:	00f60c23          	sb	a5,24(a2)
                free->next = curr->next;
    80002224:	00853783          	ld	a5,8(a0)
    80002228:	00f63423          	sd	a5,8(a2)
                free->prev = curr->prev;
    8000222c:	01053783          	ld	a5,16(a0)
    80002230:	00f63823          	sd	a5,16(a2)
                if(curr->prev) curr->prev->next = free;
    80002234:	fa0788e3          	beqz	a5,800021e4 <_ZN15MemoryAllocator9mem_allocEm+0x7c>
    80002238:	00c7b423          	sd	a2,8(a5)
                if(curr->next) curr->next->prev = free;
    8000223c:	00853783          	ld	a5,8(a0)
    80002240:	00078463          	beqz	a5,80002248 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    80002244:	00c7b823          	sd	a2,16(a5)
                allocatedBlock->size = size;
    80002248:	00e53023          	sd	a4,0(a0)
            allocatedBlock->isFree = false;
    8000224c:	00050c23          	sb	zero,24(a0)
            allocatedBlock->next = nullptr;
    80002250:	00053423          	sd	zero,8(a0)
            allocatedBlock->prev = nullptr;
    80002254:	00053823          	sd	zero,16(a0)
    }

    if(!allocatedBlock) return nullptr; //nismo nasli odg blok
    80002258:	02050863          	beqz	a0,80002288 <_ZN15MemoryAllocator9mem_allocEm+0x120>

    //ubacivanje u listu slobodnih, po adr
    if(!allocHead || allocatedBlock < allocHead) {
    8000225c:	00008797          	auipc	a5,0x8
    80002260:	f947b783          	ld	a5,-108(a5) # 8000a1f0 <_ZN15MemoryAllocator9allocHeadE>
    80002264:	00078463          	beqz	a5,8000226c <_ZN15MemoryAllocator9mem_allocEm+0x104>
    80002268:	02f57663          	bgeu	a0,a5,80002294 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
        allocatedBlock->next = allocHead;
    8000226c:	00f53423          	sd	a5,8(a0)
        allocatedBlock->prev = nullptr;
    80002270:	00053823          	sd	zero,16(a0)
        if(allocHead) allocHead->prev = allocatedBlock;
    80002274:	00078463          	beqz	a5,8000227c <_ZN15MemoryAllocator9mem_allocEm+0x114>
    80002278:	00a7b823          	sd	a0,16(a5)
        allocHead = allocatedBlock;
    8000227c:	00008797          	auipc	a5,0x8
    80002280:	f6a7ba23          	sd	a0,-140(a5) # 8000a1f0 <_ZN15MemoryAllocator9allocHeadE>
        allocatedBlock->prev = tmp;
        if(tmp->next) tmp->next->prev = allocatedBlock;
        tmp->next = allocatedBlock;
    }

    return (char*)allocatedBlock + MEM_BLOCK_SIZE;
    80002284:	04050513          	addi	a0,a0,64
}
    80002288:	00813403          	ld	s0,8(sp)
    8000228c:	01010113          	addi	sp,sp,16
    80002290:	00008067          	ret
        while(tmp->next && tmp->next < allocatedBlock) tmp = tmp->next;
    80002294:	00078713          	mv	a4,a5
    80002298:	0087b783          	ld	a5,8(a5)
    8000229c:	00078463          	beqz	a5,800022a4 <_ZN15MemoryAllocator9mem_allocEm+0x13c>
    800022a0:	fea7eae3          	bltu	a5,a0,80002294 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
        allocatedBlock->next = tmp->next;
    800022a4:	00f53423          	sd	a5,8(a0)
        allocatedBlock->prev = tmp;
    800022a8:	00e53823          	sd	a4,16(a0)
        if(tmp->next) tmp->next->prev = allocatedBlock;
    800022ac:	00873783          	ld	a5,8(a4)
    800022b0:	00078463          	beqz	a5,800022b8 <_ZN15MemoryAllocator9mem_allocEm+0x150>
    800022b4:	00a7b823          	sd	a0,16(a5)
        tmp->next = allocatedBlock;
    800022b8:	00a73423          	sd	a0,8(a4)
    800022bc:	fc9ff06f          	j	80002284 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    if(!size || !freeHead) return nullptr;
    800022c0:	00000513          	li	a0,0
    800022c4:	fc5ff06f          	j	80002288 <_ZN15MemoryAllocator9mem_allocEm+0x120>
    if(size > ((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR)) return nullptr;
    800022c8:	00000513          	li	a0,0
    800022cc:	fbdff06f          	j	80002288 <_ZN15MemoryAllocator9mem_allocEm+0x120>

00000000800022d0 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader>:
    if(block->prev) tryToJoin(block->prev);

    return 0;
}

void MemoryAllocator::tryToJoin(BlockHeader* block) {
    800022d0:	ff010113          	addi	sp,sp,-16
    800022d4:	00813423          	sd	s0,8(sp)
    800022d8:	01010413          	addi	s0,sp,16
    if(!block || !block->isFree) return;
    800022dc:	04050a63          	beqz	a0,80002330 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x60>
    800022e0:	01854783          	lbu	a5,24(a0)
    800022e4:	04078663          	beqz	a5,80002330 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x60>

    if(block->next && block->next->isFree && (char*)block + (block->size + HEADER_BLOCKS) * MEM_BLOCK_SIZE == (char*)block->next) {
    800022e8:	00853783          	ld	a5,8(a0)
    800022ec:	02078063          	beqz	a5,8000230c <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x3c>
    800022f0:	0187c703          	lbu	a4,24(a5)
    800022f4:	00070c63          	beqz	a4,8000230c <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x3c>
    800022f8:	00053683          	ld	a3,0(a0)
    800022fc:	00168713          	addi	a4,a3,1
    80002300:	00671713          	slli	a4,a4,0x6
    80002304:	00e50733          	add	a4,a0,a4
    80002308:	02e78a63          	beq	a5,a4,8000233c <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x6c>
        block->size += block->next->size + HEADER_BLOCKS;
        block->next = block->next->next;
        if(block->next) block->next->prev = block;
    }

    if(block->prev && block->prev->isFree && (char*)block->prev + (block->prev->size + HEADER_BLOCKS) * MEM_BLOCK_SIZE == (char*)block) {
    8000230c:	01053783          	ld	a5,16(a0)
    80002310:	02078063          	beqz	a5,80002330 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x60>
    80002314:	0187c703          	lbu	a4,24(a5)
    80002318:	00070c63          	beqz	a4,80002330 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x60>
    8000231c:	0007b683          	ld	a3,0(a5)
    80002320:	00168713          	addi	a4,a3,1
    80002324:	00671713          	slli	a4,a4,0x6
    80002328:	00e78733          	add	a4,a5,a4
    8000232c:	02a70a63          	beq	a4,a0,80002360 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x90>
        block->prev->size += block->size + HEADER_BLOCKS;
        block->prev->next = block->next;
        if(block->next) block->next->prev = block->prev;
    }
    80002330:	00813403          	ld	s0,8(sp)
    80002334:	01010113          	addi	sp,sp,16
    80002338:	00008067          	ret
        block->size += block->next->size + HEADER_BLOCKS;
    8000233c:	0007b703          	ld	a4,0(a5)
    80002340:	00e686b3          	add	a3,a3,a4
    80002344:	00168693          	addi	a3,a3,1
    80002348:	00d53023          	sd	a3,0(a0)
        block->next = block->next->next;
    8000234c:	0087b783          	ld	a5,8(a5)
    80002350:	00f53423          	sd	a5,8(a0)
        if(block->next) block->next->prev = block;
    80002354:	fa078ce3          	beqz	a5,8000230c <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x3c>
    80002358:	00a7b823          	sd	a0,16(a5)
    8000235c:	fb1ff06f          	j	8000230c <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x3c>
        block->prev->size += block->size + HEADER_BLOCKS;
    80002360:	00053703          	ld	a4,0(a0)
    80002364:	00e686b3          	add	a3,a3,a4
    80002368:	00168693          	addi	a3,a3,1
    8000236c:	00d7b023          	sd	a3,0(a5)
        block->prev->next = block->next;
    80002370:	01053703          	ld	a4,16(a0)
    80002374:	00853783          	ld	a5,8(a0)
    80002378:	00f73423          	sd	a5,8(a4)
        if(block->next) block->next->prev = block->prev;
    8000237c:	fa078ae3          	beqz	a5,80002330 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x60>
    80002380:	01053703          	ld	a4,16(a0)
    80002384:	00e7b823          	sd	a4,16(a5)
    80002388:	fa9ff06f          	j	80002330 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x60>

000000008000238c <_ZN15MemoryAllocator8mem_freeEPv>:
    if(!addr) return -1;
    8000238c:	12050e63          	beqz	a0,800024c8 <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
int MemoryAllocator::mem_free(void* addr) {
    80002390:	fe010113          	addi	sp,sp,-32
    80002394:	00113c23          	sd	ra,24(sp)
    80002398:	00813823          	sd	s0,16(sp)
    8000239c:	00913423          	sd	s1,8(sp)
    800023a0:	02010413          	addi	s0,sp,32
    800023a4:	00050493          	mv	s1,a0
    if(addr < HEAP_START_ADDR || addr >= HEAP_END_ADDR) return -2;
    800023a8:	00008797          	auipc	a5,0x8
    800023ac:	db87b783          	ld	a5,-584(a5) # 8000a160 <_GLOBAL_OFFSET_TABLE_+0x10>
    800023b0:	0007b783          	ld	a5,0(a5)
    800023b4:	10f56e63          	bltu	a0,a5,800024d0 <_ZN15MemoryAllocator8mem_freeEPv+0x144>
    800023b8:	00008797          	auipc	a5,0x8
    800023bc:	dc87b783          	ld	a5,-568(a5) # 8000a180 <_GLOBAL_OFFSET_TABLE_+0x30>
    800023c0:	0007b783          	ld	a5,0(a5)
    800023c4:	10f57a63          	bgeu	a0,a5,800024d8 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
    BlockHeader* block = (BlockHeader*)((char*)addr - MEM_BLOCK_SIZE);
    800023c8:	fc050513          	addi	a0,a0,-64
    if (block < allocHead) return -3;
    800023cc:	00008797          	auipc	a5,0x8
    800023d0:	e247b783          	ld	a5,-476(a5) # 8000a1f0 <_ZN15MemoryAllocator9allocHeadE>
    800023d4:	00f57863          	bgeu	a0,a5,800023e4 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    800023d8:	ffd00513          	li	a0,-3
    800023dc:	09c0006f          	j	80002478 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
        tmp = tmp->next;
    800023e0:	0087b783          	ld	a5,8(a5)
    while(tmp) {
    800023e4:	00078c63          	beqz	a5,800023fc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
        if(tmp == block && !block->isFree) {  //proveram jel blok sa datom addr bio alociran
    800023e8:	fea79ce3          	bne	a5,a0,800023e0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    800023ec:	fd84c703          	lbu	a4,-40(s1)
    800023f0:	fe0718e3          	bnez	a4,800023e0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
            isAllocated = true;
    800023f4:	00100793          	li	a5,1
    800023f8:	0080006f          	j	80002400 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    bool isAllocated = false;
    800023fc:	00000793          	li	a5,0
    if(!isAllocated) return -3;
    80002400:	0e078063          	beqz	a5,800024e0 <_ZN15MemoryAllocator8mem_freeEPv+0x154>
    if(block->prev) block->prev->next = block->next;
    80002404:	fd04b783          	ld	a5,-48(s1)
    80002408:	08078263          	beqz	a5,8000248c <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    8000240c:	fc84b703          	ld	a4,-56(s1)
    80002410:	00e7b423          	sd	a4,8(a5)
    if(block->next) block->next->prev = block->prev;
    80002414:	fc84b783          	ld	a5,-56(s1)
    80002418:	00078663          	beqz	a5,80002424 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
    8000241c:	fd04b703          	ld	a4,-48(s1)
    80002420:	00e7b823          	sd	a4,16(a5)
    block->isFree = true;
    80002424:	00100793          	li	a5,1
    80002428:	fcf48c23          	sb	a5,-40(s1)
    if(!freeHead || block < freeHead) { //ubacujem u listu slobodnih po adr
    8000242c:	00008797          	auipc	a5,0x8
    80002430:	dbc7b783          	ld	a5,-580(a5) # 8000a1e8 <_ZN15MemoryAllocator8freeHeadE>
    80002434:	00078463          	beqz	a5,8000243c <_ZN15MemoryAllocator8mem_freeEPv+0xb0>
    80002438:	06f57263          	bgeu	a0,a5,8000249c <_ZN15MemoryAllocator8mem_freeEPv+0x110>
        block->next = freeHead;
    8000243c:	fcf4b423          	sd	a5,-56(s1)
        block->prev = nullptr;
    80002440:	fc04b823          	sd	zero,-48(s1)
        if(freeHead) freeHead->prev = block;
    80002444:	00008797          	auipc	a5,0x8
    80002448:	da47b783          	ld	a5,-604(a5) # 8000a1e8 <_ZN15MemoryAllocator8freeHeadE>
    8000244c:	00078463          	beqz	a5,80002454 <_ZN15MemoryAllocator8mem_freeEPv+0xc8>
    80002450:	00a7b823          	sd	a0,16(a5)
        freeHead = block;
    80002454:	00008797          	auipc	a5,0x8
    80002458:	d8a7ba23          	sd	a0,-620(a5) # 8000a1e8 <_ZN15MemoryAllocator8freeHeadE>
    tryToJoin(block); //pokusavam spajanje
    8000245c:	00000097          	auipc	ra,0x0
    80002460:	e74080e7          	jalr	-396(ra) # 800022d0 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader>
    if(block->prev) tryToJoin(block->prev);
    80002464:	fd04b503          	ld	a0,-48(s1)
    80002468:	08050063          	beqz	a0,800024e8 <_ZN15MemoryAllocator8mem_freeEPv+0x15c>
    8000246c:	00000097          	auipc	ra,0x0
    80002470:	e64080e7          	jalr	-412(ra) # 800022d0 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader>
    return 0;
    80002474:	00000513          	li	a0,0
}
    80002478:	01813083          	ld	ra,24(sp)
    8000247c:	01013403          	ld	s0,16(sp)
    80002480:	00813483          	ld	s1,8(sp)
    80002484:	02010113          	addi	sp,sp,32
    80002488:	00008067          	ret
    else allocHead = block->next;
    8000248c:	fc84b783          	ld	a5,-56(s1)
    80002490:	00008717          	auipc	a4,0x8
    80002494:	d6f73023          	sd	a5,-672(a4) # 8000a1f0 <_ZN15MemoryAllocator9allocHeadE>
    80002498:	f7dff06f          	j	80002414 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        while(curr->next && curr->next < block) curr = curr->next;
    8000249c:	00078713          	mv	a4,a5
    800024a0:	0087b783          	ld	a5,8(a5)
    800024a4:	00078463          	beqz	a5,800024ac <_ZN15MemoryAllocator8mem_freeEPv+0x120>
    800024a8:	fea7eae3          	bltu	a5,a0,8000249c <_ZN15MemoryAllocator8mem_freeEPv+0x110>
        block->next = curr->next;
    800024ac:	fcf4b423          	sd	a5,-56(s1)
        block->prev = curr;
    800024b0:	fce4b823          	sd	a4,-48(s1)
        if(curr->next) curr->next->prev = block;
    800024b4:	00873783          	ld	a5,8(a4)
    800024b8:	00078463          	beqz	a5,800024c0 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    800024bc:	00a7b823          	sd	a0,16(a5)
        curr->next = block;
    800024c0:	00a73423          	sd	a0,8(a4)
    800024c4:	f99ff06f          	j	8000245c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    if(!addr) return -1;
    800024c8:	fff00513          	li	a0,-1
}
    800024cc:	00008067          	ret
    if(addr < HEAP_START_ADDR || addr >= HEAP_END_ADDR) return -2;
    800024d0:	ffe00513          	li	a0,-2
    800024d4:	fa5ff06f          	j	80002478 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    800024d8:	ffe00513          	li	a0,-2
    800024dc:	f9dff06f          	j	80002478 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    if(!isAllocated) return -3;
    800024e0:	ffd00513          	li	a0,-3
    800024e4:	f95ff06f          	j	80002478 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    return 0;
    800024e8:	00000513          	li	a0,0
    800024ec:	f8dff06f          	j	80002478 <_ZN15MemoryAllocator8mem_freeEPv+0xec>

00000000800024f0 <_ZN10SemaphoreCC1Ej>:
#include "../h/SemaphoreC.hpp"

SemaphoreC::SemaphoreC(unsigned init){
    800024f0:	ff010113          	addi	sp,sp,-16
    800024f4:	00813423          	sd	s0,8(sp)
    800024f8:	01010413          	addi	s0,sp,16
    List() : head(0), tail(0) {}
    800024fc:	00053423          	sd	zero,8(a0)
    80002500:	00053823          	sd	zero,16(a0)
    value = (int)init;
    80002504:	00b52023          	sw	a1,0(a0)
    mutexClosed = false;
    80002508:	00050c23          	sb	zero,24(a0)
}
    8000250c:	00813403          	ld	s0,8(sp)
    80002510:	01010113          	addi	sp,sp,16
    80002514:	00008067          	ret

0000000080002518 <_ZN10SemaphoreC9createSemEPPS_j>:

SemaphoreC *SemaphoreC::createSem(SemaphoreC **handle, unsigned init) {
    80002518:	fd010113          	addi	sp,sp,-48
    8000251c:	02113423          	sd	ra,40(sp)
    80002520:	02813023          	sd	s0,32(sp)
    80002524:	00913c23          	sd	s1,24(sp)
    80002528:	01213823          	sd	s2,16(sp)
    8000252c:	01313423          	sd	s3,8(sp)
    80002530:	03010413          	addi	s0,sp,48
    80002534:	00050913          	mv	s2,a0
    80002538:	00058993          	mv	s3,a1
    *handle = new SemaphoreC(init);
    8000253c:	02000513          	li	a0,32
    80002540:	fffff097          	auipc	ra,0xfffff
    80002544:	3a4080e7          	jalr	932(ra) # 800018e4 <_Znwm>
    80002548:	00050493          	mv	s1,a0
    8000254c:	00098593          	mv	a1,s3
    80002550:	00000097          	auipc	ra,0x0
    80002554:	fa0080e7          	jalr	-96(ra) # 800024f0 <_ZN10SemaphoreCC1Ej>
    80002558:	00993023          	sd	s1,0(s2)
    return *handle;
}
    8000255c:	00048513          	mv	a0,s1
    80002560:	02813083          	ld	ra,40(sp)
    80002564:	02013403          	ld	s0,32(sp)
    80002568:	01813483          	ld	s1,24(sp)
    8000256c:	01013903          	ld	s2,16(sp)
    80002570:	00813983          	ld	s3,8(sp)
    80002574:	03010113          	addi	sp,sp,48
    80002578:	00008067          	ret

000000008000257c <_ZN10SemaphoreC5blockEv>:

void SemaphoreC::block() {
    8000257c:	fe010113          	addi	sp,sp,-32
    80002580:	00113c23          	sd	ra,24(sp)
    80002584:	00813823          	sd	s0,16(sp)
    80002588:	00913423          	sd	s1,8(sp)
    8000258c:	01213023          	sd	s2,0(sp)
    80002590:	02010413          	addi	s0,sp,32
    80002594:	00050493          	mv	s1,a0
    TCB::running->setBlocked(true);
    80002598:	00008797          	auipc	a5,0x8
    8000259c:	be07b783          	ld	a5,-1056(a5) # 8000a178 <_GLOBAL_OFFSET_TABLE_+0x28>
    800025a0:	0007b903          	ld	s2,0(a5)
    void setBlocked(bool value){ blocked = value; }
    800025a4:	00100793          	li	a5,1
    800025a8:	02f904a3          	sb	a5,41(s2)
      Elem* newElem = new Elem(data, 0);
    800025ac:	01000513          	li	a0,16
    800025b0:	fffff097          	auipc	ra,0xfffff
    800025b4:	334080e7          	jalr	820(ra) # 800018e4 <_Znwm>
      Elem(T* data, Elem* next) : data(data), next(next) {}
    800025b8:	01253023          	sd	s2,0(a0)
    800025bc:	00053423          	sd	zero,8(a0)
      if(tail){
    800025c0:	0104b783          	ld	a5,16(s1)
    800025c4:	02078663          	beqz	a5,800025f0 <_ZN10SemaphoreC5blockEv+0x74>
        tail->next = newElem;
    800025c8:	00a7b423          	sd	a0,8(a5)
        tail = newElem;
    800025cc:	00a4b823          	sd	a0,16(s1)
    blocked.addLast(TCB::running);
    TCB::dispatch();
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	778080e7          	jalr	1912(ra) # 80001d48 <_ZN3TCB8dispatchEv>
}
    800025d8:	01813083          	ld	ra,24(sp)
    800025dc:	01013403          	ld	s0,16(sp)
    800025e0:	00813483          	ld	s1,8(sp)
    800025e4:	00013903          	ld	s2,0(sp)
    800025e8:	02010113          	addi	sp,sp,32
    800025ec:	00008067          	ret
      }else head = tail = newElem;
    800025f0:	00a4b823          	sd	a0,16(s1)
    800025f4:	00a4b423          	sd	a0,8(s1)
    800025f8:	fd9ff06f          	j	800025d0 <_ZN10SemaphoreC5blockEv+0x54>

00000000800025fc <_ZN10SemaphoreC7unblockEv>:

void SemaphoreC::unblock() {
    800025fc:	fe010113          	addi	sp,sp,-32
    80002600:	00113c23          	sd	ra,24(sp)
    80002604:	00813823          	sd	s0,16(sp)
    80002608:	00913423          	sd	s1,8(sp)
    8000260c:	02010413          	addi	s0,sp,32
    80002610:	00050793          	mv	a5,a0
      if(!head) return 0;
    80002614:	00853503          	ld	a0,8(a0)
    80002618:	04050463          	beqz	a0,80002660 <_ZN10SemaphoreC7unblockEv+0x64>
      head = head->next;
    8000261c:	00853703          	ld	a4,8(a0)
    80002620:	00e7b423          	sd	a4,8(a5)
      if(!head) tail = 0;
    80002624:	02070a63          	beqz	a4,80002658 <_ZN10SemaphoreC7unblockEv+0x5c>
      T* data = elem->data;
    80002628:	00053483          	ld	s1,0(a0)
      delete elem;
    8000262c:	fffff097          	auipc	ra,0xfffff
    80002630:	308080e7          	jalr	776(ra) # 80001934 <_ZdlPv>
    80002634:	020484a3          	sb	zero,41(s1)
    TCB* ready = blocked.removeFirst();
    ready->setBlocked(false);
    Scheduler::put(ready);
    80002638:	00048513          	mv	a0,s1
    8000263c:	fffff097          	auipc	ra,0xfffff
    80002640:	050080e7          	jalr	80(ra) # 8000168c <_ZN9Scheduler3putEP3TCB>
}
    80002644:	01813083          	ld	ra,24(sp)
    80002648:	01013403          	ld	s0,16(sp)
    8000264c:	00813483          	ld	s1,8(sp)
    80002650:	02010113          	addi	sp,sp,32
    80002654:	00008067          	ret
      if(!head) tail = 0;
    80002658:	0007b823          	sd	zero,16(a5)
    8000265c:	fcdff06f          	j	80002628 <_ZN10SemaphoreC7unblockEv+0x2c>
      if(!head) return 0;
    80002660:	00050493          	mv	s1,a0
    80002664:	fd1ff06f          	j	80002634 <_ZN10SemaphoreC7unblockEv+0x38>

0000000080002668 <_ZN10SemaphoreC4waitEv>:

int SemaphoreC::wait() {
    if(mutexClosed) return -1;
    80002668:	01854783          	lbu	a5,24(a0)
    8000266c:	04079663          	bnez	a5,800026b8 <_ZN10SemaphoreC4waitEv+0x50>
    if(--value < 0) block();
    80002670:	00052783          	lw	a5,0(a0)
    80002674:	fff7879b          	addiw	a5,a5,-1
    80002678:	00f52023          	sw	a5,0(a0)
    8000267c:	02079713          	slli	a4,a5,0x20
    80002680:	00074663          	bltz	a4,8000268c <_ZN10SemaphoreC4waitEv+0x24>
    return 0;
    80002684:	00000513          	li	a0,0
}
    80002688:	00008067          	ret
int SemaphoreC::wait() {
    8000268c:	ff010113          	addi	sp,sp,-16
    80002690:	00113423          	sd	ra,8(sp)
    80002694:	00813023          	sd	s0,0(sp)
    80002698:	01010413          	addi	s0,sp,16
    if(--value < 0) block();
    8000269c:	00000097          	auipc	ra,0x0
    800026a0:	ee0080e7          	jalr	-288(ra) # 8000257c <_ZN10SemaphoreC5blockEv>
    return 0;
    800026a4:	00000513          	li	a0,0
}
    800026a8:	00813083          	ld	ra,8(sp)
    800026ac:	00013403          	ld	s0,0(sp)
    800026b0:	01010113          	addi	sp,sp,16
    800026b4:	00008067          	ret
    if(mutexClosed) return -1;
    800026b8:	fff00513          	li	a0,-1
    800026bc:	00008067          	ret

00000000800026c0 <_ZN10SemaphoreC6signalEv>:

int SemaphoreC::signal() {
    if(mutexClosed) return -1;
    800026c0:	01854783          	lbu	a5,24(a0)
    800026c4:	04079663          	bnez	a5,80002710 <_ZN10SemaphoreC6signalEv+0x50>
    value++;
    800026c8:	00052783          	lw	a5,0(a0)
    800026cc:	0017879b          	addiw	a5,a5,1
    800026d0:	0007871b          	sext.w	a4,a5
    800026d4:	00f52023          	sw	a5,0(a0)
    if(value<=0) unblock();
    800026d8:	00e05663          	blez	a4,800026e4 <_ZN10SemaphoreC6signalEv+0x24>
    return 0;
    800026dc:	00000513          	li	a0,0
}
    800026e0:	00008067          	ret
int SemaphoreC::signal() {
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00113423          	sd	ra,8(sp)
    800026ec:	00813023          	sd	s0,0(sp)
    800026f0:	01010413          	addi	s0,sp,16
    if(value<=0) unblock();
    800026f4:	00000097          	auipc	ra,0x0
    800026f8:	f08080e7          	jalr	-248(ra) # 800025fc <_ZN10SemaphoreC7unblockEv>
    return 0;
    800026fc:	00000513          	li	a0,0
}
    80002700:	00813083          	ld	ra,8(sp)
    80002704:	00013403          	ld	s0,0(sp)
    80002708:	01010113          	addi	sp,sp,16
    8000270c:	00008067          	ret
    if(mutexClosed) return -1;
    80002710:	fff00513          	li	a0,-1
    80002714:	00008067          	ret

0000000080002718 <_ZN10SemaphoreC5closeEv>:

int SemaphoreC::close() {
    if(mutexClosed) return -1;
    80002718:	01854783          	lbu	a5,24(a0)
    8000271c:	04079263          	bnez	a5,80002760 <_ZN10SemaphoreC5closeEv+0x48>
int SemaphoreC::close() {
    80002720:	fe010113          	addi	sp,sp,-32
    80002724:	00113c23          	sd	ra,24(sp)
    80002728:	00813823          	sd	s0,16(sp)
    8000272c:	00913423          	sd	s1,8(sp)
    80002730:	02010413          	addi	s0,sp,32
    80002734:	00050493          	mv	s1,a0
    mutexClosed = true;
    80002738:	00100793          	li	a5,1
    8000273c:	00f50c23          	sb	a5,24(a0)
      delete elem;
      return returnData;
    }

    T* peekFirst(){
      if(!head) return 0;
    80002740:	0084b783          	ld	a5,8(s1)
    80002744:	02078263          	beqz	a5,80002768 <_ZN10SemaphoreC5closeEv+0x50>
      return head->data;
    80002748:	0007b783          	ld	a5,0(a5)
    while(blocked.peekFirst()) unblock();
    8000274c:	02078a63          	beqz	a5,80002780 <_ZN10SemaphoreC5closeEv+0x68>
    80002750:	00048513          	mv	a0,s1
    80002754:	00000097          	auipc	ra,0x0
    80002758:	ea8080e7          	jalr	-344(ra) # 800025fc <_ZN10SemaphoreC7unblockEv>
    8000275c:	fe5ff06f          	j	80002740 <_ZN10SemaphoreC5closeEv+0x28>
    if(mutexClosed) return -1;
    80002760:	fff00513          	li	a0,-1
    return 0;
}
    80002764:	00008067          	ret
    return 0;
    80002768:	00000513          	li	a0,0
}
    8000276c:	01813083          	ld	ra,24(sp)
    80002770:	01013403          	ld	s0,16(sp)
    80002774:	00813483          	ld	s1,8(sp)
    80002778:	02010113          	addi	sp,sp,32
    8000277c:	00008067          	ret
    return 0;
    80002780:	00000513          	li	a0,0
    80002784:	fe9ff06f          	j	8000276c <_ZN10SemaphoreC5closeEv+0x54>

0000000080002788 <_ZN10SemaphoreCD1Ev>:

SemaphoreC::~SemaphoreC() {
    80002788:	ff010113          	addi	sp,sp,-16
    8000278c:	00113423          	sd	ra,8(sp)
    80002790:	00813023          	sd	s0,0(sp)
    80002794:	01010413          	addi	s0,sp,16
    close();
    80002798:	00000097          	auipc	ra,0x0
    8000279c:	f80080e7          	jalr	-128(ra) # 80002718 <_ZN10SemaphoreC5closeEv>
}
    800027a0:	00813083          	ld	ra,8(sp)
    800027a4:	00013403          	ld	s0,0(sp)
    800027a8:	01010113          	addi	sp,sp,16
    800027ac:	00008067          	ret

00000000800027b0 <_ZN10SemaphoreC7tryWaitEv>:

int SemaphoreC::tryWait() { //neblokirajuca verzija wait
    800027b0:	ff010113          	addi	sp,sp,-16
    800027b4:	00813423          	sd	s0,8(sp)
    800027b8:	01010413          	addi	s0,sp,16
    if (mutexClosed) return -1;
    800027bc:	01854783          	lbu	a5,24(a0)
    800027c0:	02079a63          	bnez	a5,800027f4 <_ZN10SemaphoreC7tryWaitEv+0x44>
    if (--value < 0) { //ako semafor nije dostupan odmah se vraća sa rezultatom umesto da blokira nit
    800027c4:	00052703          	lw	a4,0(a0)
    800027c8:	fff7079b          	addiw	a5,a4,-1
    800027cc:	00f52023          	sw	a5,0(a0)
    800027d0:	02079693          	slli	a3,a5,0x20
    800027d4:	0006ca63          	bltz	a3,800027e8 <_ZN10SemaphoreC7tryWaitEv+0x38>
        ++value;
        return 0;
    }
    return 1;
    800027d8:	00100513          	li	a0,1
    800027dc:	00813403          	ld	s0,8(sp)
    800027e0:	01010113          	addi	sp,sp,16
    800027e4:	00008067          	ret
        ++value;
    800027e8:	00e52023          	sw	a4,0(a0)
        return 0;
    800027ec:	00000513          	li	a0,0
    800027f0:	fedff06f          	j	800027dc <_ZN10SemaphoreC7tryWaitEv+0x2c>
    if (mutexClosed) return -1;
    800027f4:	fff00513          	li	a0,-1
    800027f8:	fe5ff06f          	j	800027dc <_ZN10SemaphoreC7tryWaitEv+0x2c>

00000000800027fc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800027fc:	fe010113          	addi	sp,sp,-32
    80002800:	00113c23          	sd	ra,24(sp)
    80002804:	00813823          	sd	s0,16(sp)
    80002808:	00913423          	sd	s1,8(sp)
    8000280c:	01213023          	sd	s2,0(sp)
    80002810:	02010413          	addi	s0,sp,32
    80002814:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002818:	00000913          	li	s2,0
    8000281c:	00c0006f          	j	80002828 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 'z') {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	b40080e7          	jalr	-1216(ra) # 80001360 <_Z15thread_dispatchv>
    while ((key = getc()) != 'z') {
    80002828:	fffff097          	auipc	ra,0xfffff
    8000282c:	c88080e7          	jalr	-888(ra) # 800014b0 <_Z4getcv>
    80002830:	0005059b          	sext.w	a1,a0
    80002834:	07a00793          	li	a5,122
    80002838:	02f58a63          	beq	a1,a5,8000286c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000283c:	0084b503          	ld	a0,8(s1)
    80002840:	00003097          	auipc	ra,0x3
    80002844:	9fc080e7          	jalr	-1540(ra) # 8000523c <_ZN6Buffer3putEi>
        i++;
    80002848:	0019071b          	addiw	a4,s2,1
    8000284c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002850:	0004a683          	lw	a3,0(s1)
    80002854:	0026979b          	slliw	a5,a3,0x2
    80002858:	00d787bb          	addw	a5,a5,a3
    8000285c:	0017979b          	slliw	a5,a5,0x1
    80002860:	02f767bb          	remw	a5,a4,a5
    80002864:	fc0792e3          	bnez	a5,80002828 <_ZL16producerKeyboardPv+0x2c>
    80002868:	fb9ff06f          	j	80002820 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000286c:	00100793          	li	a5,1
    80002870:	00008717          	auipc	a4,0x8
    80002874:	98f72423          	sw	a5,-1656(a4) # 8000a1f8 <_ZL9threadEnd>
    data->buffer->put('!');
    80002878:	02100593          	li	a1,33
    8000287c:	0084b503          	ld	a0,8(s1)
    80002880:	00003097          	auipc	ra,0x3
    80002884:	9bc080e7          	jalr	-1604(ra) # 8000523c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80002888:	0104b503          	ld	a0,16(s1)
    8000288c:	fffff097          	auipc	ra,0xfffff
    80002890:	b8c080e7          	jalr	-1140(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>
}
    80002894:	01813083          	ld	ra,24(sp)
    80002898:	01013403          	ld	s0,16(sp)
    8000289c:	00813483          	ld	s1,8(sp)
    800028a0:	00013903          	ld	s2,0(sp)
    800028a4:	02010113          	addi	sp,sp,32
    800028a8:	00008067          	ret

00000000800028ac <_ZL8producerPv>:

static void producer(void *arg) {
    800028ac:	fe010113          	addi	sp,sp,-32
    800028b0:	00113c23          	sd	ra,24(sp)
    800028b4:	00813823          	sd	s0,16(sp)
    800028b8:	00913423          	sd	s1,8(sp)
    800028bc:	01213023          	sd	s2,0(sp)
    800028c0:	02010413          	addi	s0,sp,32
    800028c4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800028c8:	00000913          	li	s2,0
    800028cc:	00c0006f          	j	800028d8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	a90080e7          	jalr	-1392(ra) # 80001360 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800028d8:	00008797          	auipc	a5,0x8
    800028dc:	9207a783          	lw	a5,-1760(a5) # 8000a1f8 <_ZL9threadEnd>
    800028e0:	02079e63          	bnez	a5,8000291c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800028e4:	0004a583          	lw	a1,0(s1)
    800028e8:	0305859b          	addiw	a1,a1,48
    800028ec:	0084b503          	ld	a0,8(s1)
    800028f0:	00003097          	auipc	ra,0x3
    800028f4:	94c080e7          	jalr	-1716(ra) # 8000523c <_ZN6Buffer3putEi>
        i++;
    800028f8:	0019071b          	addiw	a4,s2,1
    800028fc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002900:	0004a683          	lw	a3,0(s1)
    80002904:	0026979b          	slliw	a5,a3,0x2
    80002908:	00d787bb          	addw	a5,a5,a3
    8000290c:	0017979b          	slliw	a5,a5,0x1
    80002910:	02f767bb          	remw	a5,a4,a5
    80002914:	fc0792e3          	bnez	a5,800028d8 <_ZL8producerPv+0x2c>
    80002918:	fb9ff06f          	j	800028d0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000291c:	0104b503          	ld	a0,16(s1)
    80002920:	fffff097          	auipc	ra,0xfffff
    80002924:	af8080e7          	jalr	-1288(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>
}
    80002928:	01813083          	ld	ra,24(sp)
    8000292c:	01013403          	ld	s0,16(sp)
    80002930:	00813483          	ld	s1,8(sp)
    80002934:	00013903          	ld	s2,0(sp)
    80002938:	02010113          	addi	sp,sp,32
    8000293c:	00008067          	ret

0000000080002940 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80002940:	fd010113          	addi	sp,sp,-48
    80002944:	02113423          	sd	ra,40(sp)
    80002948:	02813023          	sd	s0,32(sp)
    8000294c:	00913c23          	sd	s1,24(sp)
    80002950:	01213823          	sd	s2,16(sp)
    80002954:	01313423          	sd	s3,8(sp)
    80002958:	03010413          	addi	s0,sp,48
    8000295c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002960:	00000993          	li	s3,0
    80002964:	01c0006f          	j	80002980 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	9f8080e7          	jalr	-1544(ra) # 80001360 <_Z15thread_dispatchv>
    80002970:	0500006f          	j	800029c0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002974:	00a00513          	li	a0,10
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	b64080e7          	jalr	-1180(ra) # 800014dc <_Z4putcc>
    while (!threadEnd) {
    80002980:	00008797          	auipc	a5,0x8
    80002984:	8787a783          	lw	a5,-1928(a5) # 8000a1f8 <_ZL9threadEnd>
    80002988:	06079063          	bnez	a5,800029e8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    8000298c:	00893503          	ld	a0,8(s2)
    80002990:	00003097          	auipc	ra,0x3
    80002994:	93c080e7          	jalr	-1732(ra) # 800052cc <_ZN6Buffer3getEv>
        i++;
    80002998:	0019849b          	addiw	s1,s3,1
    8000299c:	0004899b          	sext.w	s3,s1
        putc(key);
    800029a0:	0ff57513          	andi	a0,a0,255
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	b38080e7          	jalr	-1224(ra) # 800014dc <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800029ac:	00092703          	lw	a4,0(s2)
    800029b0:	0027179b          	slliw	a5,a4,0x2
    800029b4:	00e787bb          	addw	a5,a5,a4
    800029b8:	02f4e7bb          	remw	a5,s1,a5
    800029bc:	fa0786e3          	beqz	a5,80002968 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800029c0:	05000793          	li	a5,80
    800029c4:	02f4e4bb          	remw	s1,s1,a5
    800029c8:	fa049ce3          	bnez	s1,80002980 <_ZL8consumerPv+0x40>
    800029cc:	fa9ff06f          	j	80002974 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800029d0:	00893503          	ld	a0,8(s2)
    800029d4:	00003097          	auipc	ra,0x3
    800029d8:	8f8080e7          	jalr	-1800(ra) # 800052cc <_ZN6Buffer3getEv>
        putc(key);
    800029dc:	0ff57513          	andi	a0,a0,255
    800029e0:	fffff097          	auipc	ra,0xfffff
    800029e4:	afc080e7          	jalr	-1284(ra) # 800014dc <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800029e8:	00893503          	ld	a0,8(s2)
    800029ec:	00003097          	auipc	ra,0x3
    800029f0:	96c080e7          	jalr	-1684(ra) # 80005358 <_ZN6Buffer6getCntEv>
    800029f4:	fca04ee3          	bgtz	a0,800029d0 <_ZL8consumerPv+0x90>
    }
    sem_signal(data->wait);
    800029f8:	01093503          	ld	a0,16(s2)
    800029fc:	fffff097          	auipc	ra,0xfffff
    80002a00:	a1c080e7          	jalr	-1508(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>
}
    80002a04:	02813083          	ld	ra,40(sp)
    80002a08:	02013403          	ld	s0,32(sp)
    80002a0c:	01813483          	ld	s1,24(sp)
    80002a10:	01013903          	ld	s2,16(sp)
    80002a14:	00813983          	ld	s3,8(sp)
    80002a18:	03010113          	addi	sp,sp,48
    80002a1c:	00008067          	ret

0000000080002a20 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80002a20:	f9010113          	addi	sp,sp,-112
    80002a24:	06113423          	sd	ra,104(sp)
    80002a28:	06813023          	sd	s0,96(sp)
    80002a2c:	04913c23          	sd	s1,88(sp)
    80002a30:	05213823          	sd	s2,80(sp)
    80002a34:	05313423          	sd	s3,72(sp)
    80002a38:	05413023          	sd	s4,64(sp)
    80002a3c:	03513c23          	sd	s5,56(sp)
    80002a40:	03613823          	sd	s6,48(sp)
    80002a44:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002a48:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002a4c:	00006517          	auipc	a0,0x6
    80002a50:	99450513          	addi	a0,a0,-1644 # 800083e0 <CONSOLE_STATUS+0x3d0>
    80002a54:	00002097          	auipc	ra,0x2
    80002a58:	a9c080e7          	jalr	-1380(ra) # 800044f0 <_Z11printStringPKc>
    getString(input, 30);
    80002a5c:	01e00593          	li	a1,30
    80002a60:	fa040493          	addi	s1,s0,-96
    80002a64:	00048513          	mv	a0,s1
    80002a68:	00002097          	auipc	ra,0x2
    80002a6c:	b10080e7          	jalr	-1264(ra) # 80004578 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002a70:	00048513          	mv	a0,s1
    80002a74:	00002097          	auipc	ra,0x2
    80002a78:	bdc080e7          	jalr	-1060(ra) # 80004650 <_Z11stringToIntPKc>
    80002a7c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002a80:	00006517          	auipc	a0,0x6
    80002a84:	98050513          	addi	a0,a0,-1664 # 80008400 <CONSOLE_STATUS+0x3f0>
    80002a88:	00002097          	auipc	ra,0x2
    80002a8c:	a68080e7          	jalr	-1432(ra) # 800044f0 <_Z11printStringPKc>
    getString(input, 30);
    80002a90:	01e00593          	li	a1,30
    80002a94:	00048513          	mv	a0,s1
    80002a98:	00002097          	auipc	ra,0x2
    80002a9c:	ae0080e7          	jalr	-1312(ra) # 80004578 <_Z9getStringPci>
    n = stringToInt(input);
    80002aa0:	00048513          	mv	a0,s1
    80002aa4:	00002097          	auipc	ra,0x2
    80002aa8:	bac080e7          	jalr	-1108(ra) # 80004650 <_Z11stringToIntPKc>
    80002aac:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002ab0:	00006517          	auipc	a0,0x6
    80002ab4:	97050513          	addi	a0,a0,-1680 # 80008420 <CONSOLE_STATUS+0x410>
    80002ab8:	00002097          	auipc	ra,0x2
    80002abc:	a38080e7          	jalr	-1480(ra) # 800044f0 <_Z11printStringPKc>
    80002ac0:	00000613          	li	a2,0
    80002ac4:	00a00593          	li	a1,10
    80002ac8:	00090513          	mv	a0,s2
    80002acc:	00002097          	auipc	ra,0x2
    80002ad0:	bd4080e7          	jalr	-1068(ra) # 800046a0 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002ad4:	00006517          	auipc	a0,0x6
    80002ad8:	96450513          	addi	a0,a0,-1692 # 80008438 <CONSOLE_STATUS+0x428>
    80002adc:	00002097          	auipc	ra,0x2
    80002ae0:	a14080e7          	jalr	-1516(ra) # 800044f0 <_Z11printStringPKc>
    80002ae4:	00000613          	li	a2,0
    80002ae8:	00a00593          	li	a1,10
    80002aec:	00048513          	mv	a0,s1
    80002af0:	00002097          	auipc	ra,0x2
    80002af4:	bb0080e7          	jalr	-1104(ra) # 800046a0 <_Z8printIntiii>
    printString(".\n");
    80002af8:	00006517          	auipc	a0,0x6
    80002afc:	95850513          	addi	a0,a0,-1704 # 80008450 <CONSOLE_STATUS+0x440>
    80002b00:	00002097          	auipc	ra,0x2
    80002b04:	9f0080e7          	jalr	-1552(ra) # 800044f0 <_Z11printStringPKc>
    if(threadNum > n) {
    80002b08:	0324c463          	blt	s1,s2,80002b30 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002b0c:	03205c63          	blez	s2,80002b44 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002b10:	03800513          	li	a0,56
    80002b14:	fffff097          	auipc	ra,0xfffff
    80002b18:	dd0080e7          	jalr	-560(ra) # 800018e4 <_Znwm>
    80002b1c:	00050a13          	mv	s4,a0
    80002b20:	00048593          	mv	a1,s1
    80002b24:	00002097          	auipc	ra,0x2
    80002b28:	67c080e7          	jalr	1660(ra) # 800051a0 <_ZN6BufferC1Ei>
    80002b2c:	0300006f          	j	80002b5c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002b30:	00006517          	auipc	a0,0x6
    80002b34:	92850513          	addi	a0,a0,-1752 # 80008458 <CONSOLE_STATUS+0x448>
    80002b38:	00002097          	auipc	ra,0x2
    80002b3c:	9b8080e7          	jalr	-1608(ra) # 800044f0 <_Z11printStringPKc>
        return;
    80002b40:	0140006f          	j	80002b54 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002b44:	00006517          	auipc	a0,0x6
    80002b48:	95450513          	addi	a0,a0,-1708 # 80008498 <CONSOLE_STATUS+0x488>
    80002b4c:	00002097          	auipc	ra,0x2
    80002b50:	9a4080e7          	jalr	-1628(ra) # 800044f0 <_Z11printStringPKc>
        return;
    80002b54:	000b0113          	mv	sp,s6
    80002b58:	1500006f          	j	80002ca8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002b5c:	00000593          	li	a1,0
    80002b60:	00007517          	auipc	a0,0x7
    80002b64:	6a050513          	addi	a0,a0,1696 # 8000a200 <_ZL10waitForAll>
    80002b68:	fffff097          	auipc	ra,0xfffff
    80002b6c:	81c080e7          	jalr	-2020(ra) # 80001384 <_Z8sem_openPP10SemaphoreCj>
    thread_t threads[threadNum];
    80002b70:	00391793          	slli	a5,s2,0x3
    80002b74:	00f78793          	addi	a5,a5,15
    80002b78:	ff07f793          	andi	a5,a5,-16
    80002b7c:	40f10133          	sub	sp,sp,a5
    80002b80:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002b84:	0019071b          	addiw	a4,s2,1
    80002b88:	00171793          	slli	a5,a4,0x1
    80002b8c:	00e787b3          	add	a5,a5,a4
    80002b90:	00379793          	slli	a5,a5,0x3
    80002b94:	00f78793          	addi	a5,a5,15
    80002b98:	ff07f793          	andi	a5,a5,-16
    80002b9c:	40f10133          	sub	sp,sp,a5
    80002ba0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80002ba4:	00191613          	slli	a2,s2,0x1
    80002ba8:	012607b3          	add	a5,a2,s2
    80002bac:	00379793          	slli	a5,a5,0x3
    80002bb0:	00f987b3          	add	a5,s3,a5
    80002bb4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002bb8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002bbc:	00007717          	auipc	a4,0x7
    80002bc0:	64473703          	ld	a4,1604(a4) # 8000a200 <_ZL10waitForAll>
    80002bc4:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80002bc8:	00078613          	mv	a2,a5
    80002bcc:	00000597          	auipc	a1,0x0
    80002bd0:	d7458593          	addi	a1,a1,-652 # 80002940 <_ZL8consumerPv>
    80002bd4:	f9840513          	addi	a0,s0,-104
    80002bd8:	ffffe097          	auipc	ra,0xffffe
    80002bdc:	6dc080e7          	jalr	1756(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002be0:	00000493          	li	s1,0
    80002be4:	0280006f          	j	80002c0c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80002be8:	00000597          	auipc	a1,0x0
    80002bec:	c1458593          	addi	a1,a1,-1004 # 800027fc <_ZL16producerKeyboardPv>
                      data + i);
    80002bf0:	00179613          	slli	a2,a5,0x1
    80002bf4:	00f60633          	add	a2,a2,a5
    80002bf8:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80002bfc:	00c98633          	add	a2,s3,a2
    80002c00:	ffffe097          	auipc	ra,0xffffe
    80002c04:	6b4080e7          	jalr	1716(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002c08:	0014849b          	addiw	s1,s1,1
    80002c0c:	0524d263          	bge	s1,s2,80002c50 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80002c10:	00149793          	slli	a5,s1,0x1
    80002c14:	009787b3          	add	a5,a5,s1
    80002c18:	00379793          	slli	a5,a5,0x3
    80002c1c:	00f987b3          	add	a5,s3,a5
    80002c20:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002c24:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80002c28:	00007717          	auipc	a4,0x7
    80002c2c:	5d873703          	ld	a4,1496(a4) # 8000a200 <_ZL10waitForAll>
    80002c30:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80002c34:	00048793          	mv	a5,s1
    80002c38:	00349513          	slli	a0,s1,0x3
    80002c3c:	00aa8533          	add	a0,s5,a0
    80002c40:	fa9054e3          	blez	s1,80002be8 <_Z22producerConsumer_C_APIv+0x1c8>
    80002c44:	00000597          	auipc	a1,0x0
    80002c48:	c6858593          	addi	a1,a1,-920 # 800028ac <_ZL8producerPv>
    80002c4c:	fa5ff06f          	j	80002bf0 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80002c50:	ffffe097          	auipc	ra,0xffffe
    80002c54:	710080e7          	jalr	1808(ra) # 80001360 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002c58:	00000493          	li	s1,0
    80002c5c:	00994e63          	blt	s2,s1,80002c78 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80002c60:	00007517          	auipc	a0,0x7
    80002c64:	5a053503          	ld	a0,1440(a0) # 8000a200 <_ZL10waitForAll>
    80002c68:	ffffe097          	auipc	ra,0xffffe
    80002c6c:	780080e7          	jalr	1920(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>
    for (int i = 0; i <= threadNum; i++) {
    80002c70:	0014849b          	addiw	s1,s1,1
    80002c74:	fe9ff06f          	j	80002c5c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002c78:	00007517          	auipc	a0,0x7
    80002c7c:	58853503          	ld	a0,1416(a0) # 8000a200 <_ZL10waitForAll>
    80002c80:	ffffe097          	auipc	ra,0xffffe
    80002c84:	738080e7          	jalr	1848(ra) # 800013b8 <_Z9sem_closeP10SemaphoreC>
    delete buffer;
    80002c88:	000a0e63          	beqz	s4,80002ca4 <_Z22producerConsumer_C_APIv+0x284>
    80002c8c:	000a0513          	mv	a0,s4
    80002c90:	00002097          	auipc	ra,0x2
    80002c94:	750080e7          	jalr	1872(ra) # 800053e0 <_ZN6BufferD1Ev>
    80002c98:	000a0513          	mv	a0,s4
    80002c9c:	fffff097          	auipc	ra,0xfffff
    80002ca0:	c98080e7          	jalr	-872(ra) # 80001934 <_ZdlPv>
    80002ca4:	000b0113          	mv	sp,s6

}
    80002ca8:	f9040113          	addi	sp,s0,-112
    80002cac:	06813083          	ld	ra,104(sp)
    80002cb0:	06013403          	ld	s0,96(sp)
    80002cb4:	05813483          	ld	s1,88(sp)
    80002cb8:	05013903          	ld	s2,80(sp)
    80002cbc:	04813983          	ld	s3,72(sp)
    80002cc0:	04013a03          	ld	s4,64(sp)
    80002cc4:	03813a83          	ld	s5,56(sp)
    80002cc8:	03013b03          	ld	s6,48(sp)
    80002ccc:	07010113          	addi	sp,sp,112
    80002cd0:	00008067          	ret
    80002cd4:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80002cd8:	000a0513          	mv	a0,s4
    80002cdc:	fffff097          	auipc	ra,0xfffff
    80002ce0:	c58080e7          	jalr	-936(ra) # 80001934 <_ZdlPv>
    80002ce4:	00048513          	mv	a0,s1
    80002ce8:	00008097          	auipc	ra,0x8
    80002cec:	610080e7          	jalr	1552(ra) # 8000b2f8 <_Unwind_Resume>

0000000080002cf0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002cf0:	fe010113          	addi	sp,sp,-32
    80002cf4:	00113c23          	sd	ra,24(sp)
    80002cf8:	00813823          	sd	s0,16(sp)
    80002cfc:	00913423          	sd	s1,8(sp)
    80002d00:	01213023          	sd	s2,0(sp)
    80002d04:	02010413          	addi	s0,sp,32
    80002d08:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002d0c:	00100793          	li	a5,1
    80002d10:	02a7f863          	bgeu	a5,a0,80002d40 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002d14:	00a00793          	li	a5,10
    80002d18:	02f577b3          	remu	a5,a0,a5
    80002d1c:	02078e63          	beqz	a5,80002d58 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002d20:	fff48513          	addi	a0,s1,-1
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	fcc080e7          	jalr	-52(ra) # 80002cf0 <_ZL9fibonaccim>
    80002d2c:	00050913          	mv	s2,a0
    80002d30:	ffe48513          	addi	a0,s1,-2
    80002d34:	00000097          	auipc	ra,0x0
    80002d38:	fbc080e7          	jalr	-68(ra) # 80002cf0 <_ZL9fibonaccim>
    80002d3c:	00a90533          	add	a0,s2,a0
}
    80002d40:	01813083          	ld	ra,24(sp)
    80002d44:	01013403          	ld	s0,16(sp)
    80002d48:	00813483          	ld	s1,8(sp)
    80002d4c:	00013903          	ld	s2,0(sp)
    80002d50:	02010113          	addi	sp,sp,32
    80002d54:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002d58:	ffffe097          	auipc	ra,0xffffe
    80002d5c:	608080e7          	jalr	1544(ra) # 80001360 <_Z15thread_dispatchv>
    80002d60:	fc1ff06f          	j	80002d20 <_ZL9fibonaccim+0x30>

0000000080002d64 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002d64:	fe010113          	addi	sp,sp,-32
    80002d68:	00113c23          	sd	ra,24(sp)
    80002d6c:	00813823          	sd	s0,16(sp)
    80002d70:	00913423          	sd	s1,8(sp)
    80002d74:	01213023          	sd	s2,0(sp)
    80002d78:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002d7c:	00000913          	li	s2,0
    80002d80:	0380006f          	j	80002db8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002d84:	ffffe097          	auipc	ra,0xffffe
    80002d88:	5dc080e7          	jalr	1500(ra) # 80001360 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002d8c:	00148493          	addi	s1,s1,1
    80002d90:	000027b7          	lui	a5,0x2
    80002d94:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002d98:	0097ee63          	bltu	a5,s1,80002db4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002d9c:	00000713          	li	a4,0
    80002da0:	000077b7          	lui	a5,0x7
    80002da4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002da8:	fce7eee3          	bltu	a5,a4,80002d84 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80002dac:	00170713          	addi	a4,a4,1
    80002db0:	ff1ff06f          	j	80002da0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002db4:	00190913          	addi	s2,s2,1
    80002db8:	00900793          	li	a5,9
    80002dbc:	0527e063          	bltu	a5,s2,80002dfc <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002dc0:	00005517          	auipc	a0,0x5
    80002dc4:	70850513          	addi	a0,a0,1800 # 800084c8 <CONSOLE_STATUS+0x4b8>
    80002dc8:	00001097          	auipc	ra,0x1
    80002dcc:	728080e7          	jalr	1832(ra) # 800044f0 <_Z11printStringPKc>
    80002dd0:	00000613          	li	a2,0
    80002dd4:	00a00593          	li	a1,10
    80002dd8:	0009051b          	sext.w	a0,s2
    80002ddc:	00002097          	auipc	ra,0x2
    80002de0:	8c4080e7          	jalr	-1852(ra) # 800046a0 <_Z8printIntiii>
    80002de4:	00005517          	auipc	a0,0x5
    80002de8:	3ac50513          	addi	a0,a0,940 # 80008190 <CONSOLE_STATUS+0x180>
    80002dec:	00001097          	auipc	ra,0x1
    80002df0:	704080e7          	jalr	1796(ra) # 800044f0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002df4:	00000493          	li	s1,0
    80002df8:	f99ff06f          	j	80002d90 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002dfc:	00005517          	auipc	a0,0x5
    80002e00:	6d450513          	addi	a0,a0,1748 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80002e04:	00001097          	auipc	ra,0x1
    80002e08:	6ec080e7          	jalr	1772(ra) # 800044f0 <_Z11printStringPKc>
    finishedA = true;
    80002e0c:	00100793          	li	a5,1
    80002e10:	00007717          	auipc	a4,0x7
    80002e14:	3ef70c23          	sb	a5,1016(a4) # 8000a208 <_ZL9finishedA>
}
    80002e18:	01813083          	ld	ra,24(sp)
    80002e1c:	01013403          	ld	s0,16(sp)
    80002e20:	00813483          	ld	s1,8(sp)
    80002e24:	00013903          	ld	s2,0(sp)
    80002e28:	02010113          	addi	sp,sp,32
    80002e2c:	00008067          	ret

0000000080002e30 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80002e30:	fe010113          	addi	sp,sp,-32
    80002e34:	00113c23          	sd	ra,24(sp)
    80002e38:	00813823          	sd	s0,16(sp)
    80002e3c:	00913423          	sd	s1,8(sp)
    80002e40:	01213023          	sd	s2,0(sp)
    80002e44:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002e48:	00000913          	li	s2,0
    80002e4c:	0380006f          	j	80002e84 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002e50:	ffffe097          	auipc	ra,0xffffe
    80002e54:	510080e7          	jalr	1296(ra) # 80001360 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002e58:	00148493          	addi	s1,s1,1
    80002e5c:	000027b7          	lui	a5,0x2
    80002e60:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002e64:	0097ee63          	bltu	a5,s1,80002e80 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002e68:	00000713          	li	a4,0
    80002e6c:	000077b7          	lui	a5,0x7
    80002e70:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002e74:	fce7eee3          	bltu	a5,a4,80002e50 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80002e78:	00170713          	addi	a4,a4,1
    80002e7c:	ff1ff06f          	j	80002e6c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80002e80:	00190913          	addi	s2,s2,1
    80002e84:	00f00793          	li	a5,15
    80002e88:	0527e063          	bltu	a5,s2,80002ec8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80002e8c:	00005517          	auipc	a0,0x5
    80002e90:	65450513          	addi	a0,a0,1620 # 800084e0 <CONSOLE_STATUS+0x4d0>
    80002e94:	00001097          	auipc	ra,0x1
    80002e98:	65c080e7          	jalr	1628(ra) # 800044f0 <_Z11printStringPKc>
    80002e9c:	00000613          	li	a2,0
    80002ea0:	00a00593          	li	a1,10
    80002ea4:	0009051b          	sext.w	a0,s2
    80002ea8:	00001097          	auipc	ra,0x1
    80002eac:	7f8080e7          	jalr	2040(ra) # 800046a0 <_Z8printIntiii>
    80002eb0:	00005517          	auipc	a0,0x5
    80002eb4:	2e050513          	addi	a0,a0,736 # 80008190 <CONSOLE_STATUS+0x180>
    80002eb8:	00001097          	auipc	ra,0x1
    80002ebc:	638080e7          	jalr	1592(ra) # 800044f0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002ec0:	00000493          	li	s1,0
    80002ec4:	f99ff06f          	j	80002e5c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80002ec8:	00005517          	auipc	a0,0x5
    80002ecc:	62050513          	addi	a0,a0,1568 # 800084e8 <CONSOLE_STATUS+0x4d8>
    80002ed0:	00001097          	auipc	ra,0x1
    80002ed4:	620080e7          	jalr	1568(ra) # 800044f0 <_Z11printStringPKc>
    finishedB = true;
    80002ed8:	00100793          	li	a5,1
    80002edc:	00007717          	auipc	a4,0x7
    80002ee0:	32f706a3          	sb	a5,813(a4) # 8000a209 <_ZL9finishedB>
    thread_dispatch();
    80002ee4:	ffffe097          	auipc	ra,0xffffe
    80002ee8:	47c080e7          	jalr	1148(ra) # 80001360 <_Z15thread_dispatchv>
}
    80002eec:	01813083          	ld	ra,24(sp)
    80002ef0:	01013403          	ld	s0,16(sp)
    80002ef4:	00813483          	ld	s1,8(sp)
    80002ef8:	00013903          	ld	s2,0(sp)
    80002efc:	02010113          	addi	sp,sp,32
    80002f00:	00008067          	ret

0000000080002f04 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002f04:	fe010113          	addi	sp,sp,-32
    80002f08:	00113c23          	sd	ra,24(sp)
    80002f0c:	00813823          	sd	s0,16(sp)
    80002f10:	00913423          	sd	s1,8(sp)
    80002f14:	01213023          	sd	s2,0(sp)
    80002f18:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002f1c:	00000493          	li	s1,0
    80002f20:	0400006f          	j	80002f60 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002f24:	00005517          	auipc	a0,0x5
    80002f28:	5d450513          	addi	a0,a0,1492 # 800084f8 <CONSOLE_STATUS+0x4e8>
    80002f2c:	00001097          	auipc	ra,0x1
    80002f30:	5c4080e7          	jalr	1476(ra) # 800044f0 <_Z11printStringPKc>
    80002f34:	00000613          	li	a2,0
    80002f38:	00a00593          	li	a1,10
    80002f3c:	00048513          	mv	a0,s1
    80002f40:	00001097          	auipc	ra,0x1
    80002f44:	760080e7          	jalr	1888(ra) # 800046a0 <_Z8printIntiii>
    80002f48:	00005517          	auipc	a0,0x5
    80002f4c:	24850513          	addi	a0,a0,584 # 80008190 <CONSOLE_STATUS+0x180>
    80002f50:	00001097          	auipc	ra,0x1
    80002f54:	5a0080e7          	jalr	1440(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002f58:	0014849b          	addiw	s1,s1,1
    80002f5c:	0ff4f493          	andi	s1,s1,255
    80002f60:	00200793          	li	a5,2
    80002f64:	fc97f0e3          	bgeu	a5,s1,80002f24 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80002f68:	00005517          	auipc	a0,0x5
    80002f6c:	59850513          	addi	a0,a0,1432 # 80008500 <CONSOLE_STATUS+0x4f0>
    80002f70:	00001097          	auipc	ra,0x1
    80002f74:	580080e7          	jalr	1408(ra) # 800044f0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002f78:	00700313          	li	t1,7
    thread_dispatch();
    80002f7c:	ffffe097          	auipc	ra,0xffffe
    80002f80:	3e4080e7          	jalr	996(ra) # 80001360 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002f84:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80002f88:	00005517          	auipc	a0,0x5
    80002f8c:	58850513          	addi	a0,a0,1416 # 80008510 <CONSOLE_STATUS+0x500>
    80002f90:	00001097          	auipc	ra,0x1
    80002f94:	560080e7          	jalr	1376(ra) # 800044f0 <_Z11printStringPKc>
    80002f98:	00000613          	li	a2,0
    80002f9c:	00a00593          	li	a1,10
    80002fa0:	0009051b          	sext.w	a0,s2
    80002fa4:	00001097          	auipc	ra,0x1
    80002fa8:	6fc080e7          	jalr	1788(ra) # 800046a0 <_Z8printIntiii>
    80002fac:	00005517          	auipc	a0,0x5
    80002fb0:	1e450513          	addi	a0,a0,484 # 80008190 <CONSOLE_STATUS+0x180>
    80002fb4:	00001097          	auipc	ra,0x1
    80002fb8:	53c080e7          	jalr	1340(ra) # 800044f0 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80002fbc:	00c00513          	li	a0,12
    80002fc0:	00000097          	auipc	ra,0x0
    80002fc4:	d30080e7          	jalr	-720(ra) # 80002cf0 <_ZL9fibonaccim>
    80002fc8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002fcc:	00005517          	auipc	a0,0x5
    80002fd0:	54c50513          	addi	a0,a0,1356 # 80008518 <CONSOLE_STATUS+0x508>
    80002fd4:	00001097          	auipc	ra,0x1
    80002fd8:	51c080e7          	jalr	1308(ra) # 800044f0 <_Z11printStringPKc>
    80002fdc:	00000613          	li	a2,0
    80002fe0:	00a00593          	li	a1,10
    80002fe4:	0009051b          	sext.w	a0,s2
    80002fe8:	00001097          	auipc	ra,0x1
    80002fec:	6b8080e7          	jalr	1720(ra) # 800046a0 <_Z8printIntiii>
    80002ff0:	00005517          	auipc	a0,0x5
    80002ff4:	1a050513          	addi	a0,a0,416 # 80008190 <CONSOLE_STATUS+0x180>
    80002ff8:	00001097          	auipc	ra,0x1
    80002ffc:	4f8080e7          	jalr	1272(ra) # 800044f0 <_Z11printStringPKc>
    80003000:	0400006f          	j	80003040 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003004:	00005517          	auipc	a0,0x5
    80003008:	4f450513          	addi	a0,a0,1268 # 800084f8 <CONSOLE_STATUS+0x4e8>
    8000300c:	00001097          	auipc	ra,0x1
    80003010:	4e4080e7          	jalr	1252(ra) # 800044f0 <_Z11printStringPKc>
    80003014:	00000613          	li	a2,0
    80003018:	00a00593          	li	a1,10
    8000301c:	00048513          	mv	a0,s1
    80003020:	00001097          	auipc	ra,0x1
    80003024:	680080e7          	jalr	1664(ra) # 800046a0 <_Z8printIntiii>
    80003028:	00005517          	auipc	a0,0x5
    8000302c:	16850513          	addi	a0,a0,360 # 80008190 <CONSOLE_STATUS+0x180>
    80003030:	00001097          	auipc	ra,0x1
    80003034:	4c0080e7          	jalr	1216(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003038:	0014849b          	addiw	s1,s1,1
    8000303c:	0ff4f493          	andi	s1,s1,255
    80003040:	00500793          	li	a5,5
    80003044:	fc97f0e3          	bgeu	a5,s1,80003004 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003048:	00005517          	auipc	a0,0x5
    8000304c:	48850513          	addi	a0,a0,1160 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003050:	00001097          	auipc	ra,0x1
    80003054:	4a0080e7          	jalr	1184(ra) # 800044f0 <_Z11printStringPKc>
    finishedC = true;
    80003058:	00100793          	li	a5,1
    8000305c:	00007717          	auipc	a4,0x7
    80003060:	1af70723          	sb	a5,430(a4) # 8000a20a <_ZL9finishedC>
    thread_dispatch();
    80003064:	ffffe097          	auipc	ra,0xffffe
    80003068:	2fc080e7          	jalr	764(ra) # 80001360 <_Z15thread_dispatchv>
}
    8000306c:	01813083          	ld	ra,24(sp)
    80003070:	01013403          	ld	s0,16(sp)
    80003074:	00813483          	ld	s1,8(sp)
    80003078:	00013903          	ld	s2,0(sp)
    8000307c:	02010113          	addi	sp,sp,32
    80003080:	00008067          	ret

0000000080003084 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003084:	fe010113          	addi	sp,sp,-32
    80003088:	00113c23          	sd	ra,24(sp)
    8000308c:	00813823          	sd	s0,16(sp)
    80003090:	00913423          	sd	s1,8(sp)
    80003094:	01213023          	sd	s2,0(sp)
    80003098:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000309c:	00a00493          	li	s1,10
    800030a0:	0400006f          	j	800030e0 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800030a4:	00005517          	auipc	a0,0x5
    800030a8:	48450513          	addi	a0,a0,1156 # 80008528 <CONSOLE_STATUS+0x518>
    800030ac:	00001097          	auipc	ra,0x1
    800030b0:	444080e7          	jalr	1092(ra) # 800044f0 <_Z11printStringPKc>
    800030b4:	00000613          	li	a2,0
    800030b8:	00a00593          	li	a1,10
    800030bc:	00048513          	mv	a0,s1
    800030c0:	00001097          	auipc	ra,0x1
    800030c4:	5e0080e7          	jalr	1504(ra) # 800046a0 <_Z8printIntiii>
    800030c8:	00005517          	auipc	a0,0x5
    800030cc:	0c850513          	addi	a0,a0,200 # 80008190 <CONSOLE_STATUS+0x180>
    800030d0:	00001097          	auipc	ra,0x1
    800030d4:	420080e7          	jalr	1056(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800030d8:	0014849b          	addiw	s1,s1,1
    800030dc:	0ff4f493          	andi	s1,s1,255
    800030e0:	00c00793          	li	a5,12
    800030e4:	fc97f0e3          	bgeu	a5,s1,800030a4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800030e8:	00005517          	auipc	a0,0x5
    800030ec:	44850513          	addi	a0,a0,1096 # 80008530 <CONSOLE_STATUS+0x520>
    800030f0:	00001097          	auipc	ra,0x1
    800030f4:	400080e7          	jalr	1024(ra) # 800044f0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800030f8:	00500313          	li	t1,5
    thread_dispatch();
    800030fc:	ffffe097          	auipc	ra,0xffffe
    80003100:	264080e7          	jalr	612(ra) # 80001360 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003104:	01000513          	li	a0,16
    80003108:	00000097          	auipc	ra,0x0
    8000310c:	be8080e7          	jalr	-1048(ra) # 80002cf0 <_ZL9fibonaccim>
    80003110:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003114:	00005517          	auipc	a0,0x5
    80003118:	42c50513          	addi	a0,a0,1068 # 80008540 <CONSOLE_STATUS+0x530>
    8000311c:	00001097          	auipc	ra,0x1
    80003120:	3d4080e7          	jalr	980(ra) # 800044f0 <_Z11printStringPKc>
    80003124:	00000613          	li	a2,0
    80003128:	00a00593          	li	a1,10
    8000312c:	0009051b          	sext.w	a0,s2
    80003130:	00001097          	auipc	ra,0x1
    80003134:	570080e7          	jalr	1392(ra) # 800046a0 <_Z8printIntiii>
    80003138:	00005517          	auipc	a0,0x5
    8000313c:	05850513          	addi	a0,a0,88 # 80008190 <CONSOLE_STATUS+0x180>
    80003140:	00001097          	auipc	ra,0x1
    80003144:	3b0080e7          	jalr	944(ra) # 800044f0 <_Z11printStringPKc>
    80003148:	0400006f          	j	80003188 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000314c:	00005517          	auipc	a0,0x5
    80003150:	3dc50513          	addi	a0,a0,988 # 80008528 <CONSOLE_STATUS+0x518>
    80003154:	00001097          	auipc	ra,0x1
    80003158:	39c080e7          	jalr	924(ra) # 800044f0 <_Z11printStringPKc>
    8000315c:	00000613          	li	a2,0
    80003160:	00a00593          	li	a1,10
    80003164:	00048513          	mv	a0,s1
    80003168:	00001097          	auipc	ra,0x1
    8000316c:	538080e7          	jalr	1336(ra) # 800046a0 <_Z8printIntiii>
    80003170:	00005517          	auipc	a0,0x5
    80003174:	02050513          	addi	a0,a0,32 # 80008190 <CONSOLE_STATUS+0x180>
    80003178:	00001097          	auipc	ra,0x1
    8000317c:	378080e7          	jalr	888(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003180:	0014849b          	addiw	s1,s1,1
    80003184:	0ff4f493          	andi	s1,s1,255
    80003188:	00f00793          	li	a5,15
    8000318c:	fc97f0e3          	bgeu	a5,s1,8000314c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003190:	00005517          	auipc	a0,0x5
    80003194:	3c050513          	addi	a0,a0,960 # 80008550 <CONSOLE_STATUS+0x540>
    80003198:	00001097          	auipc	ra,0x1
    8000319c:	358080e7          	jalr	856(ra) # 800044f0 <_Z11printStringPKc>
    finishedD = true;
    800031a0:	00100793          	li	a5,1
    800031a4:	00007717          	auipc	a4,0x7
    800031a8:	06f703a3          	sb	a5,103(a4) # 8000a20b <_ZL9finishedD>
    thread_dispatch();
    800031ac:	ffffe097          	auipc	ra,0xffffe
    800031b0:	1b4080e7          	jalr	436(ra) # 80001360 <_Z15thread_dispatchv>
}
    800031b4:	01813083          	ld	ra,24(sp)
    800031b8:	01013403          	ld	s0,16(sp)
    800031bc:	00813483          	ld	s1,8(sp)
    800031c0:	00013903          	ld	s2,0(sp)
    800031c4:	02010113          	addi	sp,sp,32
    800031c8:	00008067          	ret

00000000800031cc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800031cc:	fc010113          	addi	sp,sp,-64
    800031d0:	02113c23          	sd	ra,56(sp)
    800031d4:	02813823          	sd	s0,48(sp)
    800031d8:	02913423          	sd	s1,40(sp)
    800031dc:	03213023          	sd	s2,32(sp)
    800031e0:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800031e4:	02000513          	li	a0,32
    800031e8:	ffffe097          	auipc	ra,0xffffe
    800031ec:	6fc080e7          	jalr	1788(ra) # 800018e4 <_Znwm>
    800031f0:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800031f4:	fffff097          	auipc	ra,0xfffff
    800031f8:	86c080e7          	jalr	-1940(ra) # 80001a60 <_ZN6ThreadC1Ev>
    800031fc:	00007797          	auipc	a5,0x7
    80003200:	e3478793          	addi	a5,a5,-460 # 8000a030 <_ZTV7WorkerA+0x10>
    80003204:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003208:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000320c:	00005517          	auipc	a0,0x5
    80003210:	35450513          	addi	a0,a0,852 # 80008560 <CONSOLE_STATUS+0x550>
    80003214:	00001097          	auipc	ra,0x1
    80003218:	2dc080e7          	jalr	732(ra) # 800044f0 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000321c:	02000513          	li	a0,32
    80003220:	ffffe097          	auipc	ra,0xffffe
    80003224:	6c4080e7          	jalr	1732(ra) # 800018e4 <_Znwm>
    80003228:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000322c:	fffff097          	auipc	ra,0xfffff
    80003230:	834080e7          	jalr	-1996(ra) # 80001a60 <_ZN6ThreadC1Ev>
    80003234:	00007797          	auipc	a5,0x7
    80003238:	e2478793          	addi	a5,a5,-476 # 8000a058 <_ZTV7WorkerB+0x10>
    8000323c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003240:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003244:	00005517          	auipc	a0,0x5
    80003248:	33450513          	addi	a0,a0,820 # 80008578 <CONSOLE_STATUS+0x568>
    8000324c:	00001097          	auipc	ra,0x1
    80003250:	2a4080e7          	jalr	676(ra) # 800044f0 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003254:	02000513          	li	a0,32
    80003258:	ffffe097          	auipc	ra,0xffffe
    8000325c:	68c080e7          	jalr	1676(ra) # 800018e4 <_Znwm>
    80003260:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003264:	ffffe097          	auipc	ra,0xffffe
    80003268:	7fc080e7          	jalr	2044(ra) # 80001a60 <_ZN6ThreadC1Ev>
    8000326c:	00007797          	auipc	a5,0x7
    80003270:	e1478793          	addi	a5,a5,-492 # 8000a080 <_ZTV7WorkerC+0x10>
    80003274:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003278:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000327c:	00005517          	auipc	a0,0x5
    80003280:	31450513          	addi	a0,a0,788 # 80008590 <CONSOLE_STATUS+0x580>
    80003284:	00001097          	auipc	ra,0x1
    80003288:	26c080e7          	jalr	620(ra) # 800044f0 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    8000328c:	02000513          	li	a0,32
    80003290:	ffffe097          	auipc	ra,0xffffe
    80003294:	654080e7          	jalr	1620(ra) # 800018e4 <_Znwm>
    80003298:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    8000329c:	ffffe097          	auipc	ra,0xffffe
    800032a0:	7c4080e7          	jalr	1988(ra) # 80001a60 <_ZN6ThreadC1Ev>
    800032a4:	00007797          	auipc	a5,0x7
    800032a8:	e0478793          	addi	a5,a5,-508 # 8000a0a8 <_ZTV7WorkerD+0x10>
    800032ac:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800032b0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800032b4:	00005517          	auipc	a0,0x5
    800032b8:	2f450513          	addi	a0,a0,756 # 800085a8 <CONSOLE_STATUS+0x598>
    800032bc:	00001097          	auipc	ra,0x1
    800032c0:	234080e7          	jalr	564(ra) # 800044f0 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800032c4:	00000493          	li	s1,0
    800032c8:	00300793          	li	a5,3
    800032cc:	0297c663          	blt	a5,s1,800032f8 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800032d0:	00349793          	slli	a5,s1,0x3
    800032d4:	fe040713          	addi	a4,s0,-32
    800032d8:	00f707b3          	add	a5,a4,a5
    800032dc:	fe07b503          	ld	a0,-32(a5)
    800032e0:	ffffe097          	auipc	ra,0xffffe
    800032e4:	73c080e7          	jalr	1852(ra) # 80001a1c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800032e8:	0014849b          	addiw	s1,s1,1
    800032ec:	fddff06f          	j	800032c8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800032f0:	ffffe097          	auipc	ra,0xffffe
    800032f4:	7a4080e7          	jalr	1956(ra) # 80001a94 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800032f8:	00007797          	auipc	a5,0x7
    800032fc:	f107c783          	lbu	a5,-240(a5) # 8000a208 <_ZL9finishedA>
    80003300:	fe0788e3          	beqz	a5,800032f0 <_Z20Threads_CPP_API_testv+0x124>
    80003304:	00007797          	auipc	a5,0x7
    80003308:	f057c783          	lbu	a5,-251(a5) # 8000a209 <_ZL9finishedB>
    8000330c:	fe0782e3          	beqz	a5,800032f0 <_Z20Threads_CPP_API_testv+0x124>
    80003310:	00007797          	auipc	a5,0x7
    80003314:	efa7c783          	lbu	a5,-262(a5) # 8000a20a <_ZL9finishedC>
    80003318:	fc078ce3          	beqz	a5,800032f0 <_Z20Threads_CPP_API_testv+0x124>
    8000331c:	00007797          	auipc	a5,0x7
    80003320:	eef7c783          	lbu	a5,-273(a5) # 8000a20b <_ZL9finishedD>
    80003324:	fc0786e3          	beqz	a5,800032f0 <_Z20Threads_CPP_API_testv+0x124>
    80003328:	fc040493          	addi	s1,s0,-64
    8000332c:	0080006f          	j	80003334 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003330:	00848493          	addi	s1,s1,8
    80003334:	fe040793          	addi	a5,s0,-32
    80003338:	08f48663          	beq	s1,a5,800033c4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000333c:	0004b503          	ld	a0,0(s1)
    80003340:	fe0508e3          	beqz	a0,80003330 <_Z20Threads_CPP_API_testv+0x164>
    80003344:	00053783          	ld	a5,0(a0)
    80003348:	0087b783          	ld	a5,8(a5)
    8000334c:	000780e7          	jalr	a5
    80003350:	fe1ff06f          	j	80003330 <_Z20Threads_CPP_API_testv+0x164>
    80003354:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003358:	00048513          	mv	a0,s1
    8000335c:	ffffe097          	auipc	ra,0xffffe
    80003360:	5d8080e7          	jalr	1496(ra) # 80001934 <_ZdlPv>
    80003364:	00090513          	mv	a0,s2
    80003368:	00008097          	auipc	ra,0x8
    8000336c:	f90080e7          	jalr	-112(ra) # 8000b2f8 <_Unwind_Resume>
    80003370:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003374:	00048513          	mv	a0,s1
    80003378:	ffffe097          	auipc	ra,0xffffe
    8000337c:	5bc080e7          	jalr	1468(ra) # 80001934 <_ZdlPv>
    80003380:	00090513          	mv	a0,s2
    80003384:	00008097          	auipc	ra,0x8
    80003388:	f74080e7          	jalr	-140(ra) # 8000b2f8 <_Unwind_Resume>
    8000338c:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003390:	00048513          	mv	a0,s1
    80003394:	ffffe097          	auipc	ra,0xffffe
    80003398:	5a0080e7          	jalr	1440(ra) # 80001934 <_ZdlPv>
    8000339c:	00090513          	mv	a0,s2
    800033a0:	00008097          	auipc	ra,0x8
    800033a4:	f58080e7          	jalr	-168(ra) # 8000b2f8 <_Unwind_Resume>
    800033a8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800033ac:	00048513          	mv	a0,s1
    800033b0:	ffffe097          	auipc	ra,0xffffe
    800033b4:	584080e7          	jalr	1412(ra) # 80001934 <_ZdlPv>
    800033b8:	00090513          	mv	a0,s2
    800033bc:	00008097          	auipc	ra,0x8
    800033c0:	f3c080e7          	jalr	-196(ra) # 8000b2f8 <_Unwind_Resume>
}
    800033c4:	03813083          	ld	ra,56(sp)
    800033c8:	03013403          	ld	s0,48(sp)
    800033cc:	02813483          	ld	s1,40(sp)
    800033d0:	02013903          	ld	s2,32(sp)
    800033d4:	04010113          	addi	sp,sp,64
    800033d8:	00008067          	ret

00000000800033dc <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800033dc:	ff010113          	addi	sp,sp,-16
    800033e0:	00113423          	sd	ra,8(sp)
    800033e4:	00813023          	sd	s0,0(sp)
    800033e8:	01010413          	addi	s0,sp,16
    800033ec:	00007797          	auipc	a5,0x7
    800033f0:	c4478793          	addi	a5,a5,-956 # 8000a030 <_ZTV7WorkerA+0x10>
    800033f4:	00f53023          	sd	a5,0(a0)
    800033f8:	ffffe097          	auipc	ra,0xffffe
    800033fc:	470080e7          	jalr	1136(ra) # 80001868 <_ZN6ThreadD1Ev>
    80003400:	00813083          	ld	ra,8(sp)
    80003404:	00013403          	ld	s0,0(sp)
    80003408:	01010113          	addi	sp,sp,16
    8000340c:	00008067          	ret

0000000080003410 <_ZN7WorkerAD0Ev>:
    80003410:	fe010113          	addi	sp,sp,-32
    80003414:	00113c23          	sd	ra,24(sp)
    80003418:	00813823          	sd	s0,16(sp)
    8000341c:	00913423          	sd	s1,8(sp)
    80003420:	02010413          	addi	s0,sp,32
    80003424:	00050493          	mv	s1,a0
    80003428:	00007797          	auipc	a5,0x7
    8000342c:	c0878793          	addi	a5,a5,-1016 # 8000a030 <_ZTV7WorkerA+0x10>
    80003430:	00f53023          	sd	a5,0(a0)
    80003434:	ffffe097          	auipc	ra,0xffffe
    80003438:	434080e7          	jalr	1076(ra) # 80001868 <_ZN6ThreadD1Ev>
    8000343c:	00048513          	mv	a0,s1
    80003440:	ffffe097          	auipc	ra,0xffffe
    80003444:	4f4080e7          	jalr	1268(ra) # 80001934 <_ZdlPv>
    80003448:	01813083          	ld	ra,24(sp)
    8000344c:	01013403          	ld	s0,16(sp)
    80003450:	00813483          	ld	s1,8(sp)
    80003454:	02010113          	addi	sp,sp,32
    80003458:	00008067          	ret

000000008000345c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000345c:	ff010113          	addi	sp,sp,-16
    80003460:	00113423          	sd	ra,8(sp)
    80003464:	00813023          	sd	s0,0(sp)
    80003468:	01010413          	addi	s0,sp,16
    8000346c:	00007797          	auipc	a5,0x7
    80003470:	bec78793          	addi	a5,a5,-1044 # 8000a058 <_ZTV7WorkerB+0x10>
    80003474:	00f53023          	sd	a5,0(a0)
    80003478:	ffffe097          	auipc	ra,0xffffe
    8000347c:	3f0080e7          	jalr	1008(ra) # 80001868 <_ZN6ThreadD1Ev>
    80003480:	00813083          	ld	ra,8(sp)
    80003484:	00013403          	ld	s0,0(sp)
    80003488:	01010113          	addi	sp,sp,16
    8000348c:	00008067          	ret

0000000080003490 <_ZN7WorkerBD0Ev>:
    80003490:	fe010113          	addi	sp,sp,-32
    80003494:	00113c23          	sd	ra,24(sp)
    80003498:	00813823          	sd	s0,16(sp)
    8000349c:	00913423          	sd	s1,8(sp)
    800034a0:	02010413          	addi	s0,sp,32
    800034a4:	00050493          	mv	s1,a0
    800034a8:	00007797          	auipc	a5,0x7
    800034ac:	bb078793          	addi	a5,a5,-1104 # 8000a058 <_ZTV7WorkerB+0x10>
    800034b0:	00f53023          	sd	a5,0(a0)
    800034b4:	ffffe097          	auipc	ra,0xffffe
    800034b8:	3b4080e7          	jalr	948(ra) # 80001868 <_ZN6ThreadD1Ev>
    800034bc:	00048513          	mv	a0,s1
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	474080e7          	jalr	1140(ra) # 80001934 <_ZdlPv>
    800034c8:	01813083          	ld	ra,24(sp)
    800034cc:	01013403          	ld	s0,16(sp)
    800034d0:	00813483          	ld	s1,8(sp)
    800034d4:	02010113          	addi	sp,sp,32
    800034d8:	00008067          	ret

00000000800034dc <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800034dc:	ff010113          	addi	sp,sp,-16
    800034e0:	00113423          	sd	ra,8(sp)
    800034e4:	00813023          	sd	s0,0(sp)
    800034e8:	01010413          	addi	s0,sp,16
    800034ec:	00007797          	auipc	a5,0x7
    800034f0:	b9478793          	addi	a5,a5,-1132 # 8000a080 <_ZTV7WorkerC+0x10>
    800034f4:	00f53023          	sd	a5,0(a0)
    800034f8:	ffffe097          	auipc	ra,0xffffe
    800034fc:	370080e7          	jalr	880(ra) # 80001868 <_ZN6ThreadD1Ev>
    80003500:	00813083          	ld	ra,8(sp)
    80003504:	00013403          	ld	s0,0(sp)
    80003508:	01010113          	addi	sp,sp,16
    8000350c:	00008067          	ret

0000000080003510 <_ZN7WorkerCD0Ev>:
    80003510:	fe010113          	addi	sp,sp,-32
    80003514:	00113c23          	sd	ra,24(sp)
    80003518:	00813823          	sd	s0,16(sp)
    8000351c:	00913423          	sd	s1,8(sp)
    80003520:	02010413          	addi	s0,sp,32
    80003524:	00050493          	mv	s1,a0
    80003528:	00007797          	auipc	a5,0x7
    8000352c:	b5878793          	addi	a5,a5,-1192 # 8000a080 <_ZTV7WorkerC+0x10>
    80003530:	00f53023          	sd	a5,0(a0)
    80003534:	ffffe097          	auipc	ra,0xffffe
    80003538:	334080e7          	jalr	820(ra) # 80001868 <_ZN6ThreadD1Ev>
    8000353c:	00048513          	mv	a0,s1
    80003540:	ffffe097          	auipc	ra,0xffffe
    80003544:	3f4080e7          	jalr	1012(ra) # 80001934 <_ZdlPv>
    80003548:	01813083          	ld	ra,24(sp)
    8000354c:	01013403          	ld	s0,16(sp)
    80003550:	00813483          	ld	s1,8(sp)
    80003554:	02010113          	addi	sp,sp,32
    80003558:	00008067          	ret

000000008000355c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000355c:	ff010113          	addi	sp,sp,-16
    80003560:	00113423          	sd	ra,8(sp)
    80003564:	00813023          	sd	s0,0(sp)
    80003568:	01010413          	addi	s0,sp,16
    8000356c:	00007797          	auipc	a5,0x7
    80003570:	b3c78793          	addi	a5,a5,-1220 # 8000a0a8 <_ZTV7WorkerD+0x10>
    80003574:	00f53023          	sd	a5,0(a0)
    80003578:	ffffe097          	auipc	ra,0xffffe
    8000357c:	2f0080e7          	jalr	752(ra) # 80001868 <_ZN6ThreadD1Ev>
    80003580:	00813083          	ld	ra,8(sp)
    80003584:	00013403          	ld	s0,0(sp)
    80003588:	01010113          	addi	sp,sp,16
    8000358c:	00008067          	ret

0000000080003590 <_ZN7WorkerDD0Ev>:
    80003590:	fe010113          	addi	sp,sp,-32
    80003594:	00113c23          	sd	ra,24(sp)
    80003598:	00813823          	sd	s0,16(sp)
    8000359c:	00913423          	sd	s1,8(sp)
    800035a0:	02010413          	addi	s0,sp,32
    800035a4:	00050493          	mv	s1,a0
    800035a8:	00007797          	auipc	a5,0x7
    800035ac:	b0078793          	addi	a5,a5,-1280 # 8000a0a8 <_ZTV7WorkerD+0x10>
    800035b0:	00f53023          	sd	a5,0(a0)
    800035b4:	ffffe097          	auipc	ra,0xffffe
    800035b8:	2b4080e7          	jalr	692(ra) # 80001868 <_ZN6ThreadD1Ev>
    800035bc:	00048513          	mv	a0,s1
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	374080e7          	jalr	884(ra) # 80001934 <_ZdlPv>
    800035c8:	01813083          	ld	ra,24(sp)
    800035cc:	01013403          	ld	s0,16(sp)
    800035d0:	00813483          	ld	s1,8(sp)
    800035d4:	02010113          	addi	sp,sp,32
    800035d8:	00008067          	ret

00000000800035dc <_ZN7WorkerA3runEv>:
    void run() override {
    800035dc:	ff010113          	addi	sp,sp,-16
    800035e0:	00113423          	sd	ra,8(sp)
    800035e4:	00813023          	sd	s0,0(sp)
    800035e8:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800035ec:	00000593          	li	a1,0
    800035f0:	fffff097          	auipc	ra,0xfffff
    800035f4:	774080e7          	jalr	1908(ra) # 80002d64 <_ZN7WorkerA11workerBodyAEPv>
    }
    800035f8:	00813083          	ld	ra,8(sp)
    800035fc:	00013403          	ld	s0,0(sp)
    80003600:	01010113          	addi	sp,sp,16
    80003604:	00008067          	ret

0000000080003608 <_ZN7WorkerB3runEv>:
    void run() override {
    80003608:	ff010113          	addi	sp,sp,-16
    8000360c:	00113423          	sd	ra,8(sp)
    80003610:	00813023          	sd	s0,0(sp)
    80003614:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003618:	00000593          	li	a1,0
    8000361c:	00000097          	auipc	ra,0x0
    80003620:	814080e7          	jalr	-2028(ra) # 80002e30 <_ZN7WorkerB11workerBodyBEPv>
    }
    80003624:	00813083          	ld	ra,8(sp)
    80003628:	00013403          	ld	s0,0(sp)
    8000362c:	01010113          	addi	sp,sp,16
    80003630:	00008067          	ret

0000000080003634 <_ZN7WorkerC3runEv>:
    void run() override {
    80003634:	ff010113          	addi	sp,sp,-16
    80003638:	00113423          	sd	ra,8(sp)
    8000363c:	00813023          	sd	s0,0(sp)
    80003640:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003644:	00000593          	li	a1,0
    80003648:	00000097          	auipc	ra,0x0
    8000364c:	8bc080e7          	jalr	-1860(ra) # 80002f04 <_ZN7WorkerC11workerBodyCEPv>
    }
    80003650:	00813083          	ld	ra,8(sp)
    80003654:	00013403          	ld	s0,0(sp)
    80003658:	01010113          	addi	sp,sp,16
    8000365c:	00008067          	ret

0000000080003660 <_ZN7WorkerD3runEv>:
    void run() override {
    80003660:	ff010113          	addi	sp,sp,-16
    80003664:	00113423          	sd	ra,8(sp)
    80003668:	00813023          	sd	s0,0(sp)
    8000366c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003670:	00000593          	li	a1,0
    80003674:	00000097          	auipc	ra,0x0
    80003678:	a10080e7          	jalr	-1520(ra) # 80003084 <_ZN7WorkerD11workerBodyDEPv>
    }
    8000367c:	00813083          	ld	ra,8(sp)
    80003680:	00013403          	ld	s0,0(sp)
    80003684:	01010113          	addi	sp,sp,16
    80003688:	00008067          	ret

000000008000368c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000368c:	fe010113          	addi	sp,sp,-32
    80003690:	00113c23          	sd	ra,24(sp)
    80003694:	00813823          	sd	s0,16(sp)
    80003698:	00913423          	sd	s1,8(sp)
    8000369c:	01213023          	sd	s2,0(sp)
    800036a0:	02010413          	addi	s0,sp,32
    800036a4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800036a8:	00100793          	li	a5,1
    800036ac:	02a7f863          	bgeu	a5,a0,800036dc <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800036b0:	00a00793          	li	a5,10
    800036b4:	02f577b3          	remu	a5,a0,a5
    800036b8:	02078e63          	beqz	a5,800036f4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800036bc:	fff48513          	addi	a0,s1,-1
    800036c0:	00000097          	auipc	ra,0x0
    800036c4:	fcc080e7          	jalr	-52(ra) # 8000368c <_ZL9fibonaccim>
    800036c8:	00050913          	mv	s2,a0
    800036cc:	ffe48513          	addi	a0,s1,-2
    800036d0:	00000097          	auipc	ra,0x0
    800036d4:	fbc080e7          	jalr	-68(ra) # 8000368c <_ZL9fibonaccim>
    800036d8:	00a90533          	add	a0,s2,a0
}
    800036dc:	01813083          	ld	ra,24(sp)
    800036e0:	01013403          	ld	s0,16(sp)
    800036e4:	00813483          	ld	s1,8(sp)
    800036e8:	00013903          	ld	s2,0(sp)
    800036ec:	02010113          	addi	sp,sp,32
    800036f0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800036f4:	ffffe097          	auipc	ra,0xffffe
    800036f8:	c6c080e7          	jalr	-916(ra) # 80001360 <_Z15thread_dispatchv>
    800036fc:	fc1ff06f          	j	800036bc <_ZL9fibonaccim+0x30>

0000000080003700 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80003700:	fe010113          	addi	sp,sp,-32
    80003704:	00113c23          	sd	ra,24(sp)
    80003708:	00813823          	sd	s0,16(sp)
    8000370c:	00913423          	sd	s1,8(sp)
    80003710:	01213023          	sd	s2,0(sp)
    80003714:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003718:	00a00493          	li	s1,10
    8000371c:	0400006f          	j	8000375c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003720:	00005517          	auipc	a0,0x5
    80003724:	e0850513          	addi	a0,a0,-504 # 80008528 <CONSOLE_STATUS+0x518>
    80003728:	00001097          	auipc	ra,0x1
    8000372c:	dc8080e7          	jalr	-568(ra) # 800044f0 <_Z11printStringPKc>
    80003730:	00000613          	li	a2,0
    80003734:	00a00593          	li	a1,10
    80003738:	00048513          	mv	a0,s1
    8000373c:	00001097          	auipc	ra,0x1
    80003740:	f64080e7          	jalr	-156(ra) # 800046a0 <_Z8printIntiii>
    80003744:	00005517          	auipc	a0,0x5
    80003748:	a4c50513          	addi	a0,a0,-1460 # 80008190 <CONSOLE_STATUS+0x180>
    8000374c:	00001097          	auipc	ra,0x1
    80003750:	da4080e7          	jalr	-604(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003754:	0014849b          	addiw	s1,s1,1
    80003758:	0ff4f493          	andi	s1,s1,255
    8000375c:	00c00793          	li	a5,12
    80003760:	fc97f0e3          	bgeu	a5,s1,80003720 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003764:	00005517          	auipc	a0,0x5
    80003768:	dcc50513          	addi	a0,a0,-564 # 80008530 <CONSOLE_STATUS+0x520>
    8000376c:	00001097          	auipc	ra,0x1
    80003770:	d84080e7          	jalr	-636(ra) # 800044f0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003774:	00500313          	li	t1,5
    thread_dispatch();
    80003778:	ffffe097          	auipc	ra,0xffffe
    8000377c:	be8080e7          	jalr	-1048(ra) # 80001360 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003780:	01000513          	li	a0,16
    80003784:	00000097          	auipc	ra,0x0
    80003788:	f08080e7          	jalr	-248(ra) # 8000368c <_ZL9fibonaccim>
    8000378c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003790:	00005517          	auipc	a0,0x5
    80003794:	db050513          	addi	a0,a0,-592 # 80008540 <CONSOLE_STATUS+0x530>
    80003798:	00001097          	auipc	ra,0x1
    8000379c:	d58080e7          	jalr	-680(ra) # 800044f0 <_Z11printStringPKc>
    800037a0:	00000613          	li	a2,0
    800037a4:	00a00593          	li	a1,10
    800037a8:	0009051b          	sext.w	a0,s2
    800037ac:	00001097          	auipc	ra,0x1
    800037b0:	ef4080e7          	jalr	-268(ra) # 800046a0 <_Z8printIntiii>
    800037b4:	00005517          	auipc	a0,0x5
    800037b8:	9dc50513          	addi	a0,a0,-1572 # 80008190 <CONSOLE_STATUS+0x180>
    800037bc:	00001097          	auipc	ra,0x1
    800037c0:	d34080e7          	jalr	-716(ra) # 800044f0 <_Z11printStringPKc>
    800037c4:	0400006f          	j	80003804 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800037c8:	00005517          	auipc	a0,0x5
    800037cc:	d6050513          	addi	a0,a0,-672 # 80008528 <CONSOLE_STATUS+0x518>
    800037d0:	00001097          	auipc	ra,0x1
    800037d4:	d20080e7          	jalr	-736(ra) # 800044f0 <_Z11printStringPKc>
    800037d8:	00000613          	li	a2,0
    800037dc:	00a00593          	li	a1,10
    800037e0:	00048513          	mv	a0,s1
    800037e4:	00001097          	auipc	ra,0x1
    800037e8:	ebc080e7          	jalr	-324(ra) # 800046a0 <_Z8printIntiii>
    800037ec:	00005517          	auipc	a0,0x5
    800037f0:	9a450513          	addi	a0,a0,-1628 # 80008190 <CONSOLE_STATUS+0x180>
    800037f4:	00001097          	auipc	ra,0x1
    800037f8:	cfc080e7          	jalr	-772(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800037fc:	0014849b          	addiw	s1,s1,1
    80003800:	0ff4f493          	andi	s1,s1,255
    80003804:	00f00793          	li	a5,15
    80003808:	fc97f0e3          	bgeu	a5,s1,800037c8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000380c:	00005517          	auipc	a0,0x5
    80003810:	d4450513          	addi	a0,a0,-700 # 80008550 <CONSOLE_STATUS+0x540>
    80003814:	00001097          	auipc	ra,0x1
    80003818:	cdc080e7          	jalr	-804(ra) # 800044f0 <_Z11printStringPKc>
    finishedD = true;
    8000381c:	00100793          	li	a5,1
    80003820:	00007717          	auipc	a4,0x7
    80003824:	9ef70623          	sb	a5,-1556(a4) # 8000a20c <_ZL9finishedD>
    thread_dispatch();
    80003828:	ffffe097          	auipc	ra,0xffffe
    8000382c:	b38080e7          	jalr	-1224(ra) # 80001360 <_Z15thread_dispatchv>
}
    80003830:	01813083          	ld	ra,24(sp)
    80003834:	01013403          	ld	s0,16(sp)
    80003838:	00813483          	ld	s1,8(sp)
    8000383c:	00013903          	ld	s2,0(sp)
    80003840:	02010113          	addi	sp,sp,32
    80003844:	00008067          	ret

0000000080003848 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003848:	fe010113          	addi	sp,sp,-32
    8000384c:	00113c23          	sd	ra,24(sp)
    80003850:	00813823          	sd	s0,16(sp)
    80003854:	00913423          	sd	s1,8(sp)
    80003858:	01213023          	sd	s2,0(sp)
    8000385c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003860:	00000493          	li	s1,0
    80003864:	0400006f          	j	800038a4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003868:	00005517          	auipc	a0,0x5
    8000386c:	c9050513          	addi	a0,a0,-880 # 800084f8 <CONSOLE_STATUS+0x4e8>
    80003870:	00001097          	auipc	ra,0x1
    80003874:	c80080e7          	jalr	-896(ra) # 800044f0 <_Z11printStringPKc>
    80003878:	00000613          	li	a2,0
    8000387c:	00a00593          	li	a1,10
    80003880:	00048513          	mv	a0,s1
    80003884:	00001097          	auipc	ra,0x1
    80003888:	e1c080e7          	jalr	-484(ra) # 800046a0 <_Z8printIntiii>
    8000388c:	00005517          	auipc	a0,0x5
    80003890:	90450513          	addi	a0,a0,-1788 # 80008190 <CONSOLE_STATUS+0x180>
    80003894:	00001097          	auipc	ra,0x1
    80003898:	c5c080e7          	jalr	-932(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000389c:	0014849b          	addiw	s1,s1,1
    800038a0:	0ff4f493          	andi	s1,s1,255
    800038a4:	00200793          	li	a5,2
    800038a8:	fc97f0e3          	bgeu	a5,s1,80003868 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800038ac:	00005517          	auipc	a0,0x5
    800038b0:	c5450513          	addi	a0,a0,-940 # 80008500 <CONSOLE_STATUS+0x4f0>
    800038b4:	00001097          	auipc	ra,0x1
    800038b8:	c3c080e7          	jalr	-964(ra) # 800044f0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800038bc:	00700313          	li	t1,7
    thread_dispatch();
    800038c0:	ffffe097          	auipc	ra,0xffffe
    800038c4:	aa0080e7          	jalr	-1376(ra) # 80001360 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800038c8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800038cc:	00005517          	auipc	a0,0x5
    800038d0:	c4450513          	addi	a0,a0,-956 # 80008510 <CONSOLE_STATUS+0x500>
    800038d4:	00001097          	auipc	ra,0x1
    800038d8:	c1c080e7          	jalr	-996(ra) # 800044f0 <_Z11printStringPKc>
    800038dc:	00000613          	li	a2,0
    800038e0:	00a00593          	li	a1,10
    800038e4:	0009051b          	sext.w	a0,s2
    800038e8:	00001097          	auipc	ra,0x1
    800038ec:	db8080e7          	jalr	-584(ra) # 800046a0 <_Z8printIntiii>
    800038f0:	00005517          	auipc	a0,0x5
    800038f4:	8a050513          	addi	a0,a0,-1888 # 80008190 <CONSOLE_STATUS+0x180>
    800038f8:	00001097          	auipc	ra,0x1
    800038fc:	bf8080e7          	jalr	-1032(ra) # 800044f0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80003900:	00c00513          	li	a0,12
    80003904:	00000097          	auipc	ra,0x0
    80003908:	d88080e7          	jalr	-632(ra) # 8000368c <_ZL9fibonaccim>
    8000390c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003910:	00005517          	auipc	a0,0x5
    80003914:	c0850513          	addi	a0,a0,-1016 # 80008518 <CONSOLE_STATUS+0x508>
    80003918:	00001097          	auipc	ra,0x1
    8000391c:	bd8080e7          	jalr	-1064(ra) # 800044f0 <_Z11printStringPKc>
    80003920:	00000613          	li	a2,0
    80003924:	00a00593          	li	a1,10
    80003928:	0009051b          	sext.w	a0,s2
    8000392c:	00001097          	auipc	ra,0x1
    80003930:	d74080e7          	jalr	-652(ra) # 800046a0 <_Z8printIntiii>
    80003934:	00005517          	auipc	a0,0x5
    80003938:	85c50513          	addi	a0,a0,-1956 # 80008190 <CONSOLE_STATUS+0x180>
    8000393c:	00001097          	auipc	ra,0x1
    80003940:	bb4080e7          	jalr	-1100(ra) # 800044f0 <_Z11printStringPKc>
    80003944:	0400006f          	j	80003984 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003948:	00005517          	auipc	a0,0x5
    8000394c:	bb050513          	addi	a0,a0,-1104 # 800084f8 <CONSOLE_STATUS+0x4e8>
    80003950:	00001097          	auipc	ra,0x1
    80003954:	ba0080e7          	jalr	-1120(ra) # 800044f0 <_Z11printStringPKc>
    80003958:	00000613          	li	a2,0
    8000395c:	00a00593          	li	a1,10
    80003960:	00048513          	mv	a0,s1
    80003964:	00001097          	auipc	ra,0x1
    80003968:	d3c080e7          	jalr	-708(ra) # 800046a0 <_Z8printIntiii>
    8000396c:	00005517          	auipc	a0,0x5
    80003970:	82450513          	addi	a0,a0,-2012 # 80008190 <CONSOLE_STATUS+0x180>
    80003974:	00001097          	auipc	ra,0x1
    80003978:	b7c080e7          	jalr	-1156(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000397c:	0014849b          	addiw	s1,s1,1
    80003980:	0ff4f493          	andi	s1,s1,255
    80003984:	00500793          	li	a5,5
    80003988:	fc97f0e3          	bgeu	a5,s1,80003948 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000398c:	00005517          	auipc	a0,0x5
    80003990:	b4450513          	addi	a0,a0,-1212 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003994:	00001097          	auipc	ra,0x1
    80003998:	b5c080e7          	jalr	-1188(ra) # 800044f0 <_Z11printStringPKc>
    finishedC = true;
    8000399c:	00100793          	li	a5,1
    800039a0:	00007717          	auipc	a4,0x7
    800039a4:	86f706a3          	sb	a5,-1939(a4) # 8000a20d <_ZL9finishedC>
    thread_dispatch();
    800039a8:	ffffe097          	auipc	ra,0xffffe
    800039ac:	9b8080e7          	jalr	-1608(ra) # 80001360 <_Z15thread_dispatchv>
}
    800039b0:	01813083          	ld	ra,24(sp)
    800039b4:	01013403          	ld	s0,16(sp)
    800039b8:	00813483          	ld	s1,8(sp)
    800039bc:	00013903          	ld	s2,0(sp)
    800039c0:	02010113          	addi	sp,sp,32
    800039c4:	00008067          	ret

00000000800039c8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800039c8:	fe010113          	addi	sp,sp,-32
    800039cc:	00113c23          	sd	ra,24(sp)
    800039d0:	00813823          	sd	s0,16(sp)
    800039d4:	00913423          	sd	s1,8(sp)
    800039d8:	01213023          	sd	s2,0(sp)
    800039dc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800039e0:	00000913          	li	s2,0
    800039e4:	0380006f          	j	80003a1c <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800039e8:	ffffe097          	auipc	ra,0xffffe
    800039ec:	978080e7          	jalr	-1672(ra) # 80001360 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800039f0:	00148493          	addi	s1,s1,1
    800039f4:	000027b7          	lui	a5,0x2
    800039f8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800039fc:	0097ee63          	bltu	a5,s1,80003a18 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003a00:	00000713          	li	a4,0
    80003a04:	000077b7          	lui	a5,0x7
    80003a08:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003a0c:	fce7eee3          	bltu	a5,a4,800039e8 <_ZL11workerBodyBPv+0x20>
    80003a10:	00170713          	addi	a4,a4,1
    80003a14:	ff1ff06f          	j	80003a04 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003a18:	00190913          	addi	s2,s2,1
    80003a1c:	00f00793          	li	a5,15
    80003a20:	0527e063          	bltu	a5,s2,80003a60 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003a24:	00005517          	auipc	a0,0x5
    80003a28:	abc50513          	addi	a0,a0,-1348 # 800084e0 <CONSOLE_STATUS+0x4d0>
    80003a2c:	00001097          	auipc	ra,0x1
    80003a30:	ac4080e7          	jalr	-1340(ra) # 800044f0 <_Z11printStringPKc>
    80003a34:	00000613          	li	a2,0
    80003a38:	00a00593          	li	a1,10
    80003a3c:	0009051b          	sext.w	a0,s2
    80003a40:	00001097          	auipc	ra,0x1
    80003a44:	c60080e7          	jalr	-928(ra) # 800046a0 <_Z8printIntiii>
    80003a48:	00004517          	auipc	a0,0x4
    80003a4c:	74850513          	addi	a0,a0,1864 # 80008190 <CONSOLE_STATUS+0x180>
    80003a50:	00001097          	auipc	ra,0x1
    80003a54:	aa0080e7          	jalr	-1376(ra) # 800044f0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003a58:	00000493          	li	s1,0
    80003a5c:	f99ff06f          	j	800039f4 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80003a60:	00005517          	auipc	a0,0x5
    80003a64:	a8850513          	addi	a0,a0,-1400 # 800084e8 <CONSOLE_STATUS+0x4d8>
    80003a68:	00001097          	auipc	ra,0x1
    80003a6c:	a88080e7          	jalr	-1400(ra) # 800044f0 <_Z11printStringPKc>
    finishedB = true;
    80003a70:	00100793          	li	a5,1
    80003a74:	00006717          	auipc	a4,0x6
    80003a78:	78f70d23          	sb	a5,1946(a4) # 8000a20e <_ZL9finishedB>
    thread_dispatch();
    80003a7c:	ffffe097          	auipc	ra,0xffffe
    80003a80:	8e4080e7          	jalr	-1820(ra) # 80001360 <_Z15thread_dispatchv>
}
    80003a84:	01813083          	ld	ra,24(sp)
    80003a88:	01013403          	ld	s0,16(sp)
    80003a8c:	00813483          	ld	s1,8(sp)
    80003a90:	00013903          	ld	s2,0(sp)
    80003a94:	02010113          	addi	sp,sp,32
    80003a98:	00008067          	ret

0000000080003a9c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003a9c:	fe010113          	addi	sp,sp,-32
    80003aa0:	00113c23          	sd	ra,24(sp)
    80003aa4:	00813823          	sd	s0,16(sp)
    80003aa8:	00913423          	sd	s1,8(sp)
    80003aac:	01213023          	sd	s2,0(sp)
    80003ab0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003ab4:	00000913          	li	s2,0
    80003ab8:	0380006f          	j	80003af0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003abc:	ffffe097          	auipc	ra,0xffffe
    80003ac0:	8a4080e7          	jalr	-1884(ra) # 80001360 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ac4:	00148493          	addi	s1,s1,1
    80003ac8:	000027b7          	lui	a5,0x2
    80003acc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ad0:	0097ee63          	bltu	a5,s1,80003aec <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ad4:	00000713          	li	a4,0
    80003ad8:	000077b7          	lui	a5,0x7
    80003adc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ae0:	fce7eee3          	bltu	a5,a4,80003abc <_ZL11workerBodyAPv+0x20>
    80003ae4:	00170713          	addi	a4,a4,1
    80003ae8:	ff1ff06f          	j	80003ad8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003aec:	00190913          	addi	s2,s2,1
    80003af0:	00900793          	li	a5,9
    80003af4:	0527e063          	bltu	a5,s2,80003b34 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003af8:	00005517          	auipc	a0,0x5
    80003afc:	9d050513          	addi	a0,a0,-1584 # 800084c8 <CONSOLE_STATUS+0x4b8>
    80003b00:	00001097          	auipc	ra,0x1
    80003b04:	9f0080e7          	jalr	-1552(ra) # 800044f0 <_Z11printStringPKc>
    80003b08:	00000613          	li	a2,0
    80003b0c:	00a00593          	li	a1,10
    80003b10:	0009051b          	sext.w	a0,s2
    80003b14:	00001097          	auipc	ra,0x1
    80003b18:	b8c080e7          	jalr	-1140(ra) # 800046a0 <_Z8printIntiii>
    80003b1c:	00004517          	auipc	a0,0x4
    80003b20:	67450513          	addi	a0,a0,1652 # 80008190 <CONSOLE_STATUS+0x180>
    80003b24:	00001097          	auipc	ra,0x1
    80003b28:	9cc080e7          	jalr	-1588(ra) # 800044f0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003b2c:	00000493          	li	s1,0
    80003b30:	f99ff06f          	j	80003ac8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003b34:	00005517          	auipc	a0,0x5
    80003b38:	99c50513          	addi	a0,a0,-1636 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80003b3c:	00001097          	auipc	ra,0x1
    80003b40:	9b4080e7          	jalr	-1612(ra) # 800044f0 <_Z11printStringPKc>
    finishedA = true;
    80003b44:	00100793          	li	a5,1
    80003b48:	00006717          	auipc	a4,0x6
    80003b4c:	6cf703a3          	sb	a5,1735(a4) # 8000a20f <_ZL9finishedA>
}
    80003b50:	01813083          	ld	ra,24(sp)
    80003b54:	01013403          	ld	s0,16(sp)
    80003b58:	00813483          	ld	s1,8(sp)
    80003b5c:	00013903          	ld	s2,0(sp)
    80003b60:	02010113          	addi	sp,sp,32
    80003b64:	00008067          	ret

0000000080003b68 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003b68:	fd010113          	addi	sp,sp,-48
    80003b6c:	02113423          	sd	ra,40(sp)
    80003b70:	02813023          	sd	s0,32(sp)
    80003b74:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003b78:	00000613          	li	a2,0
    80003b7c:	00000597          	auipc	a1,0x0
    80003b80:	f2058593          	addi	a1,a1,-224 # 80003a9c <_ZL11workerBodyAPv>
    80003b84:	fd040513          	addi	a0,s0,-48
    80003b88:	ffffd097          	auipc	ra,0xffffd
    80003b8c:	72c080e7          	jalr	1836(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80003b90:	00005517          	auipc	a0,0x5
    80003b94:	9d050513          	addi	a0,a0,-1584 # 80008560 <CONSOLE_STATUS+0x550>
    80003b98:	00001097          	auipc	ra,0x1
    80003b9c:	958080e7          	jalr	-1704(ra) # 800044f0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003ba0:	00000613          	li	a2,0
    80003ba4:	00000597          	auipc	a1,0x0
    80003ba8:	e2458593          	addi	a1,a1,-476 # 800039c8 <_ZL11workerBodyBPv>
    80003bac:	fd840513          	addi	a0,s0,-40
    80003bb0:	ffffd097          	auipc	ra,0xffffd
    80003bb4:	704080e7          	jalr	1796(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80003bb8:	00005517          	auipc	a0,0x5
    80003bbc:	9c050513          	addi	a0,a0,-1600 # 80008578 <CONSOLE_STATUS+0x568>
    80003bc0:	00001097          	auipc	ra,0x1
    80003bc4:	930080e7          	jalr	-1744(ra) # 800044f0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003bc8:	00000613          	li	a2,0
    80003bcc:	00000597          	auipc	a1,0x0
    80003bd0:	c7c58593          	addi	a1,a1,-900 # 80003848 <_ZL11workerBodyCPv>
    80003bd4:	fe040513          	addi	a0,s0,-32
    80003bd8:	ffffd097          	auipc	ra,0xffffd
    80003bdc:	6dc080e7          	jalr	1756(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80003be0:	00005517          	auipc	a0,0x5
    80003be4:	9b050513          	addi	a0,a0,-1616 # 80008590 <CONSOLE_STATUS+0x580>
    80003be8:	00001097          	auipc	ra,0x1
    80003bec:	908080e7          	jalr	-1784(ra) # 800044f0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80003bf0:	00000613          	li	a2,0
    80003bf4:	00000597          	auipc	a1,0x0
    80003bf8:	b0c58593          	addi	a1,a1,-1268 # 80003700 <_ZL11workerBodyDPv>
    80003bfc:	fe840513          	addi	a0,s0,-24
    80003c00:	ffffd097          	auipc	ra,0xffffd
    80003c04:	6b4080e7          	jalr	1716(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80003c08:	00005517          	auipc	a0,0x5
    80003c0c:	9a050513          	addi	a0,a0,-1632 # 800085a8 <CONSOLE_STATUS+0x598>
    80003c10:	00001097          	auipc	ra,0x1
    80003c14:	8e0080e7          	jalr	-1824(ra) # 800044f0 <_Z11printStringPKc>
    80003c18:	00c0006f          	j	80003c24 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003c1c:	ffffd097          	auipc	ra,0xffffd
    80003c20:	744080e7          	jalr	1860(ra) # 80001360 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003c24:	00006797          	auipc	a5,0x6
    80003c28:	5eb7c783          	lbu	a5,1515(a5) # 8000a20f <_ZL9finishedA>
    80003c2c:	fe0788e3          	beqz	a5,80003c1c <_Z18Threads_C_API_testv+0xb4>
    80003c30:	00006797          	auipc	a5,0x6
    80003c34:	5de7c783          	lbu	a5,1502(a5) # 8000a20e <_ZL9finishedB>
    80003c38:	fe0782e3          	beqz	a5,80003c1c <_Z18Threads_C_API_testv+0xb4>
    80003c3c:	00006797          	auipc	a5,0x6
    80003c40:	5d17c783          	lbu	a5,1489(a5) # 8000a20d <_ZL9finishedC>
    80003c44:	fc078ce3          	beqz	a5,80003c1c <_Z18Threads_C_API_testv+0xb4>
    80003c48:	00006797          	auipc	a5,0x6
    80003c4c:	5c47c783          	lbu	a5,1476(a5) # 8000a20c <_ZL9finishedD>
    80003c50:	fc0786e3          	beqz	a5,80003c1c <_Z18Threads_C_API_testv+0xb4>
    }

}
    80003c54:	02813083          	ld	ra,40(sp)
    80003c58:	02013403          	ld	s0,32(sp)
    80003c5c:	03010113          	addi	sp,sp,48
    80003c60:	00008067          	ret

0000000080003c64 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80003c64:	fd010113          	addi	sp,sp,-48
    80003c68:	02113423          	sd	ra,40(sp)
    80003c6c:	02813023          	sd	s0,32(sp)
    80003c70:	00913c23          	sd	s1,24(sp)
    80003c74:	01213823          	sd	s2,16(sp)
    80003c78:	01313423          	sd	s3,8(sp)
    80003c7c:	03010413          	addi	s0,sp,48
    80003c80:	00050993          	mv	s3,a0
    80003c84:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003c88:	00000913          	li	s2,0
    80003c8c:	00c0006f          	j	80003c98 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 'z') {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003c90:	ffffe097          	auipc	ra,0xffffe
    80003c94:	e04080e7          	jalr	-508(ra) # 80001a94 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 'z') {
    80003c98:	ffffe097          	auipc	ra,0xffffe
    80003c9c:	818080e7          	jalr	-2024(ra) # 800014b0 <_Z4getcv>
    80003ca0:	0005059b          	sext.w	a1,a0
    80003ca4:	07a00793          	li	a5,122
    80003ca8:	02f58a63          	beq	a1,a5,80003cdc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80003cac:	0084b503          	ld	a0,8(s1)
    80003cb0:	00001097          	auipc	ra,0x1
    80003cb4:	c64080e7          	jalr	-924(ra) # 80004914 <_ZN9BufferCPP3putEi>
        i++;
    80003cb8:	0019071b          	addiw	a4,s2,1
    80003cbc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003cc0:	0004a683          	lw	a3,0(s1)
    80003cc4:	0026979b          	slliw	a5,a3,0x2
    80003cc8:	00d787bb          	addw	a5,a5,a3
    80003ccc:	0017979b          	slliw	a5,a5,0x1
    80003cd0:	02f767bb          	remw	a5,a4,a5
    80003cd4:	fc0792e3          	bnez	a5,80003c98 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80003cd8:	fb9ff06f          	j	80003c90 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80003cdc:	00100793          	li	a5,1
    80003ce0:	00006717          	auipc	a4,0x6
    80003ce4:	52f72823          	sw	a5,1328(a4) # 8000a210 <_ZL9threadEnd>
    td->buffer->put('!');
    80003ce8:	0209b783          	ld	a5,32(s3)
    80003cec:	02100593          	li	a1,33
    80003cf0:	0087b503          	ld	a0,8(a5)
    80003cf4:	00001097          	auipc	ra,0x1
    80003cf8:	c20080e7          	jalr	-992(ra) # 80004914 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80003cfc:	0104b503          	ld	a0,16(s1)
    80003d00:	ffffe097          	auipc	ra,0xffffe
    80003d04:	e3c080e7          	jalr	-452(ra) # 80001b3c <_ZN9Semaphore6signalEv>
}
    80003d08:	02813083          	ld	ra,40(sp)
    80003d0c:	02013403          	ld	s0,32(sp)
    80003d10:	01813483          	ld	s1,24(sp)
    80003d14:	01013903          	ld	s2,16(sp)
    80003d18:	00813983          	ld	s3,8(sp)
    80003d1c:	03010113          	addi	sp,sp,48
    80003d20:	00008067          	ret

0000000080003d24 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80003d24:	fe010113          	addi	sp,sp,-32
    80003d28:	00113c23          	sd	ra,24(sp)
    80003d2c:	00813823          	sd	s0,16(sp)
    80003d30:	00913423          	sd	s1,8(sp)
    80003d34:	01213023          	sd	s2,0(sp)
    80003d38:	02010413          	addi	s0,sp,32
    80003d3c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003d40:	00000913          	li	s2,0
    80003d44:	00c0006f          	j	80003d50 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003d48:	ffffe097          	auipc	ra,0xffffe
    80003d4c:	d4c080e7          	jalr	-692(ra) # 80001a94 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80003d50:	00006797          	auipc	a5,0x6
    80003d54:	4c07a783          	lw	a5,1216(a5) # 8000a210 <_ZL9threadEnd>
    80003d58:	02079e63          	bnez	a5,80003d94 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80003d5c:	0004a583          	lw	a1,0(s1)
    80003d60:	0305859b          	addiw	a1,a1,48
    80003d64:	0084b503          	ld	a0,8(s1)
    80003d68:	00001097          	auipc	ra,0x1
    80003d6c:	bac080e7          	jalr	-1108(ra) # 80004914 <_ZN9BufferCPP3putEi>
        i++;
    80003d70:	0019071b          	addiw	a4,s2,1
    80003d74:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003d78:	0004a683          	lw	a3,0(s1)
    80003d7c:	0026979b          	slliw	a5,a3,0x2
    80003d80:	00d787bb          	addw	a5,a5,a3
    80003d84:	0017979b          	slliw	a5,a5,0x1
    80003d88:	02f767bb          	remw	a5,a4,a5
    80003d8c:	fc0792e3          	bnez	a5,80003d50 <_ZN12ProducerSync8producerEPv+0x2c>
    80003d90:	fb9ff06f          	j	80003d48 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80003d94:	0104b503          	ld	a0,16(s1)
    80003d98:	ffffe097          	auipc	ra,0xffffe
    80003d9c:	da4080e7          	jalr	-604(ra) # 80001b3c <_ZN9Semaphore6signalEv>
}
    80003da0:	01813083          	ld	ra,24(sp)
    80003da4:	01013403          	ld	s0,16(sp)
    80003da8:	00813483          	ld	s1,8(sp)
    80003dac:	00013903          	ld	s2,0(sp)
    80003db0:	02010113          	addi	sp,sp,32
    80003db4:	00008067          	ret

0000000080003db8 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80003db8:	fd010113          	addi	sp,sp,-48
    80003dbc:	02113423          	sd	ra,40(sp)
    80003dc0:	02813023          	sd	s0,32(sp)
    80003dc4:	00913c23          	sd	s1,24(sp)
    80003dc8:	01213823          	sd	s2,16(sp)
    80003dcc:	01313423          	sd	s3,8(sp)
    80003dd0:	01413023          	sd	s4,0(sp)
    80003dd4:	03010413          	addi	s0,sp,48
    80003dd8:	00050993          	mv	s3,a0
    80003ddc:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003de0:	00000a13          	li	s4,0
    80003de4:	01c0006f          	j	80003e00 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80003de8:	ffffe097          	auipc	ra,0xffffe
    80003dec:	cac080e7          	jalr	-852(ra) # 80001a94 <_ZN6Thread8dispatchEv>
    80003df0:	0500006f          	j	80003e40 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003df4:	00a00513          	li	a0,10
    80003df8:	ffffd097          	auipc	ra,0xffffd
    80003dfc:	6e4080e7          	jalr	1764(ra) # 800014dc <_Z4putcc>
    while (!threadEnd) {
    80003e00:	00006797          	auipc	a5,0x6
    80003e04:	4107a783          	lw	a5,1040(a5) # 8000a210 <_ZL9threadEnd>
    80003e08:	06079263          	bnez	a5,80003e6c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80003e0c:	00893503          	ld	a0,8(s2)
    80003e10:	00001097          	auipc	ra,0x1
    80003e14:	b94080e7          	jalr	-1132(ra) # 800049a4 <_ZN9BufferCPP3getEv>
        i++;
    80003e18:	001a049b          	addiw	s1,s4,1
    80003e1c:	00048a1b          	sext.w	s4,s1
        putc(key);
    80003e20:	0ff57513          	andi	a0,a0,255
    80003e24:	ffffd097          	auipc	ra,0xffffd
    80003e28:	6b8080e7          	jalr	1720(ra) # 800014dc <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003e2c:	00092703          	lw	a4,0(s2)
    80003e30:	0027179b          	slliw	a5,a4,0x2
    80003e34:	00e787bb          	addw	a5,a5,a4
    80003e38:	02f4e7bb          	remw	a5,s1,a5
    80003e3c:	fa0786e3          	beqz	a5,80003de8 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80003e40:	05000793          	li	a5,80
    80003e44:	02f4e4bb          	remw	s1,s1,a5
    80003e48:	fa049ce3          	bnez	s1,80003e00 <_ZN12ConsumerSync8consumerEPv+0x48>
    80003e4c:	fa9ff06f          	j	80003df4 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80003e50:	0209b783          	ld	a5,32(s3)
    80003e54:	0087b503          	ld	a0,8(a5)
    80003e58:	00001097          	auipc	ra,0x1
    80003e5c:	b4c080e7          	jalr	-1204(ra) # 800049a4 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80003e60:	0ff57513          	andi	a0,a0,255
    80003e64:	ffffe097          	auipc	ra,0xffffe
    80003e68:	d84080e7          	jalr	-636(ra) # 80001be8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80003e6c:	0209b783          	ld	a5,32(s3)
    80003e70:	0087b503          	ld	a0,8(a5)
    80003e74:	00001097          	auipc	ra,0x1
    80003e78:	bbc080e7          	jalr	-1092(ra) # 80004a30 <_ZN9BufferCPP6getCntEv>
    80003e7c:	fca04ae3          	bgtz	a0,80003e50 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80003e80:	01093503          	ld	a0,16(s2)
    80003e84:	ffffe097          	auipc	ra,0xffffe
    80003e88:	cb8080e7          	jalr	-840(ra) # 80001b3c <_ZN9Semaphore6signalEv>
}
    80003e8c:	02813083          	ld	ra,40(sp)
    80003e90:	02013403          	ld	s0,32(sp)
    80003e94:	01813483          	ld	s1,24(sp)
    80003e98:	01013903          	ld	s2,16(sp)
    80003e9c:	00813983          	ld	s3,8(sp)
    80003ea0:	00013a03          	ld	s4,0(sp)
    80003ea4:	03010113          	addi	sp,sp,48
    80003ea8:	00008067          	ret

0000000080003eac <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80003eac:	f8010113          	addi	sp,sp,-128
    80003eb0:	06113c23          	sd	ra,120(sp)
    80003eb4:	06813823          	sd	s0,112(sp)
    80003eb8:	06913423          	sd	s1,104(sp)
    80003ebc:	07213023          	sd	s2,96(sp)
    80003ec0:	05313c23          	sd	s3,88(sp)
    80003ec4:	05413823          	sd	s4,80(sp)
    80003ec8:	05513423          	sd	s5,72(sp)
    80003ecc:	05613023          	sd	s6,64(sp)
    80003ed0:	03713c23          	sd	s7,56(sp)
    80003ed4:	03813823          	sd	s8,48(sp)
    80003ed8:	03913423          	sd	s9,40(sp)
    80003edc:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80003ee0:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80003ee4:	00004517          	auipc	a0,0x4
    80003ee8:	4fc50513          	addi	a0,a0,1276 # 800083e0 <CONSOLE_STATUS+0x3d0>
    80003eec:	00000097          	auipc	ra,0x0
    80003ef0:	604080e7          	jalr	1540(ra) # 800044f0 <_Z11printStringPKc>
    getString(input, 30);
    80003ef4:	01e00593          	li	a1,30
    80003ef8:	f8040493          	addi	s1,s0,-128
    80003efc:	00048513          	mv	a0,s1
    80003f00:	00000097          	auipc	ra,0x0
    80003f04:	678080e7          	jalr	1656(ra) # 80004578 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003f08:	00048513          	mv	a0,s1
    80003f0c:	00000097          	auipc	ra,0x0
    80003f10:	744080e7          	jalr	1860(ra) # 80004650 <_Z11stringToIntPKc>
    80003f14:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003f18:	00004517          	auipc	a0,0x4
    80003f1c:	4e850513          	addi	a0,a0,1256 # 80008400 <CONSOLE_STATUS+0x3f0>
    80003f20:	00000097          	auipc	ra,0x0
    80003f24:	5d0080e7          	jalr	1488(ra) # 800044f0 <_Z11printStringPKc>
    getString(input, 30);
    80003f28:	01e00593          	li	a1,30
    80003f2c:	00048513          	mv	a0,s1
    80003f30:	00000097          	auipc	ra,0x0
    80003f34:	648080e7          	jalr	1608(ra) # 80004578 <_Z9getStringPci>
    n = stringToInt(input);
    80003f38:	00048513          	mv	a0,s1
    80003f3c:	00000097          	auipc	ra,0x0
    80003f40:	714080e7          	jalr	1812(ra) # 80004650 <_Z11stringToIntPKc>
    80003f44:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003f48:	00004517          	auipc	a0,0x4
    80003f4c:	4d850513          	addi	a0,a0,1240 # 80008420 <CONSOLE_STATUS+0x410>
    80003f50:	00000097          	auipc	ra,0x0
    80003f54:	5a0080e7          	jalr	1440(ra) # 800044f0 <_Z11printStringPKc>
    80003f58:	00000613          	li	a2,0
    80003f5c:	00a00593          	li	a1,10
    80003f60:	00090513          	mv	a0,s2
    80003f64:	00000097          	auipc	ra,0x0
    80003f68:	73c080e7          	jalr	1852(ra) # 800046a0 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003f6c:	00004517          	auipc	a0,0x4
    80003f70:	4cc50513          	addi	a0,a0,1228 # 80008438 <CONSOLE_STATUS+0x428>
    80003f74:	00000097          	auipc	ra,0x0
    80003f78:	57c080e7          	jalr	1404(ra) # 800044f0 <_Z11printStringPKc>
    80003f7c:	00000613          	li	a2,0
    80003f80:	00a00593          	li	a1,10
    80003f84:	00048513          	mv	a0,s1
    80003f88:	00000097          	auipc	ra,0x0
    80003f8c:	718080e7          	jalr	1816(ra) # 800046a0 <_Z8printIntiii>
    printString(".\n");
    80003f90:	00004517          	auipc	a0,0x4
    80003f94:	4c050513          	addi	a0,a0,1216 # 80008450 <CONSOLE_STATUS+0x440>
    80003f98:	00000097          	auipc	ra,0x0
    80003f9c:	558080e7          	jalr	1368(ra) # 800044f0 <_Z11printStringPKc>
    if(threadNum > n) {
    80003fa0:	0324c463          	blt	s1,s2,80003fc8 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80003fa4:	03205c63          	blez	s2,80003fdc <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80003fa8:	03800513          	li	a0,56
    80003fac:	ffffe097          	auipc	ra,0xffffe
    80003fb0:	938080e7          	jalr	-1736(ra) # 800018e4 <_Znwm>
    80003fb4:	00050a93          	mv	s5,a0
    80003fb8:	00048593          	mv	a1,s1
    80003fbc:	00001097          	auipc	ra,0x1
    80003fc0:	804080e7          	jalr	-2044(ra) # 800047c0 <_ZN9BufferCPPC1Ei>
    80003fc4:	0300006f          	j	80003ff4 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003fc8:	00004517          	auipc	a0,0x4
    80003fcc:	49050513          	addi	a0,a0,1168 # 80008458 <CONSOLE_STATUS+0x448>
    80003fd0:	00000097          	auipc	ra,0x0
    80003fd4:	520080e7          	jalr	1312(ra) # 800044f0 <_Z11printStringPKc>
        return;
    80003fd8:	0140006f          	j	80003fec <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003fdc:	00004517          	auipc	a0,0x4
    80003fe0:	4bc50513          	addi	a0,a0,1212 # 80008498 <CONSOLE_STATUS+0x488>
    80003fe4:	00000097          	auipc	ra,0x0
    80003fe8:	50c080e7          	jalr	1292(ra) # 800044f0 <_Z11printStringPKc>
        return;
    80003fec:	000b8113          	mv	sp,s7
    80003ff0:	2380006f          	j	80004228 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80003ff4:	01000513          	li	a0,16
    80003ff8:	ffffe097          	auipc	ra,0xffffe
    80003ffc:	8ec080e7          	jalr	-1812(ra) # 800018e4 <_Znwm>
    80004000:	00050493          	mv	s1,a0
    80004004:	00000593          	li	a1,0
    80004008:	ffffe097          	auipc	ra,0xffffe
    8000400c:	ad0080e7          	jalr	-1328(ra) # 80001ad8 <_ZN9SemaphoreC1Ej>
    80004010:	00006797          	auipc	a5,0x6
    80004014:	2097b423          	sd	s1,520(a5) # 8000a218 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80004018:	00391793          	slli	a5,s2,0x3
    8000401c:	00f78793          	addi	a5,a5,15
    80004020:	ff07f793          	andi	a5,a5,-16
    80004024:	40f10133          	sub	sp,sp,a5
    80004028:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    8000402c:	0019071b          	addiw	a4,s2,1
    80004030:	00171793          	slli	a5,a4,0x1
    80004034:	00e787b3          	add	a5,a5,a4
    80004038:	00379793          	slli	a5,a5,0x3
    8000403c:	00f78793          	addi	a5,a5,15
    80004040:	ff07f793          	andi	a5,a5,-16
    80004044:	40f10133          	sub	sp,sp,a5
    80004048:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    8000404c:	00191c13          	slli	s8,s2,0x1
    80004050:	012c07b3          	add	a5,s8,s2
    80004054:	00379793          	slli	a5,a5,0x3
    80004058:	00fa07b3          	add	a5,s4,a5
    8000405c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004060:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004064:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004068:	02800513          	li	a0,40
    8000406c:	ffffe097          	auipc	ra,0xffffe
    80004070:	878080e7          	jalr	-1928(ra) # 800018e4 <_Znwm>
    80004074:	00050b13          	mv	s6,a0
    80004078:	012c0c33          	add	s8,s8,s2
    8000407c:	003c1c13          	slli	s8,s8,0x3
    80004080:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004084:	ffffe097          	auipc	ra,0xffffe
    80004088:	9dc080e7          	jalr	-1572(ra) # 80001a60 <_ZN6ThreadC1Ev>
    8000408c:	00006797          	auipc	a5,0x6
    80004090:	09478793          	addi	a5,a5,148 # 8000a120 <_ZTV12ConsumerSync+0x10>
    80004094:	00fb3023          	sd	a5,0(s6)
    80004098:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    8000409c:	000b0513          	mv	a0,s6
    800040a0:	ffffe097          	auipc	ra,0xffffe
    800040a4:	97c080e7          	jalr	-1668(ra) # 80001a1c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800040a8:	00000493          	li	s1,0
    800040ac:	0380006f          	j	800040e4 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800040b0:	00006797          	auipc	a5,0x6
    800040b4:	04878793          	addi	a5,a5,72 # 8000a0f8 <_ZTV12ProducerSync+0x10>
    800040b8:	00fcb023          	sd	a5,0(s9)
    800040bc:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800040c0:	00349793          	slli	a5,s1,0x3
    800040c4:	00f987b3          	add	a5,s3,a5
    800040c8:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800040cc:	00349793          	slli	a5,s1,0x3
    800040d0:	00f987b3          	add	a5,s3,a5
    800040d4:	0007b503          	ld	a0,0(a5)
    800040d8:	ffffe097          	auipc	ra,0xffffe
    800040dc:	944080e7          	jalr	-1724(ra) # 80001a1c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800040e0:	0014849b          	addiw	s1,s1,1
    800040e4:	0b24d063          	bge	s1,s2,80004184 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800040e8:	00149793          	slli	a5,s1,0x1
    800040ec:	009787b3          	add	a5,a5,s1
    800040f0:	00379793          	slli	a5,a5,0x3
    800040f4:	00fa07b3          	add	a5,s4,a5
    800040f8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800040fc:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80004100:	00006717          	auipc	a4,0x6
    80004104:	11873703          	ld	a4,280(a4) # 8000a218 <_ZL10waitForAll>
    80004108:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    8000410c:	02905863          	blez	s1,8000413c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80004110:	02800513          	li	a0,40
    80004114:	ffffd097          	auipc	ra,0xffffd
    80004118:	7d0080e7          	jalr	2000(ra) # 800018e4 <_Znwm>
    8000411c:	00050c93          	mv	s9,a0
    80004120:	00149c13          	slli	s8,s1,0x1
    80004124:	009c0c33          	add	s8,s8,s1
    80004128:	003c1c13          	slli	s8,s8,0x3
    8000412c:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004130:	ffffe097          	auipc	ra,0xffffe
    80004134:	930080e7          	jalr	-1744(ra) # 80001a60 <_ZN6ThreadC1Ev>
    80004138:	f79ff06f          	j	800040b0 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    8000413c:	02800513          	li	a0,40
    80004140:	ffffd097          	auipc	ra,0xffffd
    80004144:	7a4080e7          	jalr	1956(ra) # 800018e4 <_Znwm>
    80004148:	00050c93          	mv	s9,a0
    8000414c:	00149c13          	slli	s8,s1,0x1
    80004150:	009c0c33          	add	s8,s8,s1
    80004154:	003c1c13          	slli	s8,s8,0x3
    80004158:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    8000415c:	ffffe097          	auipc	ra,0xffffe
    80004160:	904080e7          	jalr	-1788(ra) # 80001a60 <_ZN6ThreadC1Ev>
    80004164:	00006797          	auipc	a5,0x6
    80004168:	f6c78793          	addi	a5,a5,-148 # 8000a0d0 <_ZTV16ProducerKeyboard+0x10>
    8000416c:	00fcb023          	sd	a5,0(s9)
    80004170:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004174:	00349793          	slli	a5,s1,0x3
    80004178:	00f987b3          	add	a5,s3,a5
    8000417c:	0197b023          	sd	s9,0(a5)
    80004180:	f4dff06f          	j	800040cc <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80004184:	ffffe097          	auipc	ra,0xffffe
    80004188:	910080e7          	jalr	-1776(ra) # 80001a94 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000418c:	00000493          	li	s1,0
    80004190:	00994e63          	blt	s2,s1,800041ac <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004194:	00006517          	auipc	a0,0x6
    80004198:	08453503          	ld	a0,132(a0) # 8000a218 <_ZL10waitForAll>
    8000419c:	ffffe097          	auipc	ra,0xffffe
    800041a0:	974080e7          	jalr	-1676(ra) # 80001b10 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800041a4:	0014849b          	addiw	s1,s1,1
    800041a8:	fe9ff06f          	j	80004190 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800041ac:	00000493          	li	s1,0
    800041b0:	0080006f          	j	800041b8 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800041b4:	0014849b          	addiw	s1,s1,1
    800041b8:	0324d263          	bge	s1,s2,800041dc <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800041bc:	00349793          	slli	a5,s1,0x3
    800041c0:	00f987b3          	add	a5,s3,a5
    800041c4:	0007b503          	ld	a0,0(a5)
    800041c8:	fe0506e3          	beqz	a0,800041b4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800041cc:	00053783          	ld	a5,0(a0)
    800041d0:	0087b783          	ld	a5,8(a5)
    800041d4:	000780e7          	jalr	a5
    800041d8:	fddff06f          	j	800041b4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800041dc:	000b0a63          	beqz	s6,800041f0 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800041e0:	000b3783          	ld	a5,0(s6)
    800041e4:	0087b783          	ld	a5,8(a5)
    800041e8:	000b0513          	mv	a0,s6
    800041ec:	000780e7          	jalr	a5
    delete waitForAll;
    800041f0:	00006517          	auipc	a0,0x6
    800041f4:	02853503          	ld	a0,40(a0) # 8000a218 <_ZL10waitForAll>
    800041f8:	00050863          	beqz	a0,80004208 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800041fc:	00053783          	ld	a5,0(a0)
    80004200:	0087b783          	ld	a5,8(a5)
    80004204:	000780e7          	jalr	a5
    delete buffer;
    80004208:	000a8e63          	beqz	s5,80004224 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    8000420c:	000a8513          	mv	a0,s5
    80004210:	00001097          	auipc	ra,0x1
    80004214:	8a8080e7          	jalr	-1880(ra) # 80004ab8 <_ZN9BufferCPPD1Ev>
    80004218:	000a8513          	mv	a0,s5
    8000421c:	ffffd097          	auipc	ra,0xffffd
    80004220:	718080e7          	jalr	1816(ra) # 80001934 <_ZdlPv>
    80004224:	000b8113          	mv	sp,s7

}
    80004228:	f8040113          	addi	sp,s0,-128
    8000422c:	07813083          	ld	ra,120(sp)
    80004230:	07013403          	ld	s0,112(sp)
    80004234:	06813483          	ld	s1,104(sp)
    80004238:	06013903          	ld	s2,96(sp)
    8000423c:	05813983          	ld	s3,88(sp)
    80004240:	05013a03          	ld	s4,80(sp)
    80004244:	04813a83          	ld	s5,72(sp)
    80004248:	04013b03          	ld	s6,64(sp)
    8000424c:	03813b83          	ld	s7,56(sp)
    80004250:	03013c03          	ld	s8,48(sp)
    80004254:	02813c83          	ld	s9,40(sp)
    80004258:	08010113          	addi	sp,sp,128
    8000425c:	00008067          	ret
    80004260:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004264:	000a8513          	mv	a0,s5
    80004268:	ffffd097          	auipc	ra,0xffffd
    8000426c:	6cc080e7          	jalr	1740(ra) # 80001934 <_ZdlPv>
    80004270:	00048513          	mv	a0,s1
    80004274:	00007097          	auipc	ra,0x7
    80004278:	084080e7          	jalr	132(ra) # 8000b2f8 <_Unwind_Resume>
    8000427c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004280:	00048513          	mv	a0,s1
    80004284:	ffffd097          	auipc	ra,0xffffd
    80004288:	6b0080e7          	jalr	1712(ra) # 80001934 <_ZdlPv>
    8000428c:	00090513          	mv	a0,s2
    80004290:	00007097          	auipc	ra,0x7
    80004294:	068080e7          	jalr	104(ra) # 8000b2f8 <_Unwind_Resume>
    80004298:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    8000429c:	000b0513          	mv	a0,s6
    800042a0:	ffffd097          	auipc	ra,0xffffd
    800042a4:	694080e7          	jalr	1684(ra) # 80001934 <_ZdlPv>
    800042a8:	00048513          	mv	a0,s1
    800042ac:	00007097          	auipc	ra,0x7
    800042b0:	04c080e7          	jalr	76(ra) # 8000b2f8 <_Unwind_Resume>
    800042b4:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800042b8:	000c8513          	mv	a0,s9
    800042bc:	ffffd097          	auipc	ra,0xffffd
    800042c0:	678080e7          	jalr	1656(ra) # 80001934 <_ZdlPv>
    800042c4:	00048513          	mv	a0,s1
    800042c8:	00007097          	auipc	ra,0x7
    800042cc:	030080e7          	jalr	48(ra) # 8000b2f8 <_Unwind_Resume>
    800042d0:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800042d4:	000c8513          	mv	a0,s9
    800042d8:	ffffd097          	auipc	ra,0xffffd
    800042dc:	65c080e7          	jalr	1628(ra) # 80001934 <_ZdlPv>
    800042e0:	00048513          	mv	a0,s1
    800042e4:	00007097          	auipc	ra,0x7
    800042e8:	014080e7          	jalr	20(ra) # 8000b2f8 <_Unwind_Resume>

00000000800042ec <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800042ec:	ff010113          	addi	sp,sp,-16
    800042f0:	00113423          	sd	ra,8(sp)
    800042f4:	00813023          	sd	s0,0(sp)
    800042f8:	01010413          	addi	s0,sp,16
    800042fc:	00006797          	auipc	a5,0x6
    80004300:	e2478793          	addi	a5,a5,-476 # 8000a120 <_ZTV12ConsumerSync+0x10>
    80004304:	00f53023          	sd	a5,0(a0)
    80004308:	ffffd097          	auipc	ra,0xffffd
    8000430c:	560080e7          	jalr	1376(ra) # 80001868 <_ZN6ThreadD1Ev>
    80004310:	00813083          	ld	ra,8(sp)
    80004314:	00013403          	ld	s0,0(sp)
    80004318:	01010113          	addi	sp,sp,16
    8000431c:	00008067          	ret

0000000080004320 <_ZN12ConsumerSyncD0Ev>:
    80004320:	fe010113          	addi	sp,sp,-32
    80004324:	00113c23          	sd	ra,24(sp)
    80004328:	00813823          	sd	s0,16(sp)
    8000432c:	00913423          	sd	s1,8(sp)
    80004330:	02010413          	addi	s0,sp,32
    80004334:	00050493          	mv	s1,a0
    80004338:	00006797          	auipc	a5,0x6
    8000433c:	de878793          	addi	a5,a5,-536 # 8000a120 <_ZTV12ConsumerSync+0x10>
    80004340:	00f53023          	sd	a5,0(a0)
    80004344:	ffffd097          	auipc	ra,0xffffd
    80004348:	524080e7          	jalr	1316(ra) # 80001868 <_ZN6ThreadD1Ev>
    8000434c:	00048513          	mv	a0,s1
    80004350:	ffffd097          	auipc	ra,0xffffd
    80004354:	5e4080e7          	jalr	1508(ra) # 80001934 <_ZdlPv>
    80004358:	01813083          	ld	ra,24(sp)
    8000435c:	01013403          	ld	s0,16(sp)
    80004360:	00813483          	ld	s1,8(sp)
    80004364:	02010113          	addi	sp,sp,32
    80004368:	00008067          	ret

000000008000436c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    8000436c:	ff010113          	addi	sp,sp,-16
    80004370:	00113423          	sd	ra,8(sp)
    80004374:	00813023          	sd	s0,0(sp)
    80004378:	01010413          	addi	s0,sp,16
    8000437c:	00006797          	auipc	a5,0x6
    80004380:	d7c78793          	addi	a5,a5,-644 # 8000a0f8 <_ZTV12ProducerSync+0x10>
    80004384:	00f53023          	sd	a5,0(a0)
    80004388:	ffffd097          	auipc	ra,0xffffd
    8000438c:	4e0080e7          	jalr	1248(ra) # 80001868 <_ZN6ThreadD1Ev>
    80004390:	00813083          	ld	ra,8(sp)
    80004394:	00013403          	ld	s0,0(sp)
    80004398:	01010113          	addi	sp,sp,16
    8000439c:	00008067          	ret

00000000800043a0 <_ZN12ProducerSyncD0Ev>:
    800043a0:	fe010113          	addi	sp,sp,-32
    800043a4:	00113c23          	sd	ra,24(sp)
    800043a8:	00813823          	sd	s0,16(sp)
    800043ac:	00913423          	sd	s1,8(sp)
    800043b0:	02010413          	addi	s0,sp,32
    800043b4:	00050493          	mv	s1,a0
    800043b8:	00006797          	auipc	a5,0x6
    800043bc:	d4078793          	addi	a5,a5,-704 # 8000a0f8 <_ZTV12ProducerSync+0x10>
    800043c0:	00f53023          	sd	a5,0(a0)
    800043c4:	ffffd097          	auipc	ra,0xffffd
    800043c8:	4a4080e7          	jalr	1188(ra) # 80001868 <_ZN6ThreadD1Ev>
    800043cc:	00048513          	mv	a0,s1
    800043d0:	ffffd097          	auipc	ra,0xffffd
    800043d4:	564080e7          	jalr	1380(ra) # 80001934 <_ZdlPv>
    800043d8:	01813083          	ld	ra,24(sp)
    800043dc:	01013403          	ld	s0,16(sp)
    800043e0:	00813483          	ld	s1,8(sp)
    800043e4:	02010113          	addi	sp,sp,32
    800043e8:	00008067          	ret

00000000800043ec <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800043ec:	ff010113          	addi	sp,sp,-16
    800043f0:	00113423          	sd	ra,8(sp)
    800043f4:	00813023          	sd	s0,0(sp)
    800043f8:	01010413          	addi	s0,sp,16
    800043fc:	00006797          	auipc	a5,0x6
    80004400:	cd478793          	addi	a5,a5,-812 # 8000a0d0 <_ZTV16ProducerKeyboard+0x10>
    80004404:	00f53023          	sd	a5,0(a0)
    80004408:	ffffd097          	auipc	ra,0xffffd
    8000440c:	460080e7          	jalr	1120(ra) # 80001868 <_ZN6ThreadD1Ev>
    80004410:	00813083          	ld	ra,8(sp)
    80004414:	00013403          	ld	s0,0(sp)
    80004418:	01010113          	addi	sp,sp,16
    8000441c:	00008067          	ret

0000000080004420 <_ZN16ProducerKeyboardD0Ev>:
    80004420:	fe010113          	addi	sp,sp,-32
    80004424:	00113c23          	sd	ra,24(sp)
    80004428:	00813823          	sd	s0,16(sp)
    8000442c:	00913423          	sd	s1,8(sp)
    80004430:	02010413          	addi	s0,sp,32
    80004434:	00050493          	mv	s1,a0
    80004438:	00006797          	auipc	a5,0x6
    8000443c:	c9878793          	addi	a5,a5,-872 # 8000a0d0 <_ZTV16ProducerKeyboard+0x10>
    80004440:	00f53023          	sd	a5,0(a0)
    80004444:	ffffd097          	auipc	ra,0xffffd
    80004448:	424080e7          	jalr	1060(ra) # 80001868 <_ZN6ThreadD1Ev>
    8000444c:	00048513          	mv	a0,s1
    80004450:	ffffd097          	auipc	ra,0xffffd
    80004454:	4e4080e7          	jalr	1252(ra) # 80001934 <_ZdlPv>
    80004458:	01813083          	ld	ra,24(sp)
    8000445c:	01013403          	ld	s0,16(sp)
    80004460:	00813483          	ld	s1,8(sp)
    80004464:	02010113          	addi	sp,sp,32
    80004468:	00008067          	ret

000000008000446c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    8000446c:	ff010113          	addi	sp,sp,-16
    80004470:	00113423          	sd	ra,8(sp)
    80004474:	00813023          	sd	s0,0(sp)
    80004478:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    8000447c:	02053583          	ld	a1,32(a0)
    80004480:	fffff097          	auipc	ra,0xfffff
    80004484:	7e4080e7          	jalr	2020(ra) # 80003c64 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004488:	00813083          	ld	ra,8(sp)
    8000448c:	00013403          	ld	s0,0(sp)
    80004490:	01010113          	addi	sp,sp,16
    80004494:	00008067          	ret

0000000080004498 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004498:	ff010113          	addi	sp,sp,-16
    8000449c:	00113423          	sd	ra,8(sp)
    800044a0:	00813023          	sd	s0,0(sp)
    800044a4:	01010413          	addi	s0,sp,16
        producer(td);
    800044a8:	02053583          	ld	a1,32(a0)
    800044ac:	00000097          	auipc	ra,0x0
    800044b0:	878080e7          	jalr	-1928(ra) # 80003d24 <_ZN12ProducerSync8producerEPv>
    }
    800044b4:	00813083          	ld	ra,8(sp)
    800044b8:	00013403          	ld	s0,0(sp)
    800044bc:	01010113          	addi	sp,sp,16
    800044c0:	00008067          	ret

00000000800044c4 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800044c4:	ff010113          	addi	sp,sp,-16
    800044c8:	00113423          	sd	ra,8(sp)
    800044cc:	00813023          	sd	s0,0(sp)
    800044d0:	01010413          	addi	s0,sp,16
        consumer(td);
    800044d4:	02053583          	ld	a1,32(a0)
    800044d8:	00000097          	auipc	ra,0x0
    800044dc:	8e0080e7          	jalr	-1824(ra) # 80003db8 <_ZN12ConsumerSync8consumerEPv>
    }
    800044e0:	00813083          	ld	ra,8(sp)
    800044e4:	00013403          	ld	s0,0(sp)
    800044e8:	01010113          	addi	sp,sp,16
    800044ec:	00008067          	ret

00000000800044f0 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800044f0:	fe010113          	addi	sp,sp,-32
    800044f4:	00113c23          	sd	ra,24(sp)
    800044f8:	00813823          	sd	s0,16(sp)
    800044fc:	00913423          	sd	s1,8(sp)
    80004500:	02010413          	addi	s0,sp,32
    80004504:	00050493          	mv	s1,a0
    LOCK();
    80004508:	00100613          	li	a2,1
    8000450c:	00000593          	li	a1,0
    80004510:	00006517          	auipc	a0,0x6
    80004514:	d1050513          	addi	a0,a0,-752 # 8000a220 <lockPrint>
    80004518:	ffffd097          	auipc	ra,0xffffd
    8000451c:	d0c080e7          	jalr	-756(ra) # 80001224 <copy_and_swap>
    80004520:	00050863          	beqz	a0,80004530 <_Z11printStringPKc+0x40>
    80004524:	ffffd097          	auipc	ra,0xffffd
    80004528:	e3c080e7          	jalr	-452(ra) # 80001360 <_Z15thread_dispatchv>
    8000452c:	fddff06f          	j	80004508 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004530:	0004c503          	lbu	a0,0(s1)
    80004534:	00050a63          	beqz	a0,80004548 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80004538:	ffffd097          	auipc	ra,0xffffd
    8000453c:	fa4080e7          	jalr	-92(ra) # 800014dc <_Z4putcc>
        string++;
    80004540:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004544:	fedff06f          	j	80004530 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004548:	00000613          	li	a2,0
    8000454c:	00100593          	li	a1,1
    80004550:	00006517          	auipc	a0,0x6
    80004554:	cd050513          	addi	a0,a0,-816 # 8000a220 <lockPrint>
    80004558:	ffffd097          	auipc	ra,0xffffd
    8000455c:	ccc080e7          	jalr	-820(ra) # 80001224 <copy_and_swap>
    80004560:	fe0514e3          	bnez	a0,80004548 <_Z11printStringPKc+0x58>
}
    80004564:	01813083          	ld	ra,24(sp)
    80004568:	01013403          	ld	s0,16(sp)
    8000456c:	00813483          	ld	s1,8(sp)
    80004570:	02010113          	addi	sp,sp,32
    80004574:	00008067          	ret

0000000080004578 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004578:	fd010113          	addi	sp,sp,-48
    8000457c:	02113423          	sd	ra,40(sp)
    80004580:	02813023          	sd	s0,32(sp)
    80004584:	00913c23          	sd	s1,24(sp)
    80004588:	01213823          	sd	s2,16(sp)
    8000458c:	01313423          	sd	s3,8(sp)
    80004590:	01413023          	sd	s4,0(sp)
    80004594:	03010413          	addi	s0,sp,48
    80004598:	00050993          	mv	s3,a0
    8000459c:	00058a13          	mv	s4,a1
    LOCK();
    800045a0:	00100613          	li	a2,1
    800045a4:	00000593          	li	a1,0
    800045a8:	00006517          	auipc	a0,0x6
    800045ac:	c7850513          	addi	a0,a0,-904 # 8000a220 <lockPrint>
    800045b0:	ffffd097          	auipc	ra,0xffffd
    800045b4:	c74080e7          	jalr	-908(ra) # 80001224 <copy_and_swap>
    800045b8:	00050863          	beqz	a0,800045c8 <_Z9getStringPci+0x50>
    800045bc:	ffffd097          	auipc	ra,0xffffd
    800045c0:	da4080e7          	jalr	-604(ra) # 80001360 <_Z15thread_dispatchv>
    800045c4:	fddff06f          	j	800045a0 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800045c8:	00000913          	li	s2,0
    800045cc:	00090493          	mv	s1,s2
    800045d0:	0019091b          	addiw	s2,s2,1
    800045d4:	03495a63          	bge	s2,s4,80004608 <_Z9getStringPci+0x90>
        cc = getc();
    800045d8:	ffffd097          	auipc	ra,0xffffd
    800045dc:	ed8080e7          	jalr	-296(ra) # 800014b0 <_Z4getcv>
        if(cc < 1)
    800045e0:	02050463          	beqz	a0,80004608 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800045e4:	009984b3          	add	s1,s3,s1
    800045e8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800045ec:	00a00793          	li	a5,10
    800045f0:	00f50a63          	beq	a0,a5,80004604 <_Z9getStringPci+0x8c>
    800045f4:	00d00793          	li	a5,13
    800045f8:	fcf51ae3          	bne	a0,a5,800045cc <_Z9getStringPci+0x54>
        buf[i++] = c;
    800045fc:	00090493          	mv	s1,s2
    80004600:	0080006f          	j	80004608 <_Z9getStringPci+0x90>
    80004604:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004608:	009984b3          	add	s1,s3,s1
    8000460c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004610:	00000613          	li	a2,0
    80004614:	00100593          	li	a1,1
    80004618:	00006517          	auipc	a0,0x6
    8000461c:	c0850513          	addi	a0,a0,-1016 # 8000a220 <lockPrint>
    80004620:	ffffd097          	auipc	ra,0xffffd
    80004624:	c04080e7          	jalr	-1020(ra) # 80001224 <copy_and_swap>
    80004628:	fe0514e3          	bnez	a0,80004610 <_Z9getStringPci+0x98>
    return buf;
}
    8000462c:	00098513          	mv	a0,s3
    80004630:	02813083          	ld	ra,40(sp)
    80004634:	02013403          	ld	s0,32(sp)
    80004638:	01813483          	ld	s1,24(sp)
    8000463c:	01013903          	ld	s2,16(sp)
    80004640:	00813983          	ld	s3,8(sp)
    80004644:	00013a03          	ld	s4,0(sp)
    80004648:	03010113          	addi	sp,sp,48
    8000464c:	00008067          	ret

0000000080004650 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004650:	ff010113          	addi	sp,sp,-16
    80004654:	00813423          	sd	s0,8(sp)
    80004658:	01010413          	addi	s0,sp,16
    8000465c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004660:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004664:	0006c603          	lbu	a2,0(a3)
    80004668:	fd06071b          	addiw	a4,a2,-48
    8000466c:	0ff77713          	andi	a4,a4,255
    80004670:	00900793          	li	a5,9
    80004674:	02e7e063          	bltu	a5,a4,80004694 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004678:	0025179b          	slliw	a5,a0,0x2
    8000467c:	00a787bb          	addw	a5,a5,a0
    80004680:	0017979b          	slliw	a5,a5,0x1
    80004684:	00168693          	addi	a3,a3,1
    80004688:	00c787bb          	addw	a5,a5,a2
    8000468c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004690:	fd5ff06f          	j	80004664 <_Z11stringToIntPKc+0x14>
    return n;
}
    80004694:	00813403          	ld	s0,8(sp)
    80004698:	01010113          	addi	sp,sp,16
    8000469c:	00008067          	ret

00000000800046a0 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800046a0:	fc010113          	addi	sp,sp,-64
    800046a4:	02113c23          	sd	ra,56(sp)
    800046a8:	02813823          	sd	s0,48(sp)
    800046ac:	02913423          	sd	s1,40(sp)
    800046b0:	03213023          	sd	s2,32(sp)
    800046b4:	01313c23          	sd	s3,24(sp)
    800046b8:	04010413          	addi	s0,sp,64
    800046bc:	00050493          	mv	s1,a0
    800046c0:	00058913          	mv	s2,a1
    800046c4:	00060993          	mv	s3,a2
    LOCK();
    800046c8:	00100613          	li	a2,1
    800046cc:	00000593          	li	a1,0
    800046d0:	00006517          	auipc	a0,0x6
    800046d4:	b5050513          	addi	a0,a0,-1200 # 8000a220 <lockPrint>
    800046d8:	ffffd097          	auipc	ra,0xffffd
    800046dc:	b4c080e7          	jalr	-1204(ra) # 80001224 <copy_and_swap>
    800046e0:	00050863          	beqz	a0,800046f0 <_Z8printIntiii+0x50>
    800046e4:	ffffd097          	auipc	ra,0xffffd
    800046e8:	c7c080e7          	jalr	-900(ra) # 80001360 <_Z15thread_dispatchv>
    800046ec:	fddff06f          	j	800046c8 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800046f0:	00098463          	beqz	s3,800046f8 <_Z8printIntiii+0x58>
    800046f4:	0804c463          	bltz	s1,8000477c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800046f8:	0004851b          	sext.w	a0,s1
    neg = 0;
    800046fc:	00000593          	li	a1,0
    }

    i = 0;
    80004700:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80004704:	0009079b          	sext.w	a5,s2
    80004708:	0325773b          	remuw	a4,a0,s2
    8000470c:	00048613          	mv	a2,s1
    80004710:	0014849b          	addiw	s1,s1,1
    80004714:	02071693          	slli	a3,a4,0x20
    80004718:	0206d693          	srli	a3,a3,0x20
    8000471c:	00006717          	auipc	a4,0x6
    80004720:	a1c70713          	addi	a4,a4,-1508 # 8000a138 <digits>
    80004724:	00d70733          	add	a4,a4,a3
    80004728:	00074683          	lbu	a3,0(a4)
    8000472c:	fd040713          	addi	a4,s0,-48
    80004730:	00c70733          	add	a4,a4,a2
    80004734:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004738:	0005071b          	sext.w	a4,a0
    8000473c:	0325553b          	divuw	a0,a0,s2
    80004740:	fcf772e3          	bgeu	a4,a5,80004704 <_Z8printIntiii+0x64>
    if(neg)
    80004744:	00058c63          	beqz	a1,8000475c <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80004748:	fd040793          	addi	a5,s0,-48
    8000474c:	009784b3          	add	s1,a5,s1
    80004750:	02d00793          	li	a5,45
    80004754:	fef48823          	sb	a5,-16(s1)
    80004758:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    8000475c:	fff4849b          	addiw	s1,s1,-1
    80004760:	0204c463          	bltz	s1,80004788 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80004764:	fd040793          	addi	a5,s0,-48
    80004768:	009787b3          	add	a5,a5,s1
    8000476c:	ff07c503          	lbu	a0,-16(a5)
    80004770:	ffffd097          	auipc	ra,0xffffd
    80004774:	d6c080e7          	jalr	-660(ra) # 800014dc <_Z4putcc>
    80004778:	fe5ff06f          	j	8000475c <_Z8printIntiii+0xbc>
        x = -xx;
    8000477c:	4090053b          	negw	a0,s1
        neg = 1;
    80004780:	00100593          	li	a1,1
        x = -xx;
    80004784:	f7dff06f          	j	80004700 <_Z8printIntiii+0x60>

    UNLOCK();
    80004788:	00000613          	li	a2,0
    8000478c:	00100593          	li	a1,1
    80004790:	00006517          	auipc	a0,0x6
    80004794:	a9050513          	addi	a0,a0,-1392 # 8000a220 <lockPrint>
    80004798:	ffffd097          	auipc	ra,0xffffd
    8000479c:	a8c080e7          	jalr	-1396(ra) # 80001224 <copy_and_swap>
    800047a0:	fe0514e3          	bnez	a0,80004788 <_Z8printIntiii+0xe8>
    800047a4:	03813083          	ld	ra,56(sp)
    800047a8:	03013403          	ld	s0,48(sp)
    800047ac:	02813483          	ld	s1,40(sp)
    800047b0:	02013903          	ld	s2,32(sp)
    800047b4:	01813983          	ld	s3,24(sp)
    800047b8:	04010113          	addi	sp,sp,64
    800047bc:	00008067          	ret

00000000800047c0 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800047c0:	fd010113          	addi	sp,sp,-48
    800047c4:	02113423          	sd	ra,40(sp)
    800047c8:	02813023          	sd	s0,32(sp)
    800047cc:	00913c23          	sd	s1,24(sp)
    800047d0:	01213823          	sd	s2,16(sp)
    800047d4:	01313423          	sd	s3,8(sp)
    800047d8:	03010413          	addi	s0,sp,48
    800047dc:	00050493          	mv	s1,a0
    800047e0:	00058913          	mv	s2,a1
    800047e4:	0015879b          	addiw	a5,a1,1
    800047e8:	0007851b          	sext.w	a0,a5
    800047ec:	00f4a023          	sw	a5,0(s1)
    800047f0:	0004a823          	sw	zero,16(s1)
    800047f4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800047f8:	00251513          	slli	a0,a0,0x2
    800047fc:	ffffd097          	auipc	ra,0xffffd
    80004800:	a48080e7          	jalr	-1464(ra) # 80001244 <_Z9mem_allocm>
    80004804:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80004808:	01000513          	li	a0,16
    8000480c:	ffffd097          	auipc	ra,0xffffd
    80004810:	0d8080e7          	jalr	216(ra) # 800018e4 <_Znwm>
    80004814:	00050993          	mv	s3,a0
    80004818:	00000593          	li	a1,0
    8000481c:	ffffd097          	auipc	ra,0xffffd
    80004820:	2bc080e7          	jalr	700(ra) # 80001ad8 <_ZN9SemaphoreC1Ej>
    80004824:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80004828:	01000513          	li	a0,16
    8000482c:	ffffd097          	auipc	ra,0xffffd
    80004830:	0b8080e7          	jalr	184(ra) # 800018e4 <_Znwm>
    80004834:	00050993          	mv	s3,a0
    80004838:	00090593          	mv	a1,s2
    8000483c:	ffffd097          	auipc	ra,0xffffd
    80004840:	29c080e7          	jalr	668(ra) # 80001ad8 <_ZN9SemaphoreC1Ej>
    80004844:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004848:	01000513          	li	a0,16
    8000484c:	ffffd097          	auipc	ra,0xffffd
    80004850:	098080e7          	jalr	152(ra) # 800018e4 <_Znwm>
    80004854:	00050913          	mv	s2,a0
    80004858:	00100593          	li	a1,1
    8000485c:	ffffd097          	auipc	ra,0xffffd
    80004860:	27c080e7          	jalr	636(ra) # 80001ad8 <_ZN9SemaphoreC1Ej>
    80004864:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004868:	01000513          	li	a0,16
    8000486c:	ffffd097          	auipc	ra,0xffffd
    80004870:	078080e7          	jalr	120(ra) # 800018e4 <_Znwm>
    80004874:	00050913          	mv	s2,a0
    80004878:	00100593          	li	a1,1
    8000487c:	ffffd097          	auipc	ra,0xffffd
    80004880:	25c080e7          	jalr	604(ra) # 80001ad8 <_ZN9SemaphoreC1Ej>
    80004884:	0324b823          	sd	s2,48(s1)
}
    80004888:	02813083          	ld	ra,40(sp)
    8000488c:	02013403          	ld	s0,32(sp)
    80004890:	01813483          	ld	s1,24(sp)
    80004894:	01013903          	ld	s2,16(sp)
    80004898:	00813983          	ld	s3,8(sp)
    8000489c:	03010113          	addi	sp,sp,48
    800048a0:	00008067          	ret
    800048a4:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800048a8:	00098513          	mv	a0,s3
    800048ac:	ffffd097          	auipc	ra,0xffffd
    800048b0:	088080e7          	jalr	136(ra) # 80001934 <_ZdlPv>
    800048b4:	00048513          	mv	a0,s1
    800048b8:	00007097          	auipc	ra,0x7
    800048bc:	a40080e7          	jalr	-1472(ra) # 8000b2f8 <_Unwind_Resume>
    800048c0:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800048c4:	00098513          	mv	a0,s3
    800048c8:	ffffd097          	auipc	ra,0xffffd
    800048cc:	06c080e7          	jalr	108(ra) # 80001934 <_ZdlPv>
    800048d0:	00048513          	mv	a0,s1
    800048d4:	00007097          	auipc	ra,0x7
    800048d8:	a24080e7          	jalr	-1500(ra) # 8000b2f8 <_Unwind_Resume>
    800048dc:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800048e0:	00090513          	mv	a0,s2
    800048e4:	ffffd097          	auipc	ra,0xffffd
    800048e8:	050080e7          	jalr	80(ra) # 80001934 <_ZdlPv>
    800048ec:	00048513          	mv	a0,s1
    800048f0:	00007097          	auipc	ra,0x7
    800048f4:	a08080e7          	jalr	-1528(ra) # 8000b2f8 <_Unwind_Resume>
    800048f8:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800048fc:	00090513          	mv	a0,s2
    80004900:	ffffd097          	auipc	ra,0xffffd
    80004904:	034080e7          	jalr	52(ra) # 80001934 <_ZdlPv>
    80004908:	00048513          	mv	a0,s1
    8000490c:	00007097          	auipc	ra,0x7
    80004910:	9ec080e7          	jalr	-1556(ra) # 8000b2f8 <_Unwind_Resume>

0000000080004914 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004914:	fe010113          	addi	sp,sp,-32
    80004918:	00113c23          	sd	ra,24(sp)
    8000491c:	00813823          	sd	s0,16(sp)
    80004920:	00913423          	sd	s1,8(sp)
    80004924:	01213023          	sd	s2,0(sp)
    80004928:	02010413          	addi	s0,sp,32
    8000492c:	00050493          	mv	s1,a0
    80004930:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004934:	01853503          	ld	a0,24(a0)
    80004938:	ffffd097          	auipc	ra,0xffffd
    8000493c:	1d8080e7          	jalr	472(ra) # 80001b10 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80004940:	0304b503          	ld	a0,48(s1)
    80004944:	ffffd097          	auipc	ra,0xffffd
    80004948:	1cc080e7          	jalr	460(ra) # 80001b10 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000494c:	0084b783          	ld	a5,8(s1)
    80004950:	0144a703          	lw	a4,20(s1)
    80004954:	00271713          	slli	a4,a4,0x2
    80004958:	00e787b3          	add	a5,a5,a4
    8000495c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004960:	0144a783          	lw	a5,20(s1)
    80004964:	0017879b          	addiw	a5,a5,1
    80004968:	0004a703          	lw	a4,0(s1)
    8000496c:	02e7e7bb          	remw	a5,a5,a4
    80004970:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004974:	0304b503          	ld	a0,48(s1)
    80004978:	ffffd097          	auipc	ra,0xffffd
    8000497c:	1c4080e7          	jalr	452(ra) # 80001b3c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80004980:	0204b503          	ld	a0,32(s1)
    80004984:	ffffd097          	auipc	ra,0xffffd
    80004988:	1b8080e7          	jalr	440(ra) # 80001b3c <_ZN9Semaphore6signalEv>

}
    8000498c:	01813083          	ld	ra,24(sp)
    80004990:	01013403          	ld	s0,16(sp)
    80004994:	00813483          	ld	s1,8(sp)
    80004998:	00013903          	ld	s2,0(sp)
    8000499c:	02010113          	addi	sp,sp,32
    800049a0:	00008067          	ret

00000000800049a4 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800049a4:	fe010113          	addi	sp,sp,-32
    800049a8:	00113c23          	sd	ra,24(sp)
    800049ac:	00813823          	sd	s0,16(sp)
    800049b0:	00913423          	sd	s1,8(sp)
    800049b4:	01213023          	sd	s2,0(sp)
    800049b8:	02010413          	addi	s0,sp,32
    800049bc:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800049c0:	02053503          	ld	a0,32(a0)
    800049c4:	ffffd097          	auipc	ra,0xffffd
    800049c8:	14c080e7          	jalr	332(ra) # 80001b10 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800049cc:	0284b503          	ld	a0,40(s1)
    800049d0:	ffffd097          	auipc	ra,0xffffd
    800049d4:	140080e7          	jalr	320(ra) # 80001b10 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800049d8:	0084b703          	ld	a4,8(s1)
    800049dc:	0104a783          	lw	a5,16(s1)
    800049e0:	00279693          	slli	a3,a5,0x2
    800049e4:	00d70733          	add	a4,a4,a3
    800049e8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800049ec:	0017879b          	addiw	a5,a5,1
    800049f0:	0004a703          	lw	a4,0(s1)
    800049f4:	02e7e7bb          	remw	a5,a5,a4
    800049f8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800049fc:	0284b503          	ld	a0,40(s1)
    80004a00:	ffffd097          	auipc	ra,0xffffd
    80004a04:	13c080e7          	jalr	316(ra) # 80001b3c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80004a08:	0184b503          	ld	a0,24(s1)
    80004a0c:	ffffd097          	auipc	ra,0xffffd
    80004a10:	130080e7          	jalr	304(ra) # 80001b3c <_ZN9Semaphore6signalEv>

    return ret;
}
    80004a14:	00090513          	mv	a0,s2
    80004a18:	01813083          	ld	ra,24(sp)
    80004a1c:	01013403          	ld	s0,16(sp)
    80004a20:	00813483          	ld	s1,8(sp)
    80004a24:	00013903          	ld	s2,0(sp)
    80004a28:	02010113          	addi	sp,sp,32
    80004a2c:	00008067          	ret

0000000080004a30 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004a30:	fe010113          	addi	sp,sp,-32
    80004a34:	00113c23          	sd	ra,24(sp)
    80004a38:	00813823          	sd	s0,16(sp)
    80004a3c:	00913423          	sd	s1,8(sp)
    80004a40:	01213023          	sd	s2,0(sp)
    80004a44:	02010413          	addi	s0,sp,32
    80004a48:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004a4c:	02853503          	ld	a0,40(a0)
    80004a50:	ffffd097          	auipc	ra,0xffffd
    80004a54:	0c0080e7          	jalr	192(ra) # 80001b10 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004a58:	0304b503          	ld	a0,48(s1)
    80004a5c:	ffffd097          	auipc	ra,0xffffd
    80004a60:	0b4080e7          	jalr	180(ra) # 80001b10 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80004a64:	0144a783          	lw	a5,20(s1)
    80004a68:	0104a903          	lw	s2,16(s1)
    80004a6c:	0327ce63          	blt	a5,s2,80004aa8 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80004a70:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004a74:	0304b503          	ld	a0,48(s1)
    80004a78:	ffffd097          	auipc	ra,0xffffd
    80004a7c:	0c4080e7          	jalr	196(ra) # 80001b3c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80004a80:	0284b503          	ld	a0,40(s1)
    80004a84:	ffffd097          	auipc	ra,0xffffd
    80004a88:	0b8080e7          	jalr	184(ra) # 80001b3c <_ZN9Semaphore6signalEv>

    return ret;
}
    80004a8c:	00090513          	mv	a0,s2
    80004a90:	01813083          	ld	ra,24(sp)
    80004a94:	01013403          	ld	s0,16(sp)
    80004a98:	00813483          	ld	s1,8(sp)
    80004a9c:	00013903          	ld	s2,0(sp)
    80004aa0:	02010113          	addi	sp,sp,32
    80004aa4:	00008067          	ret
        ret = cap - head + tail;
    80004aa8:	0004a703          	lw	a4,0(s1)
    80004aac:	4127093b          	subw	s2,a4,s2
    80004ab0:	00f9093b          	addw	s2,s2,a5
    80004ab4:	fc1ff06f          	j	80004a74 <_ZN9BufferCPP6getCntEv+0x44>

0000000080004ab8 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004ab8:	fe010113          	addi	sp,sp,-32
    80004abc:	00113c23          	sd	ra,24(sp)
    80004ac0:	00813823          	sd	s0,16(sp)
    80004ac4:	00913423          	sd	s1,8(sp)
    80004ac8:	02010413          	addi	s0,sp,32
    80004acc:	00050493          	mv	s1,a0
    Console::putc('\n');
    80004ad0:	00a00513          	li	a0,10
    80004ad4:	ffffd097          	auipc	ra,0xffffd
    80004ad8:	114080e7          	jalr	276(ra) # 80001be8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80004adc:	00004517          	auipc	a0,0x4
    80004ae0:	ae450513          	addi	a0,a0,-1308 # 800085c0 <CONSOLE_STATUS+0x5b0>
    80004ae4:	00000097          	auipc	ra,0x0
    80004ae8:	a0c080e7          	jalr	-1524(ra) # 800044f0 <_Z11printStringPKc>
    while (getCnt()) {
    80004aec:	00048513          	mv	a0,s1
    80004af0:	00000097          	auipc	ra,0x0
    80004af4:	f40080e7          	jalr	-192(ra) # 80004a30 <_ZN9BufferCPP6getCntEv>
    80004af8:	02050c63          	beqz	a0,80004b30 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004afc:	0084b783          	ld	a5,8(s1)
    80004b00:	0104a703          	lw	a4,16(s1)
    80004b04:	00271713          	slli	a4,a4,0x2
    80004b08:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80004b0c:	0007c503          	lbu	a0,0(a5)
    80004b10:	ffffd097          	auipc	ra,0xffffd
    80004b14:	0d8080e7          	jalr	216(ra) # 80001be8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80004b18:	0104a783          	lw	a5,16(s1)
    80004b1c:	0017879b          	addiw	a5,a5,1
    80004b20:	0004a703          	lw	a4,0(s1)
    80004b24:	02e7e7bb          	remw	a5,a5,a4
    80004b28:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004b2c:	fc1ff06f          	j	80004aec <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80004b30:	02100513          	li	a0,33
    80004b34:	ffffd097          	auipc	ra,0xffffd
    80004b38:	0b4080e7          	jalr	180(ra) # 80001be8 <_ZN7Console4putcEc>
    Console::putc('\n');
    80004b3c:	00a00513          	li	a0,10
    80004b40:	ffffd097          	auipc	ra,0xffffd
    80004b44:	0a8080e7          	jalr	168(ra) # 80001be8 <_ZN7Console4putcEc>
    mem_free(buffer);
    80004b48:	0084b503          	ld	a0,8(s1)
    80004b4c:	ffffc097          	auipc	ra,0xffffc
    80004b50:	738080e7          	jalr	1848(ra) # 80001284 <_Z8mem_freePv>
    delete itemAvailable;
    80004b54:	0204b503          	ld	a0,32(s1)
    80004b58:	00050863          	beqz	a0,80004b68 <_ZN9BufferCPPD1Ev+0xb0>
    80004b5c:	00053783          	ld	a5,0(a0)
    80004b60:	0087b783          	ld	a5,8(a5)
    80004b64:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004b68:	0184b503          	ld	a0,24(s1)
    80004b6c:	00050863          	beqz	a0,80004b7c <_ZN9BufferCPPD1Ev+0xc4>
    80004b70:	00053783          	ld	a5,0(a0)
    80004b74:	0087b783          	ld	a5,8(a5)
    80004b78:	000780e7          	jalr	a5
    delete mutexTail;
    80004b7c:	0304b503          	ld	a0,48(s1)
    80004b80:	00050863          	beqz	a0,80004b90 <_ZN9BufferCPPD1Ev+0xd8>
    80004b84:	00053783          	ld	a5,0(a0)
    80004b88:	0087b783          	ld	a5,8(a5)
    80004b8c:	000780e7          	jalr	a5
    delete mutexHead;
    80004b90:	0284b503          	ld	a0,40(s1)
    80004b94:	00050863          	beqz	a0,80004ba4 <_ZN9BufferCPPD1Ev+0xec>
    80004b98:	00053783          	ld	a5,0(a0)
    80004b9c:	0087b783          	ld	a5,8(a5)
    80004ba0:	000780e7          	jalr	a5
}
    80004ba4:	01813083          	ld	ra,24(sp)
    80004ba8:	01013403          	ld	s0,16(sp)
    80004bac:	00813483          	ld	s1,8(sp)
    80004bb0:	02010113          	addi	sp,sp,32
    80004bb4:	00008067          	ret

0000000080004bb8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004bb8:	fe010113          	addi	sp,sp,-32
    80004bbc:	00113c23          	sd	ra,24(sp)
    80004bc0:	00813823          	sd	s0,16(sp)
    80004bc4:	00913423          	sd	s1,8(sp)
    80004bc8:	01213023          	sd	s2,0(sp)
    80004bcc:	02010413          	addi	s0,sp,32
    80004bd0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004bd4:	00100793          	li	a5,1
    80004bd8:	02a7f863          	bgeu	a5,a0,80004c08 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004bdc:	00a00793          	li	a5,10
    80004be0:	02f577b3          	remu	a5,a0,a5
    80004be4:	02078e63          	beqz	a5,80004c20 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004be8:	fff48513          	addi	a0,s1,-1
    80004bec:	00000097          	auipc	ra,0x0
    80004bf0:	fcc080e7          	jalr	-52(ra) # 80004bb8 <_ZL9fibonaccim>
    80004bf4:	00050913          	mv	s2,a0
    80004bf8:	ffe48513          	addi	a0,s1,-2
    80004bfc:	00000097          	auipc	ra,0x0
    80004c00:	fbc080e7          	jalr	-68(ra) # 80004bb8 <_ZL9fibonaccim>
    80004c04:	00a90533          	add	a0,s2,a0
}
    80004c08:	01813083          	ld	ra,24(sp)
    80004c0c:	01013403          	ld	s0,16(sp)
    80004c10:	00813483          	ld	s1,8(sp)
    80004c14:	00013903          	ld	s2,0(sp)
    80004c18:	02010113          	addi	sp,sp,32
    80004c1c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004c20:	ffffc097          	auipc	ra,0xffffc
    80004c24:	740080e7          	jalr	1856(ra) # 80001360 <_Z15thread_dispatchv>
    80004c28:	fc1ff06f          	j	80004be8 <_ZL9fibonaccim+0x30>

0000000080004c2c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004c2c:	fe010113          	addi	sp,sp,-32
    80004c30:	00113c23          	sd	ra,24(sp)
    80004c34:	00813823          	sd	s0,16(sp)
    80004c38:	00913423          	sd	s1,8(sp)
    80004c3c:	01213023          	sd	s2,0(sp)
    80004c40:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004c44:	00a00493          	li	s1,10
    80004c48:	0400006f          	j	80004c88 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004c4c:	00004517          	auipc	a0,0x4
    80004c50:	8dc50513          	addi	a0,a0,-1828 # 80008528 <CONSOLE_STATUS+0x518>
    80004c54:	00000097          	auipc	ra,0x0
    80004c58:	89c080e7          	jalr	-1892(ra) # 800044f0 <_Z11printStringPKc>
    80004c5c:	00000613          	li	a2,0
    80004c60:	00a00593          	li	a1,10
    80004c64:	00048513          	mv	a0,s1
    80004c68:	00000097          	auipc	ra,0x0
    80004c6c:	a38080e7          	jalr	-1480(ra) # 800046a0 <_Z8printIntiii>
    80004c70:	00003517          	auipc	a0,0x3
    80004c74:	52050513          	addi	a0,a0,1312 # 80008190 <CONSOLE_STATUS+0x180>
    80004c78:	00000097          	auipc	ra,0x0
    80004c7c:	878080e7          	jalr	-1928(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004c80:	0014849b          	addiw	s1,s1,1
    80004c84:	0ff4f493          	andi	s1,s1,255
    80004c88:	00c00793          	li	a5,12
    80004c8c:	fc97f0e3          	bgeu	a5,s1,80004c4c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004c90:	00004517          	auipc	a0,0x4
    80004c94:	8a050513          	addi	a0,a0,-1888 # 80008530 <CONSOLE_STATUS+0x520>
    80004c98:	00000097          	auipc	ra,0x0
    80004c9c:	858080e7          	jalr	-1960(ra) # 800044f0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004ca0:	00500313          	li	t1,5
    thread_dispatch();
    80004ca4:	ffffc097          	auipc	ra,0xffffc
    80004ca8:	6bc080e7          	jalr	1724(ra) # 80001360 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004cac:	01000513          	li	a0,16
    80004cb0:	00000097          	auipc	ra,0x0
    80004cb4:	f08080e7          	jalr	-248(ra) # 80004bb8 <_ZL9fibonaccim>
    80004cb8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004cbc:	00004517          	auipc	a0,0x4
    80004cc0:	88450513          	addi	a0,a0,-1916 # 80008540 <CONSOLE_STATUS+0x530>
    80004cc4:	00000097          	auipc	ra,0x0
    80004cc8:	82c080e7          	jalr	-2004(ra) # 800044f0 <_Z11printStringPKc>
    80004ccc:	00000613          	li	a2,0
    80004cd0:	00a00593          	li	a1,10
    80004cd4:	0009051b          	sext.w	a0,s2
    80004cd8:	00000097          	auipc	ra,0x0
    80004cdc:	9c8080e7          	jalr	-1592(ra) # 800046a0 <_Z8printIntiii>
    80004ce0:	00003517          	auipc	a0,0x3
    80004ce4:	4b050513          	addi	a0,a0,1200 # 80008190 <CONSOLE_STATUS+0x180>
    80004ce8:	00000097          	auipc	ra,0x0
    80004cec:	808080e7          	jalr	-2040(ra) # 800044f0 <_Z11printStringPKc>
    80004cf0:	0400006f          	j	80004d30 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cf4:	00004517          	auipc	a0,0x4
    80004cf8:	83450513          	addi	a0,a0,-1996 # 80008528 <CONSOLE_STATUS+0x518>
    80004cfc:	fffff097          	auipc	ra,0xfffff
    80004d00:	7f4080e7          	jalr	2036(ra) # 800044f0 <_Z11printStringPKc>
    80004d04:	00000613          	li	a2,0
    80004d08:	00a00593          	li	a1,10
    80004d0c:	00048513          	mv	a0,s1
    80004d10:	00000097          	auipc	ra,0x0
    80004d14:	990080e7          	jalr	-1648(ra) # 800046a0 <_Z8printIntiii>
    80004d18:	00003517          	auipc	a0,0x3
    80004d1c:	47850513          	addi	a0,a0,1144 # 80008190 <CONSOLE_STATUS+0x180>
    80004d20:	fffff097          	auipc	ra,0xfffff
    80004d24:	7d0080e7          	jalr	2000(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004d28:	0014849b          	addiw	s1,s1,1
    80004d2c:	0ff4f493          	andi	s1,s1,255
    80004d30:	00f00793          	li	a5,15
    80004d34:	fc97f0e3          	bgeu	a5,s1,80004cf4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004d38:	00004517          	auipc	a0,0x4
    80004d3c:	81850513          	addi	a0,a0,-2024 # 80008550 <CONSOLE_STATUS+0x540>
    80004d40:	fffff097          	auipc	ra,0xfffff
    80004d44:	7b0080e7          	jalr	1968(ra) # 800044f0 <_Z11printStringPKc>
    finishedD = true;
    80004d48:	00100793          	li	a5,1
    80004d4c:	00005717          	auipc	a4,0x5
    80004d50:	4cf70e23          	sb	a5,1244(a4) # 8000a228 <_ZL9finishedD>
    thread_dispatch();
    80004d54:	ffffc097          	auipc	ra,0xffffc
    80004d58:	60c080e7          	jalr	1548(ra) # 80001360 <_Z15thread_dispatchv>
}
    80004d5c:	01813083          	ld	ra,24(sp)
    80004d60:	01013403          	ld	s0,16(sp)
    80004d64:	00813483          	ld	s1,8(sp)
    80004d68:	00013903          	ld	s2,0(sp)
    80004d6c:	02010113          	addi	sp,sp,32
    80004d70:	00008067          	ret

0000000080004d74 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004d74:	fe010113          	addi	sp,sp,-32
    80004d78:	00113c23          	sd	ra,24(sp)
    80004d7c:	00813823          	sd	s0,16(sp)
    80004d80:	00913423          	sd	s1,8(sp)
    80004d84:	01213023          	sd	s2,0(sp)
    80004d88:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004d8c:	00000493          	li	s1,0
    80004d90:	0400006f          	j	80004dd0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004d94:	00003517          	auipc	a0,0x3
    80004d98:	76450513          	addi	a0,a0,1892 # 800084f8 <CONSOLE_STATUS+0x4e8>
    80004d9c:	fffff097          	auipc	ra,0xfffff
    80004da0:	754080e7          	jalr	1876(ra) # 800044f0 <_Z11printStringPKc>
    80004da4:	00000613          	li	a2,0
    80004da8:	00a00593          	li	a1,10
    80004dac:	00048513          	mv	a0,s1
    80004db0:	00000097          	auipc	ra,0x0
    80004db4:	8f0080e7          	jalr	-1808(ra) # 800046a0 <_Z8printIntiii>
    80004db8:	00003517          	auipc	a0,0x3
    80004dbc:	3d850513          	addi	a0,a0,984 # 80008190 <CONSOLE_STATUS+0x180>
    80004dc0:	fffff097          	auipc	ra,0xfffff
    80004dc4:	730080e7          	jalr	1840(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004dc8:	0014849b          	addiw	s1,s1,1
    80004dcc:	0ff4f493          	andi	s1,s1,255
    80004dd0:	00200793          	li	a5,2
    80004dd4:	fc97f0e3          	bgeu	a5,s1,80004d94 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004dd8:	00003517          	auipc	a0,0x3
    80004ddc:	72850513          	addi	a0,a0,1832 # 80008500 <CONSOLE_STATUS+0x4f0>
    80004de0:	fffff097          	auipc	ra,0xfffff
    80004de4:	710080e7          	jalr	1808(ra) # 800044f0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004de8:	00700313          	li	t1,7
    thread_dispatch();
    80004dec:	ffffc097          	auipc	ra,0xffffc
    80004df0:	574080e7          	jalr	1396(ra) # 80001360 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004df4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004df8:	00003517          	auipc	a0,0x3
    80004dfc:	71850513          	addi	a0,a0,1816 # 80008510 <CONSOLE_STATUS+0x500>
    80004e00:	fffff097          	auipc	ra,0xfffff
    80004e04:	6f0080e7          	jalr	1776(ra) # 800044f0 <_Z11printStringPKc>
    80004e08:	00000613          	li	a2,0
    80004e0c:	00a00593          	li	a1,10
    80004e10:	0009051b          	sext.w	a0,s2
    80004e14:	00000097          	auipc	ra,0x0
    80004e18:	88c080e7          	jalr	-1908(ra) # 800046a0 <_Z8printIntiii>
    80004e1c:	00003517          	auipc	a0,0x3
    80004e20:	37450513          	addi	a0,a0,884 # 80008190 <CONSOLE_STATUS+0x180>
    80004e24:	fffff097          	auipc	ra,0xfffff
    80004e28:	6cc080e7          	jalr	1740(ra) # 800044f0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004e2c:	00c00513          	li	a0,12
    80004e30:	00000097          	auipc	ra,0x0
    80004e34:	d88080e7          	jalr	-632(ra) # 80004bb8 <_ZL9fibonaccim>
    80004e38:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004e3c:	00003517          	auipc	a0,0x3
    80004e40:	6dc50513          	addi	a0,a0,1756 # 80008518 <CONSOLE_STATUS+0x508>
    80004e44:	fffff097          	auipc	ra,0xfffff
    80004e48:	6ac080e7          	jalr	1708(ra) # 800044f0 <_Z11printStringPKc>
    80004e4c:	00000613          	li	a2,0
    80004e50:	00a00593          	li	a1,10
    80004e54:	0009051b          	sext.w	a0,s2
    80004e58:	00000097          	auipc	ra,0x0
    80004e5c:	848080e7          	jalr	-1976(ra) # 800046a0 <_Z8printIntiii>
    80004e60:	00003517          	auipc	a0,0x3
    80004e64:	33050513          	addi	a0,a0,816 # 80008190 <CONSOLE_STATUS+0x180>
    80004e68:	fffff097          	auipc	ra,0xfffff
    80004e6c:	688080e7          	jalr	1672(ra) # 800044f0 <_Z11printStringPKc>
    80004e70:	0400006f          	j	80004eb0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004e74:	00003517          	auipc	a0,0x3
    80004e78:	68450513          	addi	a0,a0,1668 # 800084f8 <CONSOLE_STATUS+0x4e8>
    80004e7c:	fffff097          	auipc	ra,0xfffff
    80004e80:	674080e7          	jalr	1652(ra) # 800044f0 <_Z11printStringPKc>
    80004e84:	00000613          	li	a2,0
    80004e88:	00a00593          	li	a1,10
    80004e8c:	00048513          	mv	a0,s1
    80004e90:	00000097          	auipc	ra,0x0
    80004e94:	810080e7          	jalr	-2032(ra) # 800046a0 <_Z8printIntiii>
    80004e98:	00003517          	auipc	a0,0x3
    80004e9c:	2f850513          	addi	a0,a0,760 # 80008190 <CONSOLE_STATUS+0x180>
    80004ea0:	fffff097          	auipc	ra,0xfffff
    80004ea4:	650080e7          	jalr	1616(ra) # 800044f0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004ea8:	0014849b          	addiw	s1,s1,1
    80004eac:	0ff4f493          	andi	s1,s1,255
    80004eb0:	00500793          	li	a5,5
    80004eb4:	fc97f0e3          	bgeu	a5,s1,80004e74 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004eb8:	00003517          	auipc	a0,0x3
    80004ebc:	61850513          	addi	a0,a0,1560 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80004ec0:	fffff097          	auipc	ra,0xfffff
    80004ec4:	630080e7          	jalr	1584(ra) # 800044f0 <_Z11printStringPKc>
    finishedC = true;
    80004ec8:	00100793          	li	a5,1
    80004ecc:	00005717          	auipc	a4,0x5
    80004ed0:	34f70ea3          	sb	a5,861(a4) # 8000a229 <_ZL9finishedC>
    thread_dispatch();
    80004ed4:	ffffc097          	auipc	ra,0xffffc
    80004ed8:	48c080e7          	jalr	1164(ra) # 80001360 <_Z15thread_dispatchv>
}
    80004edc:	01813083          	ld	ra,24(sp)
    80004ee0:	01013403          	ld	s0,16(sp)
    80004ee4:	00813483          	ld	s1,8(sp)
    80004ee8:	00013903          	ld	s2,0(sp)
    80004eec:	02010113          	addi	sp,sp,32
    80004ef0:	00008067          	ret

0000000080004ef4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004ef4:	fe010113          	addi	sp,sp,-32
    80004ef8:	00113c23          	sd	ra,24(sp)
    80004efc:	00813823          	sd	s0,16(sp)
    80004f00:	00913423          	sd	s1,8(sp)
    80004f04:	01213023          	sd	s2,0(sp)
    80004f08:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004f0c:	00000913          	li	s2,0
    80004f10:	0400006f          	j	80004f50 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80004f14:	ffffc097          	auipc	ra,0xffffc
    80004f18:	44c080e7          	jalr	1100(ra) # 80001360 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004f1c:	00148493          	addi	s1,s1,1
    80004f20:	000027b7          	lui	a5,0x2
    80004f24:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004f28:	0097ee63          	bltu	a5,s1,80004f44 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004f2c:	00000713          	li	a4,0
    80004f30:	000077b7          	lui	a5,0x7
    80004f34:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004f38:	fce7eee3          	bltu	a5,a4,80004f14 <_ZL11workerBodyBPv+0x20>
    80004f3c:	00170713          	addi	a4,a4,1
    80004f40:	ff1ff06f          	j	80004f30 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80004f44:	00a00793          	li	a5,10
    80004f48:	04f90663          	beq	s2,a5,80004f94 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80004f4c:	00190913          	addi	s2,s2,1
    80004f50:	00f00793          	li	a5,15
    80004f54:	0527e463          	bltu	a5,s2,80004f9c <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80004f58:	00003517          	auipc	a0,0x3
    80004f5c:	58850513          	addi	a0,a0,1416 # 800084e0 <CONSOLE_STATUS+0x4d0>
    80004f60:	fffff097          	auipc	ra,0xfffff
    80004f64:	590080e7          	jalr	1424(ra) # 800044f0 <_Z11printStringPKc>
    80004f68:	00000613          	li	a2,0
    80004f6c:	00a00593          	li	a1,10
    80004f70:	0009051b          	sext.w	a0,s2
    80004f74:	fffff097          	auipc	ra,0xfffff
    80004f78:	72c080e7          	jalr	1836(ra) # 800046a0 <_Z8printIntiii>
    80004f7c:	00003517          	auipc	a0,0x3
    80004f80:	21450513          	addi	a0,a0,532 # 80008190 <CONSOLE_STATUS+0x180>
    80004f84:	fffff097          	auipc	ra,0xfffff
    80004f88:	56c080e7          	jalr	1388(ra) # 800044f0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004f8c:	00000493          	li	s1,0
    80004f90:	f91ff06f          	j	80004f20 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80004f94:	14102ff3          	csrr	t6,sepc
    80004f98:	fb5ff06f          	j	80004f4c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80004f9c:	00003517          	auipc	a0,0x3
    80004fa0:	54c50513          	addi	a0,a0,1356 # 800084e8 <CONSOLE_STATUS+0x4d8>
    80004fa4:	fffff097          	auipc	ra,0xfffff
    80004fa8:	54c080e7          	jalr	1356(ra) # 800044f0 <_Z11printStringPKc>
    finishedB = true;
    80004fac:	00100793          	li	a5,1
    80004fb0:	00005717          	auipc	a4,0x5
    80004fb4:	26f70d23          	sb	a5,634(a4) # 8000a22a <_ZL9finishedB>
    thread_dispatch();
    80004fb8:	ffffc097          	auipc	ra,0xffffc
    80004fbc:	3a8080e7          	jalr	936(ra) # 80001360 <_Z15thread_dispatchv>
}
    80004fc0:	01813083          	ld	ra,24(sp)
    80004fc4:	01013403          	ld	s0,16(sp)
    80004fc8:	00813483          	ld	s1,8(sp)
    80004fcc:	00013903          	ld	s2,0(sp)
    80004fd0:	02010113          	addi	sp,sp,32
    80004fd4:	00008067          	ret

0000000080004fd8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004fd8:	fe010113          	addi	sp,sp,-32
    80004fdc:	00113c23          	sd	ra,24(sp)
    80004fe0:	00813823          	sd	s0,16(sp)
    80004fe4:	00913423          	sd	s1,8(sp)
    80004fe8:	01213023          	sd	s2,0(sp)
    80004fec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004ff0:	00000913          	li	s2,0
    80004ff4:	0380006f          	j	8000502c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004ff8:	ffffc097          	auipc	ra,0xffffc
    80004ffc:	368080e7          	jalr	872(ra) # 80001360 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005000:	00148493          	addi	s1,s1,1
    80005004:	000027b7          	lui	a5,0x2
    80005008:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000500c:	0097ee63          	bltu	a5,s1,80005028 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005010:	00000713          	li	a4,0
    80005014:	000077b7          	lui	a5,0x7
    80005018:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000501c:	fce7eee3          	bltu	a5,a4,80004ff8 <_ZL11workerBodyAPv+0x20>
    80005020:	00170713          	addi	a4,a4,1
    80005024:	ff1ff06f          	j	80005014 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005028:	00190913          	addi	s2,s2,1
    8000502c:	00900793          	li	a5,9
    80005030:	0527e063          	bltu	a5,s2,80005070 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005034:	00003517          	auipc	a0,0x3
    80005038:	49450513          	addi	a0,a0,1172 # 800084c8 <CONSOLE_STATUS+0x4b8>
    8000503c:	fffff097          	auipc	ra,0xfffff
    80005040:	4b4080e7          	jalr	1204(ra) # 800044f0 <_Z11printStringPKc>
    80005044:	00000613          	li	a2,0
    80005048:	00a00593          	li	a1,10
    8000504c:	0009051b          	sext.w	a0,s2
    80005050:	fffff097          	auipc	ra,0xfffff
    80005054:	650080e7          	jalr	1616(ra) # 800046a0 <_Z8printIntiii>
    80005058:	00003517          	auipc	a0,0x3
    8000505c:	13850513          	addi	a0,a0,312 # 80008190 <CONSOLE_STATUS+0x180>
    80005060:	fffff097          	auipc	ra,0xfffff
    80005064:	490080e7          	jalr	1168(ra) # 800044f0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005068:	00000493          	li	s1,0
    8000506c:	f99ff06f          	j	80005004 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005070:	00003517          	auipc	a0,0x3
    80005074:	46050513          	addi	a0,a0,1120 # 800084d0 <CONSOLE_STATUS+0x4c0>
    80005078:	fffff097          	auipc	ra,0xfffff
    8000507c:	478080e7          	jalr	1144(ra) # 800044f0 <_Z11printStringPKc>
    finishedA = true;
    80005080:	00100793          	li	a5,1
    80005084:	00005717          	auipc	a4,0x5
    80005088:	1af703a3          	sb	a5,423(a4) # 8000a22b <_ZL9finishedA>
}
    8000508c:	01813083          	ld	ra,24(sp)
    80005090:	01013403          	ld	s0,16(sp)
    80005094:	00813483          	ld	s1,8(sp)
    80005098:	00013903          	ld	s2,0(sp)
    8000509c:	02010113          	addi	sp,sp,32
    800050a0:	00008067          	ret

00000000800050a4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800050a4:	fd010113          	addi	sp,sp,-48
    800050a8:	02113423          	sd	ra,40(sp)
    800050ac:	02813023          	sd	s0,32(sp)
    800050b0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800050b4:	00000613          	li	a2,0
    800050b8:	00000597          	auipc	a1,0x0
    800050bc:	f2058593          	addi	a1,a1,-224 # 80004fd8 <_ZL11workerBodyAPv>
    800050c0:	fd040513          	addi	a0,s0,-48
    800050c4:	ffffc097          	auipc	ra,0xffffc
    800050c8:	1f0080e7          	jalr	496(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800050cc:	00003517          	auipc	a0,0x3
    800050d0:	49450513          	addi	a0,a0,1172 # 80008560 <CONSOLE_STATUS+0x550>
    800050d4:	fffff097          	auipc	ra,0xfffff
    800050d8:	41c080e7          	jalr	1052(ra) # 800044f0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800050dc:	00000613          	li	a2,0
    800050e0:	00000597          	auipc	a1,0x0
    800050e4:	e1458593          	addi	a1,a1,-492 # 80004ef4 <_ZL11workerBodyBPv>
    800050e8:	fd840513          	addi	a0,s0,-40
    800050ec:	ffffc097          	auipc	ra,0xffffc
    800050f0:	1c8080e7          	jalr	456(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800050f4:	00003517          	auipc	a0,0x3
    800050f8:	48450513          	addi	a0,a0,1156 # 80008578 <CONSOLE_STATUS+0x568>
    800050fc:	fffff097          	auipc	ra,0xfffff
    80005100:	3f4080e7          	jalr	1012(ra) # 800044f0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005104:	00000613          	li	a2,0
    80005108:	00000597          	auipc	a1,0x0
    8000510c:	c6c58593          	addi	a1,a1,-916 # 80004d74 <_ZL11workerBodyCPv>
    80005110:	fe040513          	addi	a0,s0,-32
    80005114:	ffffc097          	auipc	ra,0xffffc
    80005118:	1a0080e7          	jalr	416(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000511c:	00003517          	auipc	a0,0x3
    80005120:	47450513          	addi	a0,a0,1140 # 80008590 <CONSOLE_STATUS+0x580>
    80005124:	fffff097          	auipc	ra,0xfffff
    80005128:	3cc080e7          	jalr	972(ra) # 800044f0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000512c:	00000613          	li	a2,0
    80005130:	00000597          	auipc	a1,0x0
    80005134:	afc58593          	addi	a1,a1,-1284 # 80004c2c <_ZL11workerBodyDPv>
    80005138:	fe840513          	addi	a0,s0,-24
    8000513c:	ffffc097          	auipc	ra,0xffffc
    80005140:	178080e7          	jalr	376(ra) # 800012b4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005144:	00003517          	auipc	a0,0x3
    80005148:	46450513          	addi	a0,a0,1124 # 800085a8 <CONSOLE_STATUS+0x598>
    8000514c:	fffff097          	auipc	ra,0xfffff
    80005150:	3a4080e7          	jalr	932(ra) # 800044f0 <_Z11printStringPKc>
    80005154:	00c0006f          	j	80005160 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005158:	ffffc097          	auipc	ra,0xffffc
    8000515c:	208080e7          	jalr	520(ra) # 80001360 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005160:	00005797          	auipc	a5,0x5
    80005164:	0cb7c783          	lbu	a5,203(a5) # 8000a22b <_ZL9finishedA>
    80005168:	fe0788e3          	beqz	a5,80005158 <_Z16System_Mode_testv+0xb4>
    8000516c:	00005797          	auipc	a5,0x5
    80005170:	0be7c783          	lbu	a5,190(a5) # 8000a22a <_ZL9finishedB>
    80005174:	fe0782e3          	beqz	a5,80005158 <_Z16System_Mode_testv+0xb4>
    80005178:	00005797          	auipc	a5,0x5
    8000517c:	0b17c783          	lbu	a5,177(a5) # 8000a229 <_ZL9finishedC>
    80005180:	fc078ce3          	beqz	a5,80005158 <_Z16System_Mode_testv+0xb4>
    80005184:	00005797          	auipc	a5,0x5
    80005188:	0a47c783          	lbu	a5,164(a5) # 8000a228 <_ZL9finishedD>
    8000518c:	fc0786e3          	beqz	a5,80005158 <_Z16System_Mode_testv+0xb4>
    }

}
    80005190:	02813083          	ld	ra,40(sp)
    80005194:	02013403          	ld	s0,32(sp)
    80005198:	03010113          	addi	sp,sp,48
    8000519c:	00008067          	ret

00000000800051a0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800051a0:	fe010113          	addi	sp,sp,-32
    800051a4:	00113c23          	sd	ra,24(sp)
    800051a8:	00813823          	sd	s0,16(sp)
    800051ac:	00913423          	sd	s1,8(sp)
    800051b0:	01213023          	sd	s2,0(sp)
    800051b4:	02010413          	addi	s0,sp,32
    800051b8:	00050493          	mv	s1,a0
    800051bc:	00058913          	mv	s2,a1
    800051c0:	0015879b          	addiw	a5,a1,1
    800051c4:	0007851b          	sext.w	a0,a5
    800051c8:	00f4a023          	sw	a5,0(s1)
    800051cc:	0004a823          	sw	zero,16(s1)
    800051d0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800051d4:	00251513          	slli	a0,a0,0x2
    800051d8:	ffffc097          	auipc	ra,0xffffc
    800051dc:	06c080e7          	jalr	108(ra) # 80001244 <_Z9mem_allocm>
    800051e0:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800051e4:	00000593          	li	a1,0
    800051e8:	02048513          	addi	a0,s1,32
    800051ec:	ffffc097          	auipc	ra,0xffffc
    800051f0:	198080e7          	jalr	408(ra) # 80001384 <_Z8sem_openPP10SemaphoreCj>
    sem_open(&spaceAvailable, _cap);
    800051f4:	00090593          	mv	a1,s2
    800051f8:	01848513          	addi	a0,s1,24
    800051fc:	ffffc097          	auipc	ra,0xffffc
    80005200:	188080e7          	jalr	392(ra) # 80001384 <_Z8sem_openPP10SemaphoreCj>
    sem_open(&mutexHead, 1);
    80005204:	00100593          	li	a1,1
    80005208:	02848513          	addi	a0,s1,40
    8000520c:	ffffc097          	auipc	ra,0xffffc
    80005210:	178080e7          	jalr	376(ra) # 80001384 <_Z8sem_openPP10SemaphoreCj>
    sem_open(&mutexTail, 1);
    80005214:	00100593          	li	a1,1
    80005218:	03048513          	addi	a0,s1,48
    8000521c:	ffffc097          	auipc	ra,0xffffc
    80005220:	168080e7          	jalr	360(ra) # 80001384 <_Z8sem_openPP10SemaphoreCj>
}
    80005224:	01813083          	ld	ra,24(sp)
    80005228:	01013403          	ld	s0,16(sp)
    8000522c:	00813483          	ld	s1,8(sp)
    80005230:	00013903          	ld	s2,0(sp)
    80005234:	02010113          	addi	sp,sp,32
    80005238:	00008067          	ret

000000008000523c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    8000523c:	fe010113          	addi	sp,sp,-32
    80005240:	00113c23          	sd	ra,24(sp)
    80005244:	00813823          	sd	s0,16(sp)
    80005248:	00913423          	sd	s1,8(sp)
    8000524c:	01213023          	sd	s2,0(sp)
    80005250:	02010413          	addi	s0,sp,32
    80005254:	00050493          	mv	s1,a0
    80005258:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    8000525c:	01853503          	ld	a0,24(a0)
    80005260:	ffffc097          	auipc	ra,0xffffc
    80005264:	188080e7          	jalr	392(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>

    sem_wait(mutexTail);
    80005268:	0304b503          	ld	a0,48(s1)
    8000526c:	ffffc097          	auipc	ra,0xffffc
    80005270:	17c080e7          	jalr	380(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>
    buffer[tail] = val;
    80005274:	0084b783          	ld	a5,8(s1)
    80005278:	0144a703          	lw	a4,20(s1)
    8000527c:	00271713          	slli	a4,a4,0x2
    80005280:	00e787b3          	add	a5,a5,a4
    80005284:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005288:	0144a783          	lw	a5,20(s1)
    8000528c:	0017879b          	addiw	a5,a5,1
    80005290:	0004a703          	lw	a4,0(s1)
    80005294:	02e7e7bb          	remw	a5,a5,a4
    80005298:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    8000529c:	0304b503          	ld	a0,48(s1)
    800052a0:	ffffc097          	auipc	ra,0xffffc
    800052a4:	178080e7          	jalr	376(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>

    sem_signal(itemAvailable);
    800052a8:	0204b503          	ld	a0,32(s1)
    800052ac:	ffffc097          	auipc	ra,0xffffc
    800052b0:	16c080e7          	jalr	364(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>

}
    800052b4:	01813083          	ld	ra,24(sp)
    800052b8:	01013403          	ld	s0,16(sp)
    800052bc:	00813483          	ld	s1,8(sp)
    800052c0:	00013903          	ld	s2,0(sp)
    800052c4:	02010113          	addi	sp,sp,32
    800052c8:	00008067          	ret

00000000800052cc <_ZN6Buffer3getEv>:

int Buffer::get() {
    800052cc:	fe010113          	addi	sp,sp,-32
    800052d0:	00113c23          	sd	ra,24(sp)
    800052d4:	00813823          	sd	s0,16(sp)
    800052d8:	00913423          	sd	s1,8(sp)
    800052dc:	01213023          	sd	s2,0(sp)
    800052e0:	02010413          	addi	s0,sp,32
    800052e4:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800052e8:	02053503          	ld	a0,32(a0)
    800052ec:	ffffc097          	auipc	ra,0xffffc
    800052f0:	0fc080e7          	jalr	252(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>

    sem_wait(mutexHead);
    800052f4:	0284b503          	ld	a0,40(s1)
    800052f8:	ffffc097          	auipc	ra,0xffffc
    800052fc:	0f0080e7          	jalr	240(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>

    int ret = buffer[head];
    80005300:	0084b703          	ld	a4,8(s1)
    80005304:	0104a783          	lw	a5,16(s1)
    80005308:	00279693          	slli	a3,a5,0x2
    8000530c:	00d70733          	add	a4,a4,a3
    80005310:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005314:	0017879b          	addiw	a5,a5,1
    80005318:	0004a703          	lw	a4,0(s1)
    8000531c:	02e7e7bb          	remw	a5,a5,a4
    80005320:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005324:	0284b503          	ld	a0,40(s1)
    80005328:	ffffc097          	auipc	ra,0xffffc
    8000532c:	0f0080e7          	jalr	240(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>

    sem_signal(spaceAvailable);
    80005330:	0184b503          	ld	a0,24(s1)
    80005334:	ffffc097          	auipc	ra,0xffffc
    80005338:	0e4080e7          	jalr	228(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>

    return ret;
}
    8000533c:	00090513          	mv	a0,s2
    80005340:	01813083          	ld	ra,24(sp)
    80005344:	01013403          	ld	s0,16(sp)
    80005348:	00813483          	ld	s1,8(sp)
    8000534c:	00013903          	ld	s2,0(sp)
    80005350:	02010113          	addi	sp,sp,32
    80005354:	00008067          	ret

0000000080005358 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80005358:	fe010113          	addi	sp,sp,-32
    8000535c:	00113c23          	sd	ra,24(sp)
    80005360:	00813823          	sd	s0,16(sp)
    80005364:	00913423          	sd	s1,8(sp)
    80005368:	01213023          	sd	s2,0(sp)
    8000536c:	02010413          	addi	s0,sp,32
    80005370:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005374:	02853503          	ld	a0,40(a0)
    80005378:	ffffc097          	auipc	ra,0xffffc
    8000537c:	070080e7          	jalr	112(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>
    sem_wait(mutexTail);
    80005380:	0304b503          	ld	a0,48(s1)
    80005384:	ffffc097          	auipc	ra,0xffffc
    80005388:	064080e7          	jalr	100(ra) # 800013e8 <_Z8sem_waitP10SemaphoreC>

    if (tail >= head) {
    8000538c:	0144a783          	lw	a5,20(s1)
    80005390:	0104a903          	lw	s2,16(s1)
    80005394:	0327ce63          	blt	a5,s2,800053d0 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005398:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    8000539c:	0304b503          	ld	a0,48(s1)
    800053a0:	ffffc097          	auipc	ra,0xffffc
    800053a4:	078080e7          	jalr	120(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>
    sem_signal(mutexHead);
    800053a8:	0284b503          	ld	a0,40(s1)
    800053ac:	ffffc097          	auipc	ra,0xffffc
    800053b0:	06c080e7          	jalr	108(ra) # 80001418 <_Z10sem_signalP10SemaphoreC>

    return ret;
}
    800053b4:	00090513          	mv	a0,s2
    800053b8:	01813083          	ld	ra,24(sp)
    800053bc:	01013403          	ld	s0,16(sp)
    800053c0:	00813483          	ld	s1,8(sp)
    800053c4:	00013903          	ld	s2,0(sp)
    800053c8:	02010113          	addi	sp,sp,32
    800053cc:	00008067          	ret
        ret = cap - head + tail;
    800053d0:	0004a703          	lw	a4,0(s1)
    800053d4:	4127093b          	subw	s2,a4,s2
    800053d8:	00f9093b          	addw	s2,s2,a5
    800053dc:	fc1ff06f          	j	8000539c <_ZN6Buffer6getCntEv+0x44>

00000000800053e0 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800053e0:	fe010113          	addi	sp,sp,-32
    800053e4:	00113c23          	sd	ra,24(sp)
    800053e8:	00813823          	sd	s0,16(sp)
    800053ec:	00913423          	sd	s1,8(sp)
    800053f0:	02010413          	addi	s0,sp,32
    800053f4:	00050493          	mv	s1,a0
    putc('\n');
    800053f8:	00a00513          	li	a0,10
    800053fc:	ffffc097          	auipc	ra,0xffffc
    80005400:	0e0080e7          	jalr	224(ra) # 800014dc <_Z4putcc>
    printString("Buffer deleted!\n");
    80005404:	00003517          	auipc	a0,0x3
    80005408:	1bc50513          	addi	a0,a0,444 # 800085c0 <CONSOLE_STATUS+0x5b0>
    8000540c:	fffff097          	auipc	ra,0xfffff
    80005410:	0e4080e7          	jalr	228(ra) # 800044f0 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005414:	00048513          	mv	a0,s1
    80005418:	00000097          	auipc	ra,0x0
    8000541c:	f40080e7          	jalr	-192(ra) # 80005358 <_ZN6Buffer6getCntEv>
    80005420:	02a05c63          	blez	a0,80005458 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005424:	0084b783          	ld	a5,8(s1)
    80005428:	0104a703          	lw	a4,16(s1)
    8000542c:	00271713          	slli	a4,a4,0x2
    80005430:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005434:	0007c503          	lbu	a0,0(a5)
    80005438:	ffffc097          	auipc	ra,0xffffc
    8000543c:	0a4080e7          	jalr	164(ra) # 800014dc <_Z4putcc>
        head = (head + 1) % cap;
    80005440:	0104a783          	lw	a5,16(s1)
    80005444:	0017879b          	addiw	a5,a5,1
    80005448:	0004a703          	lw	a4,0(s1)
    8000544c:	02e7e7bb          	remw	a5,a5,a4
    80005450:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005454:	fc1ff06f          	j	80005414 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80005458:	02100513          	li	a0,33
    8000545c:	ffffc097          	auipc	ra,0xffffc
    80005460:	080080e7          	jalr	128(ra) # 800014dc <_Z4putcc>
    putc('\n');
    80005464:	00a00513          	li	a0,10
    80005468:	ffffc097          	auipc	ra,0xffffc
    8000546c:	074080e7          	jalr	116(ra) # 800014dc <_Z4putcc>
    mem_free(buffer);
    80005470:	0084b503          	ld	a0,8(s1)
    80005474:	ffffc097          	auipc	ra,0xffffc
    80005478:	e10080e7          	jalr	-496(ra) # 80001284 <_Z8mem_freePv>
    sem_close(itemAvailable);
    8000547c:	0204b503          	ld	a0,32(s1)
    80005480:	ffffc097          	auipc	ra,0xffffc
    80005484:	f38080e7          	jalr	-200(ra) # 800013b8 <_Z9sem_closeP10SemaphoreC>
    sem_close(spaceAvailable);
    80005488:	0184b503          	ld	a0,24(s1)
    8000548c:	ffffc097          	auipc	ra,0xffffc
    80005490:	f2c080e7          	jalr	-212(ra) # 800013b8 <_Z9sem_closeP10SemaphoreC>
    sem_close(mutexTail);
    80005494:	0304b503          	ld	a0,48(s1)
    80005498:	ffffc097          	auipc	ra,0xffffc
    8000549c:	f20080e7          	jalr	-224(ra) # 800013b8 <_Z9sem_closeP10SemaphoreC>
    sem_close(mutexHead);
    800054a0:	0284b503          	ld	a0,40(s1)
    800054a4:	ffffc097          	auipc	ra,0xffffc
    800054a8:	f14080e7          	jalr	-236(ra) # 800013b8 <_Z9sem_closeP10SemaphoreC>
}
    800054ac:	01813083          	ld	ra,24(sp)
    800054b0:	01013403          	ld	s0,16(sp)
    800054b4:	00813483          	ld	s1,8(sp)
    800054b8:	02010113          	addi	sp,sp,32
    800054bc:	00008067          	ret

00000000800054c0 <start>:
    800054c0:	ff010113          	addi	sp,sp,-16
    800054c4:	00813423          	sd	s0,8(sp)
    800054c8:	01010413          	addi	s0,sp,16
    800054cc:	300027f3          	csrr	a5,mstatus
    800054d0:	ffffe737          	lui	a4,0xffffe
    800054d4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff336f>
    800054d8:	00e7f7b3          	and	a5,a5,a4
    800054dc:	00001737          	lui	a4,0x1
    800054e0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800054e4:	00e7e7b3          	or	a5,a5,a4
    800054e8:	30079073          	csrw	mstatus,a5
    800054ec:	00000797          	auipc	a5,0x0
    800054f0:	16078793          	addi	a5,a5,352 # 8000564c <system_main>
    800054f4:	34179073          	csrw	mepc,a5
    800054f8:	00000793          	li	a5,0
    800054fc:	18079073          	csrw	satp,a5
    80005500:	000107b7          	lui	a5,0x10
    80005504:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005508:	30279073          	csrw	medeleg,a5
    8000550c:	30379073          	csrw	mideleg,a5
    80005510:	104027f3          	csrr	a5,sie
    80005514:	2227e793          	ori	a5,a5,546
    80005518:	10479073          	csrw	sie,a5
    8000551c:	fff00793          	li	a5,-1
    80005520:	00a7d793          	srli	a5,a5,0xa
    80005524:	3b079073          	csrw	pmpaddr0,a5
    80005528:	00f00793          	li	a5,15
    8000552c:	3a079073          	csrw	pmpcfg0,a5
    80005530:	f14027f3          	csrr	a5,mhartid
    80005534:	0200c737          	lui	a4,0x200c
    80005538:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000553c:	0007869b          	sext.w	a3,a5
    80005540:	00269713          	slli	a4,a3,0x2
    80005544:	000f4637          	lui	a2,0xf4
    80005548:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000554c:	00d70733          	add	a4,a4,a3
    80005550:	0037979b          	slliw	a5,a5,0x3
    80005554:	020046b7          	lui	a3,0x2004
    80005558:	00d787b3          	add	a5,a5,a3
    8000555c:	00c585b3          	add	a1,a1,a2
    80005560:	00371693          	slli	a3,a4,0x3
    80005564:	00005717          	auipc	a4,0x5
    80005568:	ccc70713          	addi	a4,a4,-820 # 8000a230 <timer_scratch>
    8000556c:	00b7b023          	sd	a1,0(a5)
    80005570:	00d70733          	add	a4,a4,a3
    80005574:	00f73c23          	sd	a5,24(a4)
    80005578:	02c73023          	sd	a2,32(a4)
    8000557c:	34071073          	csrw	mscratch,a4
    80005580:	00000797          	auipc	a5,0x0
    80005584:	6e078793          	addi	a5,a5,1760 # 80005c60 <timervec>
    80005588:	30579073          	csrw	mtvec,a5
    8000558c:	300027f3          	csrr	a5,mstatus
    80005590:	0087e793          	ori	a5,a5,8
    80005594:	30079073          	csrw	mstatus,a5
    80005598:	304027f3          	csrr	a5,mie
    8000559c:	0807e793          	ori	a5,a5,128
    800055a0:	30479073          	csrw	mie,a5
    800055a4:	f14027f3          	csrr	a5,mhartid
    800055a8:	0007879b          	sext.w	a5,a5
    800055ac:	00078213          	mv	tp,a5
    800055b0:	30200073          	mret
    800055b4:	00813403          	ld	s0,8(sp)
    800055b8:	01010113          	addi	sp,sp,16
    800055bc:	00008067          	ret

00000000800055c0 <timerinit>:
    800055c0:	ff010113          	addi	sp,sp,-16
    800055c4:	00813423          	sd	s0,8(sp)
    800055c8:	01010413          	addi	s0,sp,16
    800055cc:	f14027f3          	csrr	a5,mhartid
    800055d0:	0200c737          	lui	a4,0x200c
    800055d4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800055d8:	0007869b          	sext.w	a3,a5
    800055dc:	00269713          	slli	a4,a3,0x2
    800055e0:	000f4637          	lui	a2,0xf4
    800055e4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800055e8:	00d70733          	add	a4,a4,a3
    800055ec:	0037979b          	slliw	a5,a5,0x3
    800055f0:	020046b7          	lui	a3,0x2004
    800055f4:	00d787b3          	add	a5,a5,a3
    800055f8:	00c585b3          	add	a1,a1,a2
    800055fc:	00371693          	slli	a3,a4,0x3
    80005600:	00005717          	auipc	a4,0x5
    80005604:	c3070713          	addi	a4,a4,-976 # 8000a230 <timer_scratch>
    80005608:	00b7b023          	sd	a1,0(a5)
    8000560c:	00d70733          	add	a4,a4,a3
    80005610:	00f73c23          	sd	a5,24(a4)
    80005614:	02c73023          	sd	a2,32(a4)
    80005618:	34071073          	csrw	mscratch,a4
    8000561c:	00000797          	auipc	a5,0x0
    80005620:	64478793          	addi	a5,a5,1604 # 80005c60 <timervec>
    80005624:	30579073          	csrw	mtvec,a5
    80005628:	300027f3          	csrr	a5,mstatus
    8000562c:	0087e793          	ori	a5,a5,8
    80005630:	30079073          	csrw	mstatus,a5
    80005634:	304027f3          	csrr	a5,mie
    80005638:	0807e793          	ori	a5,a5,128
    8000563c:	30479073          	csrw	mie,a5
    80005640:	00813403          	ld	s0,8(sp)
    80005644:	01010113          	addi	sp,sp,16
    80005648:	00008067          	ret

000000008000564c <system_main>:
    8000564c:	fe010113          	addi	sp,sp,-32
    80005650:	00813823          	sd	s0,16(sp)
    80005654:	00913423          	sd	s1,8(sp)
    80005658:	00113c23          	sd	ra,24(sp)
    8000565c:	02010413          	addi	s0,sp,32
    80005660:	00000097          	auipc	ra,0x0
    80005664:	0c4080e7          	jalr	196(ra) # 80005724 <cpuid>
    80005668:	00005497          	auipc	s1,0x5
    8000566c:	b3848493          	addi	s1,s1,-1224 # 8000a1a0 <started>
    80005670:	02050263          	beqz	a0,80005694 <system_main+0x48>
    80005674:	0004a783          	lw	a5,0(s1)
    80005678:	0007879b          	sext.w	a5,a5
    8000567c:	fe078ce3          	beqz	a5,80005674 <system_main+0x28>
    80005680:	0ff0000f          	fence
    80005684:	00003517          	auipc	a0,0x3
    80005688:	f8450513          	addi	a0,a0,-124 # 80008608 <CONSOLE_STATUS+0x5f8>
    8000568c:	00001097          	auipc	ra,0x1
    80005690:	a70080e7          	jalr	-1424(ra) # 800060fc <panic>
    80005694:	00001097          	auipc	ra,0x1
    80005698:	9c4080e7          	jalr	-1596(ra) # 80006058 <consoleinit>
    8000569c:	00001097          	auipc	ra,0x1
    800056a0:	150080e7          	jalr	336(ra) # 800067ec <printfinit>
    800056a4:	00003517          	auipc	a0,0x3
    800056a8:	aec50513          	addi	a0,a0,-1300 # 80008190 <CONSOLE_STATUS+0x180>
    800056ac:	00001097          	auipc	ra,0x1
    800056b0:	aac080e7          	jalr	-1364(ra) # 80006158 <__printf>
    800056b4:	00003517          	auipc	a0,0x3
    800056b8:	f2450513          	addi	a0,a0,-220 # 800085d8 <CONSOLE_STATUS+0x5c8>
    800056bc:	00001097          	auipc	ra,0x1
    800056c0:	a9c080e7          	jalr	-1380(ra) # 80006158 <__printf>
    800056c4:	00003517          	auipc	a0,0x3
    800056c8:	acc50513          	addi	a0,a0,-1332 # 80008190 <CONSOLE_STATUS+0x180>
    800056cc:	00001097          	auipc	ra,0x1
    800056d0:	a8c080e7          	jalr	-1396(ra) # 80006158 <__printf>
    800056d4:	00001097          	auipc	ra,0x1
    800056d8:	4a4080e7          	jalr	1188(ra) # 80006b78 <kinit>
    800056dc:	00000097          	auipc	ra,0x0
    800056e0:	148080e7          	jalr	328(ra) # 80005824 <trapinit>
    800056e4:	00000097          	auipc	ra,0x0
    800056e8:	16c080e7          	jalr	364(ra) # 80005850 <trapinithart>
    800056ec:	00000097          	auipc	ra,0x0
    800056f0:	5b4080e7          	jalr	1460(ra) # 80005ca0 <plicinit>
    800056f4:	00000097          	auipc	ra,0x0
    800056f8:	5d4080e7          	jalr	1492(ra) # 80005cc8 <plicinithart>
    800056fc:	00000097          	auipc	ra,0x0
    80005700:	078080e7          	jalr	120(ra) # 80005774 <userinit>
    80005704:	0ff0000f          	fence
    80005708:	00100793          	li	a5,1
    8000570c:	00003517          	auipc	a0,0x3
    80005710:	ee450513          	addi	a0,a0,-284 # 800085f0 <CONSOLE_STATUS+0x5e0>
    80005714:	00f4a023          	sw	a5,0(s1)
    80005718:	00001097          	auipc	ra,0x1
    8000571c:	a40080e7          	jalr	-1472(ra) # 80006158 <__printf>
    80005720:	0000006f          	j	80005720 <system_main+0xd4>

0000000080005724 <cpuid>:
    80005724:	ff010113          	addi	sp,sp,-16
    80005728:	00813423          	sd	s0,8(sp)
    8000572c:	01010413          	addi	s0,sp,16
    80005730:	00020513          	mv	a0,tp
    80005734:	00813403          	ld	s0,8(sp)
    80005738:	0005051b          	sext.w	a0,a0
    8000573c:	01010113          	addi	sp,sp,16
    80005740:	00008067          	ret

0000000080005744 <mycpu>:
    80005744:	ff010113          	addi	sp,sp,-16
    80005748:	00813423          	sd	s0,8(sp)
    8000574c:	01010413          	addi	s0,sp,16
    80005750:	00020793          	mv	a5,tp
    80005754:	00813403          	ld	s0,8(sp)
    80005758:	0007879b          	sext.w	a5,a5
    8000575c:	00779793          	slli	a5,a5,0x7
    80005760:	00006517          	auipc	a0,0x6
    80005764:	b0050513          	addi	a0,a0,-1280 # 8000b260 <cpus>
    80005768:	00f50533          	add	a0,a0,a5
    8000576c:	01010113          	addi	sp,sp,16
    80005770:	00008067          	ret

0000000080005774 <userinit>:
    80005774:	ff010113          	addi	sp,sp,-16
    80005778:	00813423          	sd	s0,8(sp)
    8000577c:	01010413          	addi	s0,sp,16
    80005780:	00813403          	ld	s0,8(sp)
    80005784:	01010113          	addi	sp,sp,16
    80005788:	ffffc317          	auipc	t1,0xffffc
    8000578c:	03430067          	jr	52(t1) # 800017bc <main>

0000000080005790 <either_copyout>:
    80005790:	ff010113          	addi	sp,sp,-16
    80005794:	00813023          	sd	s0,0(sp)
    80005798:	00113423          	sd	ra,8(sp)
    8000579c:	01010413          	addi	s0,sp,16
    800057a0:	02051663          	bnez	a0,800057cc <either_copyout+0x3c>
    800057a4:	00058513          	mv	a0,a1
    800057a8:	00060593          	mv	a1,a2
    800057ac:	0006861b          	sext.w	a2,a3
    800057b0:	00002097          	auipc	ra,0x2
    800057b4:	c54080e7          	jalr	-940(ra) # 80007404 <__memmove>
    800057b8:	00813083          	ld	ra,8(sp)
    800057bc:	00013403          	ld	s0,0(sp)
    800057c0:	00000513          	li	a0,0
    800057c4:	01010113          	addi	sp,sp,16
    800057c8:	00008067          	ret
    800057cc:	00003517          	auipc	a0,0x3
    800057d0:	e6450513          	addi	a0,a0,-412 # 80008630 <CONSOLE_STATUS+0x620>
    800057d4:	00001097          	auipc	ra,0x1
    800057d8:	928080e7          	jalr	-1752(ra) # 800060fc <panic>

00000000800057dc <either_copyin>:
    800057dc:	ff010113          	addi	sp,sp,-16
    800057e0:	00813023          	sd	s0,0(sp)
    800057e4:	00113423          	sd	ra,8(sp)
    800057e8:	01010413          	addi	s0,sp,16
    800057ec:	02059463          	bnez	a1,80005814 <either_copyin+0x38>
    800057f0:	00060593          	mv	a1,a2
    800057f4:	0006861b          	sext.w	a2,a3
    800057f8:	00002097          	auipc	ra,0x2
    800057fc:	c0c080e7          	jalr	-1012(ra) # 80007404 <__memmove>
    80005800:	00813083          	ld	ra,8(sp)
    80005804:	00013403          	ld	s0,0(sp)
    80005808:	00000513          	li	a0,0
    8000580c:	01010113          	addi	sp,sp,16
    80005810:	00008067          	ret
    80005814:	00003517          	auipc	a0,0x3
    80005818:	e4450513          	addi	a0,a0,-444 # 80008658 <CONSOLE_STATUS+0x648>
    8000581c:	00001097          	auipc	ra,0x1
    80005820:	8e0080e7          	jalr	-1824(ra) # 800060fc <panic>

0000000080005824 <trapinit>:
    80005824:	ff010113          	addi	sp,sp,-16
    80005828:	00813423          	sd	s0,8(sp)
    8000582c:	01010413          	addi	s0,sp,16
    80005830:	00813403          	ld	s0,8(sp)
    80005834:	00003597          	auipc	a1,0x3
    80005838:	e4c58593          	addi	a1,a1,-436 # 80008680 <CONSOLE_STATUS+0x670>
    8000583c:	00006517          	auipc	a0,0x6
    80005840:	aa450513          	addi	a0,a0,-1372 # 8000b2e0 <tickslock>
    80005844:	01010113          	addi	sp,sp,16
    80005848:	00001317          	auipc	t1,0x1
    8000584c:	5c030067          	jr	1472(t1) # 80006e08 <initlock>

0000000080005850 <trapinithart>:
    80005850:	ff010113          	addi	sp,sp,-16
    80005854:	00813423          	sd	s0,8(sp)
    80005858:	01010413          	addi	s0,sp,16
    8000585c:	00000797          	auipc	a5,0x0
    80005860:	2f478793          	addi	a5,a5,756 # 80005b50 <kernelvec>
    80005864:	10579073          	csrw	stvec,a5
    80005868:	00813403          	ld	s0,8(sp)
    8000586c:	01010113          	addi	sp,sp,16
    80005870:	00008067          	ret

0000000080005874 <usertrap>:
    80005874:	ff010113          	addi	sp,sp,-16
    80005878:	00813423          	sd	s0,8(sp)
    8000587c:	01010413          	addi	s0,sp,16
    80005880:	00813403          	ld	s0,8(sp)
    80005884:	01010113          	addi	sp,sp,16
    80005888:	00008067          	ret

000000008000588c <usertrapret>:
    8000588c:	ff010113          	addi	sp,sp,-16
    80005890:	00813423          	sd	s0,8(sp)
    80005894:	01010413          	addi	s0,sp,16
    80005898:	00813403          	ld	s0,8(sp)
    8000589c:	01010113          	addi	sp,sp,16
    800058a0:	00008067          	ret

00000000800058a4 <kerneltrap>:
    800058a4:	fe010113          	addi	sp,sp,-32
    800058a8:	00813823          	sd	s0,16(sp)
    800058ac:	00113c23          	sd	ra,24(sp)
    800058b0:	00913423          	sd	s1,8(sp)
    800058b4:	02010413          	addi	s0,sp,32
    800058b8:	142025f3          	csrr	a1,scause
    800058bc:	100027f3          	csrr	a5,sstatus
    800058c0:	0027f793          	andi	a5,a5,2
    800058c4:	10079c63          	bnez	a5,800059dc <kerneltrap+0x138>
    800058c8:	142027f3          	csrr	a5,scause
    800058cc:	0207ce63          	bltz	a5,80005908 <kerneltrap+0x64>
    800058d0:	00003517          	auipc	a0,0x3
    800058d4:	df850513          	addi	a0,a0,-520 # 800086c8 <CONSOLE_STATUS+0x6b8>
    800058d8:	00001097          	auipc	ra,0x1
    800058dc:	880080e7          	jalr	-1920(ra) # 80006158 <__printf>
    800058e0:	141025f3          	csrr	a1,sepc
    800058e4:	14302673          	csrr	a2,stval
    800058e8:	00003517          	auipc	a0,0x3
    800058ec:	df050513          	addi	a0,a0,-528 # 800086d8 <CONSOLE_STATUS+0x6c8>
    800058f0:	00001097          	auipc	ra,0x1
    800058f4:	868080e7          	jalr	-1944(ra) # 80006158 <__printf>
    800058f8:	00003517          	auipc	a0,0x3
    800058fc:	df850513          	addi	a0,a0,-520 # 800086f0 <CONSOLE_STATUS+0x6e0>
    80005900:	00000097          	auipc	ra,0x0
    80005904:	7fc080e7          	jalr	2044(ra) # 800060fc <panic>
    80005908:	0ff7f713          	andi	a4,a5,255
    8000590c:	00900693          	li	a3,9
    80005910:	04d70063          	beq	a4,a3,80005950 <kerneltrap+0xac>
    80005914:	fff00713          	li	a4,-1
    80005918:	03f71713          	slli	a4,a4,0x3f
    8000591c:	00170713          	addi	a4,a4,1
    80005920:	fae798e3          	bne	a5,a4,800058d0 <kerneltrap+0x2c>
    80005924:	00000097          	auipc	ra,0x0
    80005928:	e00080e7          	jalr	-512(ra) # 80005724 <cpuid>
    8000592c:	06050663          	beqz	a0,80005998 <kerneltrap+0xf4>
    80005930:	144027f3          	csrr	a5,sip
    80005934:	ffd7f793          	andi	a5,a5,-3
    80005938:	14479073          	csrw	sip,a5
    8000593c:	01813083          	ld	ra,24(sp)
    80005940:	01013403          	ld	s0,16(sp)
    80005944:	00813483          	ld	s1,8(sp)
    80005948:	02010113          	addi	sp,sp,32
    8000594c:	00008067          	ret
    80005950:	00000097          	auipc	ra,0x0
    80005954:	3c4080e7          	jalr	964(ra) # 80005d14 <plic_claim>
    80005958:	00a00793          	li	a5,10
    8000595c:	00050493          	mv	s1,a0
    80005960:	06f50863          	beq	a0,a5,800059d0 <kerneltrap+0x12c>
    80005964:	fc050ce3          	beqz	a0,8000593c <kerneltrap+0x98>
    80005968:	00050593          	mv	a1,a0
    8000596c:	00003517          	auipc	a0,0x3
    80005970:	d3c50513          	addi	a0,a0,-708 # 800086a8 <CONSOLE_STATUS+0x698>
    80005974:	00000097          	auipc	ra,0x0
    80005978:	7e4080e7          	jalr	2020(ra) # 80006158 <__printf>
    8000597c:	01013403          	ld	s0,16(sp)
    80005980:	01813083          	ld	ra,24(sp)
    80005984:	00048513          	mv	a0,s1
    80005988:	00813483          	ld	s1,8(sp)
    8000598c:	02010113          	addi	sp,sp,32
    80005990:	00000317          	auipc	t1,0x0
    80005994:	3bc30067          	jr	956(t1) # 80005d4c <plic_complete>
    80005998:	00006517          	auipc	a0,0x6
    8000599c:	94850513          	addi	a0,a0,-1720 # 8000b2e0 <tickslock>
    800059a0:	00001097          	auipc	ra,0x1
    800059a4:	48c080e7          	jalr	1164(ra) # 80006e2c <acquire>
    800059a8:	00004717          	auipc	a4,0x4
    800059ac:	7fc70713          	addi	a4,a4,2044 # 8000a1a4 <ticks>
    800059b0:	00072783          	lw	a5,0(a4)
    800059b4:	00006517          	auipc	a0,0x6
    800059b8:	92c50513          	addi	a0,a0,-1748 # 8000b2e0 <tickslock>
    800059bc:	0017879b          	addiw	a5,a5,1
    800059c0:	00f72023          	sw	a5,0(a4)
    800059c4:	00001097          	auipc	ra,0x1
    800059c8:	534080e7          	jalr	1332(ra) # 80006ef8 <release>
    800059cc:	f65ff06f          	j	80005930 <kerneltrap+0x8c>
    800059d0:	00001097          	auipc	ra,0x1
    800059d4:	090080e7          	jalr	144(ra) # 80006a60 <uartintr>
    800059d8:	fa5ff06f          	j	8000597c <kerneltrap+0xd8>
    800059dc:	00003517          	auipc	a0,0x3
    800059e0:	cac50513          	addi	a0,a0,-852 # 80008688 <CONSOLE_STATUS+0x678>
    800059e4:	00000097          	auipc	ra,0x0
    800059e8:	718080e7          	jalr	1816(ra) # 800060fc <panic>

00000000800059ec <clockintr>:
    800059ec:	fe010113          	addi	sp,sp,-32
    800059f0:	00813823          	sd	s0,16(sp)
    800059f4:	00913423          	sd	s1,8(sp)
    800059f8:	00113c23          	sd	ra,24(sp)
    800059fc:	02010413          	addi	s0,sp,32
    80005a00:	00006497          	auipc	s1,0x6
    80005a04:	8e048493          	addi	s1,s1,-1824 # 8000b2e0 <tickslock>
    80005a08:	00048513          	mv	a0,s1
    80005a0c:	00001097          	auipc	ra,0x1
    80005a10:	420080e7          	jalr	1056(ra) # 80006e2c <acquire>
    80005a14:	00004717          	auipc	a4,0x4
    80005a18:	79070713          	addi	a4,a4,1936 # 8000a1a4 <ticks>
    80005a1c:	00072783          	lw	a5,0(a4)
    80005a20:	01013403          	ld	s0,16(sp)
    80005a24:	01813083          	ld	ra,24(sp)
    80005a28:	00048513          	mv	a0,s1
    80005a2c:	0017879b          	addiw	a5,a5,1
    80005a30:	00813483          	ld	s1,8(sp)
    80005a34:	00f72023          	sw	a5,0(a4)
    80005a38:	02010113          	addi	sp,sp,32
    80005a3c:	00001317          	auipc	t1,0x1
    80005a40:	4bc30067          	jr	1212(t1) # 80006ef8 <release>

0000000080005a44 <devintr>:
    80005a44:	142027f3          	csrr	a5,scause
    80005a48:	00000513          	li	a0,0
    80005a4c:	0007c463          	bltz	a5,80005a54 <devintr+0x10>
    80005a50:	00008067          	ret
    80005a54:	fe010113          	addi	sp,sp,-32
    80005a58:	00813823          	sd	s0,16(sp)
    80005a5c:	00113c23          	sd	ra,24(sp)
    80005a60:	00913423          	sd	s1,8(sp)
    80005a64:	02010413          	addi	s0,sp,32
    80005a68:	0ff7f713          	andi	a4,a5,255
    80005a6c:	00900693          	li	a3,9
    80005a70:	04d70c63          	beq	a4,a3,80005ac8 <devintr+0x84>
    80005a74:	fff00713          	li	a4,-1
    80005a78:	03f71713          	slli	a4,a4,0x3f
    80005a7c:	00170713          	addi	a4,a4,1
    80005a80:	00e78c63          	beq	a5,a4,80005a98 <devintr+0x54>
    80005a84:	01813083          	ld	ra,24(sp)
    80005a88:	01013403          	ld	s0,16(sp)
    80005a8c:	00813483          	ld	s1,8(sp)
    80005a90:	02010113          	addi	sp,sp,32
    80005a94:	00008067          	ret
    80005a98:	00000097          	auipc	ra,0x0
    80005a9c:	c8c080e7          	jalr	-884(ra) # 80005724 <cpuid>
    80005aa0:	06050663          	beqz	a0,80005b0c <devintr+0xc8>
    80005aa4:	144027f3          	csrr	a5,sip
    80005aa8:	ffd7f793          	andi	a5,a5,-3
    80005aac:	14479073          	csrw	sip,a5
    80005ab0:	01813083          	ld	ra,24(sp)
    80005ab4:	01013403          	ld	s0,16(sp)
    80005ab8:	00813483          	ld	s1,8(sp)
    80005abc:	00200513          	li	a0,2
    80005ac0:	02010113          	addi	sp,sp,32
    80005ac4:	00008067          	ret
    80005ac8:	00000097          	auipc	ra,0x0
    80005acc:	24c080e7          	jalr	588(ra) # 80005d14 <plic_claim>
    80005ad0:	00a00793          	li	a5,10
    80005ad4:	00050493          	mv	s1,a0
    80005ad8:	06f50663          	beq	a0,a5,80005b44 <devintr+0x100>
    80005adc:	00100513          	li	a0,1
    80005ae0:	fa0482e3          	beqz	s1,80005a84 <devintr+0x40>
    80005ae4:	00048593          	mv	a1,s1
    80005ae8:	00003517          	auipc	a0,0x3
    80005aec:	bc050513          	addi	a0,a0,-1088 # 800086a8 <CONSOLE_STATUS+0x698>
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	668080e7          	jalr	1640(ra) # 80006158 <__printf>
    80005af8:	00048513          	mv	a0,s1
    80005afc:	00000097          	auipc	ra,0x0
    80005b00:	250080e7          	jalr	592(ra) # 80005d4c <plic_complete>
    80005b04:	00100513          	li	a0,1
    80005b08:	f7dff06f          	j	80005a84 <devintr+0x40>
    80005b0c:	00005517          	auipc	a0,0x5
    80005b10:	7d450513          	addi	a0,a0,2004 # 8000b2e0 <tickslock>
    80005b14:	00001097          	auipc	ra,0x1
    80005b18:	318080e7          	jalr	792(ra) # 80006e2c <acquire>
    80005b1c:	00004717          	auipc	a4,0x4
    80005b20:	68870713          	addi	a4,a4,1672 # 8000a1a4 <ticks>
    80005b24:	00072783          	lw	a5,0(a4)
    80005b28:	00005517          	auipc	a0,0x5
    80005b2c:	7b850513          	addi	a0,a0,1976 # 8000b2e0 <tickslock>
    80005b30:	0017879b          	addiw	a5,a5,1
    80005b34:	00f72023          	sw	a5,0(a4)
    80005b38:	00001097          	auipc	ra,0x1
    80005b3c:	3c0080e7          	jalr	960(ra) # 80006ef8 <release>
    80005b40:	f65ff06f          	j	80005aa4 <devintr+0x60>
    80005b44:	00001097          	auipc	ra,0x1
    80005b48:	f1c080e7          	jalr	-228(ra) # 80006a60 <uartintr>
    80005b4c:	fadff06f          	j	80005af8 <devintr+0xb4>

0000000080005b50 <kernelvec>:
    80005b50:	f0010113          	addi	sp,sp,-256
    80005b54:	00113023          	sd	ra,0(sp)
    80005b58:	00213423          	sd	sp,8(sp)
    80005b5c:	00313823          	sd	gp,16(sp)
    80005b60:	00413c23          	sd	tp,24(sp)
    80005b64:	02513023          	sd	t0,32(sp)
    80005b68:	02613423          	sd	t1,40(sp)
    80005b6c:	02713823          	sd	t2,48(sp)
    80005b70:	02813c23          	sd	s0,56(sp)
    80005b74:	04913023          	sd	s1,64(sp)
    80005b78:	04a13423          	sd	a0,72(sp)
    80005b7c:	04b13823          	sd	a1,80(sp)
    80005b80:	04c13c23          	sd	a2,88(sp)
    80005b84:	06d13023          	sd	a3,96(sp)
    80005b88:	06e13423          	sd	a4,104(sp)
    80005b8c:	06f13823          	sd	a5,112(sp)
    80005b90:	07013c23          	sd	a6,120(sp)
    80005b94:	09113023          	sd	a7,128(sp)
    80005b98:	09213423          	sd	s2,136(sp)
    80005b9c:	09313823          	sd	s3,144(sp)
    80005ba0:	09413c23          	sd	s4,152(sp)
    80005ba4:	0b513023          	sd	s5,160(sp)
    80005ba8:	0b613423          	sd	s6,168(sp)
    80005bac:	0b713823          	sd	s7,176(sp)
    80005bb0:	0b813c23          	sd	s8,184(sp)
    80005bb4:	0d913023          	sd	s9,192(sp)
    80005bb8:	0da13423          	sd	s10,200(sp)
    80005bbc:	0db13823          	sd	s11,208(sp)
    80005bc0:	0dc13c23          	sd	t3,216(sp)
    80005bc4:	0fd13023          	sd	t4,224(sp)
    80005bc8:	0fe13423          	sd	t5,232(sp)
    80005bcc:	0ff13823          	sd	t6,240(sp)
    80005bd0:	cd5ff0ef          	jal	ra,800058a4 <kerneltrap>
    80005bd4:	00013083          	ld	ra,0(sp)
    80005bd8:	00813103          	ld	sp,8(sp)
    80005bdc:	01013183          	ld	gp,16(sp)
    80005be0:	02013283          	ld	t0,32(sp)
    80005be4:	02813303          	ld	t1,40(sp)
    80005be8:	03013383          	ld	t2,48(sp)
    80005bec:	03813403          	ld	s0,56(sp)
    80005bf0:	04013483          	ld	s1,64(sp)
    80005bf4:	04813503          	ld	a0,72(sp)
    80005bf8:	05013583          	ld	a1,80(sp)
    80005bfc:	05813603          	ld	a2,88(sp)
    80005c00:	06013683          	ld	a3,96(sp)
    80005c04:	06813703          	ld	a4,104(sp)
    80005c08:	07013783          	ld	a5,112(sp)
    80005c0c:	07813803          	ld	a6,120(sp)
    80005c10:	08013883          	ld	a7,128(sp)
    80005c14:	08813903          	ld	s2,136(sp)
    80005c18:	09013983          	ld	s3,144(sp)
    80005c1c:	09813a03          	ld	s4,152(sp)
    80005c20:	0a013a83          	ld	s5,160(sp)
    80005c24:	0a813b03          	ld	s6,168(sp)
    80005c28:	0b013b83          	ld	s7,176(sp)
    80005c2c:	0b813c03          	ld	s8,184(sp)
    80005c30:	0c013c83          	ld	s9,192(sp)
    80005c34:	0c813d03          	ld	s10,200(sp)
    80005c38:	0d013d83          	ld	s11,208(sp)
    80005c3c:	0d813e03          	ld	t3,216(sp)
    80005c40:	0e013e83          	ld	t4,224(sp)
    80005c44:	0e813f03          	ld	t5,232(sp)
    80005c48:	0f013f83          	ld	t6,240(sp)
    80005c4c:	10010113          	addi	sp,sp,256
    80005c50:	10200073          	sret
    80005c54:	00000013          	nop
    80005c58:	00000013          	nop
    80005c5c:	00000013          	nop

0000000080005c60 <timervec>:
    80005c60:	34051573          	csrrw	a0,mscratch,a0
    80005c64:	00b53023          	sd	a1,0(a0)
    80005c68:	00c53423          	sd	a2,8(a0)
    80005c6c:	00d53823          	sd	a3,16(a0)
    80005c70:	01853583          	ld	a1,24(a0)
    80005c74:	02053603          	ld	a2,32(a0)
    80005c78:	0005b683          	ld	a3,0(a1)
    80005c7c:	00c686b3          	add	a3,a3,a2
    80005c80:	00d5b023          	sd	a3,0(a1)
    80005c84:	00200593          	li	a1,2
    80005c88:	14459073          	csrw	sip,a1
    80005c8c:	01053683          	ld	a3,16(a0)
    80005c90:	00853603          	ld	a2,8(a0)
    80005c94:	00053583          	ld	a1,0(a0)
    80005c98:	34051573          	csrrw	a0,mscratch,a0
    80005c9c:	30200073          	mret

0000000080005ca0 <plicinit>:
    80005ca0:	ff010113          	addi	sp,sp,-16
    80005ca4:	00813423          	sd	s0,8(sp)
    80005ca8:	01010413          	addi	s0,sp,16
    80005cac:	00813403          	ld	s0,8(sp)
    80005cb0:	0c0007b7          	lui	a5,0xc000
    80005cb4:	00100713          	li	a4,1
    80005cb8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005cbc:	00e7a223          	sw	a4,4(a5)
    80005cc0:	01010113          	addi	sp,sp,16
    80005cc4:	00008067          	ret

0000000080005cc8 <plicinithart>:
    80005cc8:	ff010113          	addi	sp,sp,-16
    80005ccc:	00813023          	sd	s0,0(sp)
    80005cd0:	00113423          	sd	ra,8(sp)
    80005cd4:	01010413          	addi	s0,sp,16
    80005cd8:	00000097          	auipc	ra,0x0
    80005cdc:	a4c080e7          	jalr	-1460(ra) # 80005724 <cpuid>
    80005ce0:	0085171b          	slliw	a4,a0,0x8
    80005ce4:	0c0027b7          	lui	a5,0xc002
    80005ce8:	00e787b3          	add	a5,a5,a4
    80005cec:	40200713          	li	a4,1026
    80005cf0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005cf4:	00813083          	ld	ra,8(sp)
    80005cf8:	00013403          	ld	s0,0(sp)
    80005cfc:	00d5151b          	slliw	a0,a0,0xd
    80005d00:	0c2017b7          	lui	a5,0xc201
    80005d04:	00a78533          	add	a0,a5,a0
    80005d08:	00052023          	sw	zero,0(a0)
    80005d0c:	01010113          	addi	sp,sp,16
    80005d10:	00008067          	ret

0000000080005d14 <plic_claim>:
    80005d14:	ff010113          	addi	sp,sp,-16
    80005d18:	00813023          	sd	s0,0(sp)
    80005d1c:	00113423          	sd	ra,8(sp)
    80005d20:	01010413          	addi	s0,sp,16
    80005d24:	00000097          	auipc	ra,0x0
    80005d28:	a00080e7          	jalr	-1536(ra) # 80005724 <cpuid>
    80005d2c:	00813083          	ld	ra,8(sp)
    80005d30:	00013403          	ld	s0,0(sp)
    80005d34:	00d5151b          	slliw	a0,a0,0xd
    80005d38:	0c2017b7          	lui	a5,0xc201
    80005d3c:	00a78533          	add	a0,a5,a0
    80005d40:	00452503          	lw	a0,4(a0)
    80005d44:	01010113          	addi	sp,sp,16
    80005d48:	00008067          	ret

0000000080005d4c <plic_complete>:
    80005d4c:	fe010113          	addi	sp,sp,-32
    80005d50:	00813823          	sd	s0,16(sp)
    80005d54:	00913423          	sd	s1,8(sp)
    80005d58:	00113c23          	sd	ra,24(sp)
    80005d5c:	02010413          	addi	s0,sp,32
    80005d60:	00050493          	mv	s1,a0
    80005d64:	00000097          	auipc	ra,0x0
    80005d68:	9c0080e7          	jalr	-1600(ra) # 80005724 <cpuid>
    80005d6c:	01813083          	ld	ra,24(sp)
    80005d70:	01013403          	ld	s0,16(sp)
    80005d74:	00d5179b          	slliw	a5,a0,0xd
    80005d78:	0c201737          	lui	a4,0xc201
    80005d7c:	00f707b3          	add	a5,a4,a5
    80005d80:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005d84:	00813483          	ld	s1,8(sp)
    80005d88:	02010113          	addi	sp,sp,32
    80005d8c:	00008067          	ret

0000000080005d90 <consolewrite>:
    80005d90:	fb010113          	addi	sp,sp,-80
    80005d94:	04813023          	sd	s0,64(sp)
    80005d98:	04113423          	sd	ra,72(sp)
    80005d9c:	02913c23          	sd	s1,56(sp)
    80005da0:	03213823          	sd	s2,48(sp)
    80005da4:	03313423          	sd	s3,40(sp)
    80005da8:	03413023          	sd	s4,32(sp)
    80005dac:	01513c23          	sd	s5,24(sp)
    80005db0:	05010413          	addi	s0,sp,80
    80005db4:	06c05c63          	blez	a2,80005e2c <consolewrite+0x9c>
    80005db8:	00060993          	mv	s3,a2
    80005dbc:	00050a13          	mv	s4,a0
    80005dc0:	00058493          	mv	s1,a1
    80005dc4:	00000913          	li	s2,0
    80005dc8:	fff00a93          	li	s5,-1
    80005dcc:	01c0006f          	j	80005de8 <consolewrite+0x58>
    80005dd0:	fbf44503          	lbu	a0,-65(s0)
    80005dd4:	0019091b          	addiw	s2,s2,1
    80005dd8:	00148493          	addi	s1,s1,1
    80005ddc:	00001097          	auipc	ra,0x1
    80005de0:	a9c080e7          	jalr	-1380(ra) # 80006878 <uartputc>
    80005de4:	03298063          	beq	s3,s2,80005e04 <consolewrite+0x74>
    80005de8:	00048613          	mv	a2,s1
    80005dec:	00100693          	li	a3,1
    80005df0:	000a0593          	mv	a1,s4
    80005df4:	fbf40513          	addi	a0,s0,-65
    80005df8:	00000097          	auipc	ra,0x0
    80005dfc:	9e4080e7          	jalr	-1564(ra) # 800057dc <either_copyin>
    80005e00:	fd5518e3          	bne	a0,s5,80005dd0 <consolewrite+0x40>
    80005e04:	04813083          	ld	ra,72(sp)
    80005e08:	04013403          	ld	s0,64(sp)
    80005e0c:	03813483          	ld	s1,56(sp)
    80005e10:	02813983          	ld	s3,40(sp)
    80005e14:	02013a03          	ld	s4,32(sp)
    80005e18:	01813a83          	ld	s5,24(sp)
    80005e1c:	00090513          	mv	a0,s2
    80005e20:	03013903          	ld	s2,48(sp)
    80005e24:	05010113          	addi	sp,sp,80
    80005e28:	00008067          	ret
    80005e2c:	00000913          	li	s2,0
    80005e30:	fd5ff06f          	j	80005e04 <consolewrite+0x74>

0000000080005e34 <consoleread>:
    80005e34:	f9010113          	addi	sp,sp,-112
    80005e38:	06813023          	sd	s0,96(sp)
    80005e3c:	04913c23          	sd	s1,88(sp)
    80005e40:	05213823          	sd	s2,80(sp)
    80005e44:	05313423          	sd	s3,72(sp)
    80005e48:	05413023          	sd	s4,64(sp)
    80005e4c:	03513c23          	sd	s5,56(sp)
    80005e50:	03613823          	sd	s6,48(sp)
    80005e54:	03713423          	sd	s7,40(sp)
    80005e58:	03813023          	sd	s8,32(sp)
    80005e5c:	06113423          	sd	ra,104(sp)
    80005e60:	01913c23          	sd	s9,24(sp)
    80005e64:	07010413          	addi	s0,sp,112
    80005e68:	00060b93          	mv	s7,a2
    80005e6c:	00050913          	mv	s2,a0
    80005e70:	00058c13          	mv	s8,a1
    80005e74:	00060b1b          	sext.w	s6,a2
    80005e78:	00005497          	auipc	s1,0x5
    80005e7c:	49048493          	addi	s1,s1,1168 # 8000b308 <cons>
    80005e80:	00400993          	li	s3,4
    80005e84:	fff00a13          	li	s4,-1
    80005e88:	00a00a93          	li	s5,10
    80005e8c:	05705e63          	blez	s7,80005ee8 <consoleread+0xb4>
    80005e90:	09c4a703          	lw	a4,156(s1)
    80005e94:	0984a783          	lw	a5,152(s1)
    80005e98:	0007071b          	sext.w	a4,a4
    80005e9c:	08e78463          	beq	a5,a4,80005f24 <consoleread+0xf0>
    80005ea0:	07f7f713          	andi	a4,a5,127
    80005ea4:	00e48733          	add	a4,s1,a4
    80005ea8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005eac:	0017869b          	addiw	a3,a5,1
    80005eb0:	08d4ac23          	sw	a3,152(s1)
    80005eb4:	00070c9b          	sext.w	s9,a4
    80005eb8:	0b370663          	beq	a4,s3,80005f64 <consoleread+0x130>
    80005ebc:	00100693          	li	a3,1
    80005ec0:	f9f40613          	addi	a2,s0,-97
    80005ec4:	000c0593          	mv	a1,s8
    80005ec8:	00090513          	mv	a0,s2
    80005ecc:	f8e40fa3          	sb	a4,-97(s0)
    80005ed0:	00000097          	auipc	ra,0x0
    80005ed4:	8c0080e7          	jalr	-1856(ra) # 80005790 <either_copyout>
    80005ed8:	01450863          	beq	a0,s4,80005ee8 <consoleread+0xb4>
    80005edc:	001c0c13          	addi	s8,s8,1
    80005ee0:	fffb8b9b          	addiw	s7,s7,-1
    80005ee4:	fb5c94e3          	bne	s9,s5,80005e8c <consoleread+0x58>
    80005ee8:	000b851b          	sext.w	a0,s7
    80005eec:	06813083          	ld	ra,104(sp)
    80005ef0:	06013403          	ld	s0,96(sp)
    80005ef4:	05813483          	ld	s1,88(sp)
    80005ef8:	05013903          	ld	s2,80(sp)
    80005efc:	04813983          	ld	s3,72(sp)
    80005f00:	04013a03          	ld	s4,64(sp)
    80005f04:	03813a83          	ld	s5,56(sp)
    80005f08:	02813b83          	ld	s7,40(sp)
    80005f0c:	02013c03          	ld	s8,32(sp)
    80005f10:	01813c83          	ld	s9,24(sp)
    80005f14:	40ab053b          	subw	a0,s6,a0
    80005f18:	03013b03          	ld	s6,48(sp)
    80005f1c:	07010113          	addi	sp,sp,112
    80005f20:	00008067          	ret
    80005f24:	00001097          	auipc	ra,0x1
    80005f28:	1d8080e7          	jalr	472(ra) # 800070fc <push_on>
    80005f2c:	0984a703          	lw	a4,152(s1)
    80005f30:	09c4a783          	lw	a5,156(s1)
    80005f34:	0007879b          	sext.w	a5,a5
    80005f38:	fef70ce3          	beq	a4,a5,80005f30 <consoleread+0xfc>
    80005f3c:	00001097          	auipc	ra,0x1
    80005f40:	234080e7          	jalr	564(ra) # 80007170 <pop_on>
    80005f44:	0984a783          	lw	a5,152(s1)
    80005f48:	07f7f713          	andi	a4,a5,127
    80005f4c:	00e48733          	add	a4,s1,a4
    80005f50:	01874703          	lbu	a4,24(a4)
    80005f54:	0017869b          	addiw	a3,a5,1
    80005f58:	08d4ac23          	sw	a3,152(s1)
    80005f5c:	00070c9b          	sext.w	s9,a4
    80005f60:	f5371ee3          	bne	a4,s3,80005ebc <consoleread+0x88>
    80005f64:	000b851b          	sext.w	a0,s7
    80005f68:	f96bf2e3          	bgeu	s7,s6,80005eec <consoleread+0xb8>
    80005f6c:	08f4ac23          	sw	a5,152(s1)
    80005f70:	f7dff06f          	j	80005eec <consoleread+0xb8>

0000000080005f74 <consputc>:
    80005f74:	10000793          	li	a5,256
    80005f78:	00f50663          	beq	a0,a5,80005f84 <consputc+0x10>
    80005f7c:	00001317          	auipc	t1,0x1
    80005f80:	9f430067          	jr	-1548(t1) # 80006970 <uartputc_sync>
    80005f84:	ff010113          	addi	sp,sp,-16
    80005f88:	00113423          	sd	ra,8(sp)
    80005f8c:	00813023          	sd	s0,0(sp)
    80005f90:	01010413          	addi	s0,sp,16
    80005f94:	00800513          	li	a0,8
    80005f98:	00001097          	auipc	ra,0x1
    80005f9c:	9d8080e7          	jalr	-1576(ra) # 80006970 <uartputc_sync>
    80005fa0:	02000513          	li	a0,32
    80005fa4:	00001097          	auipc	ra,0x1
    80005fa8:	9cc080e7          	jalr	-1588(ra) # 80006970 <uartputc_sync>
    80005fac:	00013403          	ld	s0,0(sp)
    80005fb0:	00813083          	ld	ra,8(sp)
    80005fb4:	00800513          	li	a0,8
    80005fb8:	01010113          	addi	sp,sp,16
    80005fbc:	00001317          	auipc	t1,0x1
    80005fc0:	9b430067          	jr	-1612(t1) # 80006970 <uartputc_sync>

0000000080005fc4 <consoleintr>:
    80005fc4:	fe010113          	addi	sp,sp,-32
    80005fc8:	00813823          	sd	s0,16(sp)
    80005fcc:	00913423          	sd	s1,8(sp)
    80005fd0:	01213023          	sd	s2,0(sp)
    80005fd4:	00113c23          	sd	ra,24(sp)
    80005fd8:	02010413          	addi	s0,sp,32
    80005fdc:	00005917          	auipc	s2,0x5
    80005fe0:	32c90913          	addi	s2,s2,812 # 8000b308 <cons>
    80005fe4:	00050493          	mv	s1,a0
    80005fe8:	00090513          	mv	a0,s2
    80005fec:	00001097          	auipc	ra,0x1
    80005ff0:	e40080e7          	jalr	-448(ra) # 80006e2c <acquire>
    80005ff4:	02048c63          	beqz	s1,8000602c <consoleintr+0x68>
    80005ff8:	0a092783          	lw	a5,160(s2)
    80005ffc:	09892703          	lw	a4,152(s2)
    80006000:	07f00693          	li	a3,127
    80006004:	40e7873b          	subw	a4,a5,a4
    80006008:	02e6e263          	bltu	a3,a4,8000602c <consoleintr+0x68>
    8000600c:	00d00713          	li	a4,13
    80006010:	04e48063          	beq	s1,a4,80006050 <consoleintr+0x8c>
    80006014:	07f7f713          	andi	a4,a5,127
    80006018:	00e90733          	add	a4,s2,a4
    8000601c:	0017879b          	addiw	a5,a5,1
    80006020:	0af92023          	sw	a5,160(s2)
    80006024:	00970c23          	sb	s1,24(a4)
    80006028:	08f92e23          	sw	a5,156(s2)
    8000602c:	01013403          	ld	s0,16(sp)
    80006030:	01813083          	ld	ra,24(sp)
    80006034:	00813483          	ld	s1,8(sp)
    80006038:	00013903          	ld	s2,0(sp)
    8000603c:	00005517          	auipc	a0,0x5
    80006040:	2cc50513          	addi	a0,a0,716 # 8000b308 <cons>
    80006044:	02010113          	addi	sp,sp,32
    80006048:	00001317          	auipc	t1,0x1
    8000604c:	eb030067          	jr	-336(t1) # 80006ef8 <release>
    80006050:	00a00493          	li	s1,10
    80006054:	fc1ff06f          	j	80006014 <consoleintr+0x50>

0000000080006058 <consoleinit>:
    80006058:	fe010113          	addi	sp,sp,-32
    8000605c:	00113c23          	sd	ra,24(sp)
    80006060:	00813823          	sd	s0,16(sp)
    80006064:	00913423          	sd	s1,8(sp)
    80006068:	02010413          	addi	s0,sp,32
    8000606c:	00005497          	auipc	s1,0x5
    80006070:	29c48493          	addi	s1,s1,668 # 8000b308 <cons>
    80006074:	00048513          	mv	a0,s1
    80006078:	00002597          	auipc	a1,0x2
    8000607c:	68858593          	addi	a1,a1,1672 # 80008700 <CONSOLE_STATUS+0x6f0>
    80006080:	00001097          	auipc	ra,0x1
    80006084:	d88080e7          	jalr	-632(ra) # 80006e08 <initlock>
    80006088:	00000097          	auipc	ra,0x0
    8000608c:	7ac080e7          	jalr	1964(ra) # 80006834 <uartinit>
    80006090:	01813083          	ld	ra,24(sp)
    80006094:	01013403          	ld	s0,16(sp)
    80006098:	00000797          	auipc	a5,0x0
    8000609c:	d9c78793          	addi	a5,a5,-612 # 80005e34 <consoleread>
    800060a0:	0af4bc23          	sd	a5,184(s1)
    800060a4:	00000797          	auipc	a5,0x0
    800060a8:	cec78793          	addi	a5,a5,-788 # 80005d90 <consolewrite>
    800060ac:	0cf4b023          	sd	a5,192(s1)
    800060b0:	00813483          	ld	s1,8(sp)
    800060b4:	02010113          	addi	sp,sp,32
    800060b8:	00008067          	ret

00000000800060bc <console_read>:
    800060bc:	ff010113          	addi	sp,sp,-16
    800060c0:	00813423          	sd	s0,8(sp)
    800060c4:	01010413          	addi	s0,sp,16
    800060c8:	00813403          	ld	s0,8(sp)
    800060cc:	00005317          	auipc	t1,0x5
    800060d0:	2f433303          	ld	t1,756(t1) # 8000b3c0 <devsw+0x10>
    800060d4:	01010113          	addi	sp,sp,16
    800060d8:	00030067          	jr	t1

00000000800060dc <console_write>:
    800060dc:	ff010113          	addi	sp,sp,-16
    800060e0:	00813423          	sd	s0,8(sp)
    800060e4:	01010413          	addi	s0,sp,16
    800060e8:	00813403          	ld	s0,8(sp)
    800060ec:	00005317          	auipc	t1,0x5
    800060f0:	2dc33303          	ld	t1,732(t1) # 8000b3c8 <devsw+0x18>
    800060f4:	01010113          	addi	sp,sp,16
    800060f8:	00030067          	jr	t1

00000000800060fc <panic>:
    800060fc:	fe010113          	addi	sp,sp,-32
    80006100:	00113c23          	sd	ra,24(sp)
    80006104:	00813823          	sd	s0,16(sp)
    80006108:	00913423          	sd	s1,8(sp)
    8000610c:	02010413          	addi	s0,sp,32
    80006110:	00050493          	mv	s1,a0
    80006114:	00002517          	auipc	a0,0x2
    80006118:	5f450513          	addi	a0,a0,1524 # 80008708 <CONSOLE_STATUS+0x6f8>
    8000611c:	00005797          	auipc	a5,0x5
    80006120:	3407a623          	sw	zero,844(a5) # 8000b468 <pr+0x18>
    80006124:	00000097          	auipc	ra,0x0
    80006128:	034080e7          	jalr	52(ra) # 80006158 <__printf>
    8000612c:	00048513          	mv	a0,s1
    80006130:	00000097          	auipc	ra,0x0
    80006134:	028080e7          	jalr	40(ra) # 80006158 <__printf>
    80006138:	00002517          	auipc	a0,0x2
    8000613c:	05850513          	addi	a0,a0,88 # 80008190 <CONSOLE_STATUS+0x180>
    80006140:	00000097          	auipc	ra,0x0
    80006144:	018080e7          	jalr	24(ra) # 80006158 <__printf>
    80006148:	00100793          	li	a5,1
    8000614c:	00004717          	auipc	a4,0x4
    80006150:	04f72e23          	sw	a5,92(a4) # 8000a1a8 <panicked>
    80006154:	0000006f          	j	80006154 <panic+0x58>

0000000080006158 <__printf>:
    80006158:	f3010113          	addi	sp,sp,-208
    8000615c:	08813023          	sd	s0,128(sp)
    80006160:	07313423          	sd	s3,104(sp)
    80006164:	09010413          	addi	s0,sp,144
    80006168:	05813023          	sd	s8,64(sp)
    8000616c:	08113423          	sd	ra,136(sp)
    80006170:	06913c23          	sd	s1,120(sp)
    80006174:	07213823          	sd	s2,112(sp)
    80006178:	07413023          	sd	s4,96(sp)
    8000617c:	05513c23          	sd	s5,88(sp)
    80006180:	05613823          	sd	s6,80(sp)
    80006184:	05713423          	sd	s7,72(sp)
    80006188:	03913c23          	sd	s9,56(sp)
    8000618c:	03a13823          	sd	s10,48(sp)
    80006190:	03b13423          	sd	s11,40(sp)
    80006194:	00005317          	auipc	t1,0x5
    80006198:	2bc30313          	addi	t1,t1,700 # 8000b450 <pr>
    8000619c:	01832c03          	lw	s8,24(t1)
    800061a0:	00b43423          	sd	a1,8(s0)
    800061a4:	00c43823          	sd	a2,16(s0)
    800061a8:	00d43c23          	sd	a3,24(s0)
    800061ac:	02e43023          	sd	a4,32(s0)
    800061b0:	02f43423          	sd	a5,40(s0)
    800061b4:	03043823          	sd	a6,48(s0)
    800061b8:	03143c23          	sd	a7,56(s0)
    800061bc:	00050993          	mv	s3,a0
    800061c0:	4a0c1663          	bnez	s8,8000666c <__printf+0x514>
    800061c4:	60098c63          	beqz	s3,800067dc <__printf+0x684>
    800061c8:	0009c503          	lbu	a0,0(s3)
    800061cc:	00840793          	addi	a5,s0,8
    800061d0:	f6f43c23          	sd	a5,-136(s0)
    800061d4:	00000493          	li	s1,0
    800061d8:	22050063          	beqz	a0,800063f8 <__printf+0x2a0>
    800061dc:	00002a37          	lui	s4,0x2
    800061e0:	00018ab7          	lui	s5,0x18
    800061e4:	000f4b37          	lui	s6,0xf4
    800061e8:	00989bb7          	lui	s7,0x989
    800061ec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800061f0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800061f4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800061f8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800061fc:	00148c9b          	addiw	s9,s1,1
    80006200:	02500793          	li	a5,37
    80006204:	01998933          	add	s2,s3,s9
    80006208:	38f51263          	bne	a0,a5,8000658c <__printf+0x434>
    8000620c:	00094783          	lbu	a5,0(s2)
    80006210:	00078c9b          	sext.w	s9,a5
    80006214:	1e078263          	beqz	a5,800063f8 <__printf+0x2a0>
    80006218:	0024849b          	addiw	s1,s1,2
    8000621c:	07000713          	li	a4,112
    80006220:	00998933          	add	s2,s3,s1
    80006224:	38e78a63          	beq	a5,a4,800065b8 <__printf+0x460>
    80006228:	20f76863          	bltu	a4,a5,80006438 <__printf+0x2e0>
    8000622c:	42a78863          	beq	a5,a0,8000665c <__printf+0x504>
    80006230:	06400713          	li	a4,100
    80006234:	40e79663          	bne	a5,a4,80006640 <__printf+0x4e8>
    80006238:	f7843783          	ld	a5,-136(s0)
    8000623c:	0007a603          	lw	a2,0(a5)
    80006240:	00878793          	addi	a5,a5,8
    80006244:	f6f43c23          	sd	a5,-136(s0)
    80006248:	42064a63          	bltz	a2,8000667c <__printf+0x524>
    8000624c:	00a00713          	li	a4,10
    80006250:	02e677bb          	remuw	a5,a2,a4
    80006254:	00002d97          	auipc	s11,0x2
    80006258:	4dcd8d93          	addi	s11,s11,1244 # 80008730 <digits>
    8000625c:	00900593          	li	a1,9
    80006260:	0006051b          	sext.w	a0,a2
    80006264:	00000c93          	li	s9,0
    80006268:	02079793          	slli	a5,a5,0x20
    8000626c:	0207d793          	srli	a5,a5,0x20
    80006270:	00fd87b3          	add	a5,s11,a5
    80006274:	0007c783          	lbu	a5,0(a5)
    80006278:	02e656bb          	divuw	a3,a2,a4
    8000627c:	f8f40023          	sb	a5,-128(s0)
    80006280:	14c5d863          	bge	a1,a2,800063d0 <__printf+0x278>
    80006284:	06300593          	li	a1,99
    80006288:	00100c93          	li	s9,1
    8000628c:	02e6f7bb          	remuw	a5,a3,a4
    80006290:	02079793          	slli	a5,a5,0x20
    80006294:	0207d793          	srli	a5,a5,0x20
    80006298:	00fd87b3          	add	a5,s11,a5
    8000629c:	0007c783          	lbu	a5,0(a5)
    800062a0:	02e6d73b          	divuw	a4,a3,a4
    800062a4:	f8f400a3          	sb	a5,-127(s0)
    800062a8:	12a5f463          	bgeu	a1,a0,800063d0 <__printf+0x278>
    800062ac:	00a00693          	li	a3,10
    800062b0:	00900593          	li	a1,9
    800062b4:	02d777bb          	remuw	a5,a4,a3
    800062b8:	02079793          	slli	a5,a5,0x20
    800062bc:	0207d793          	srli	a5,a5,0x20
    800062c0:	00fd87b3          	add	a5,s11,a5
    800062c4:	0007c503          	lbu	a0,0(a5)
    800062c8:	02d757bb          	divuw	a5,a4,a3
    800062cc:	f8a40123          	sb	a0,-126(s0)
    800062d0:	48e5f263          	bgeu	a1,a4,80006754 <__printf+0x5fc>
    800062d4:	06300513          	li	a0,99
    800062d8:	02d7f5bb          	remuw	a1,a5,a3
    800062dc:	02059593          	slli	a1,a1,0x20
    800062e0:	0205d593          	srli	a1,a1,0x20
    800062e4:	00bd85b3          	add	a1,s11,a1
    800062e8:	0005c583          	lbu	a1,0(a1)
    800062ec:	02d7d7bb          	divuw	a5,a5,a3
    800062f0:	f8b401a3          	sb	a1,-125(s0)
    800062f4:	48e57263          	bgeu	a0,a4,80006778 <__printf+0x620>
    800062f8:	3e700513          	li	a0,999
    800062fc:	02d7f5bb          	remuw	a1,a5,a3
    80006300:	02059593          	slli	a1,a1,0x20
    80006304:	0205d593          	srli	a1,a1,0x20
    80006308:	00bd85b3          	add	a1,s11,a1
    8000630c:	0005c583          	lbu	a1,0(a1)
    80006310:	02d7d7bb          	divuw	a5,a5,a3
    80006314:	f8b40223          	sb	a1,-124(s0)
    80006318:	46e57663          	bgeu	a0,a4,80006784 <__printf+0x62c>
    8000631c:	02d7f5bb          	remuw	a1,a5,a3
    80006320:	02059593          	slli	a1,a1,0x20
    80006324:	0205d593          	srli	a1,a1,0x20
    80006328:	00bd85b3          	add	a1,s11,a1
    8000632c:	0005c583          	lbu	a1,0(a1)
    80006330:	02d7d7bb          	divuw	a5,a5,a3
    80006334:	f8b402a3          	sb	a1,-123(s0)
    80006338:	46ea7863          	bgeu	s4,a4,800067a8 <__printf+0x650>
    8000633c:	02d7f5bb          	remuw	a1,a5,a3
    80006340:	02059593          	slli	a1,a1,0x20
    80006344:	0205d593          	srli	a1,a1,0x20
    80006348:	00bd85b3          	add	a1,s11,a1
    8000634c:	0005c583          	lbu	a1,0(a1)
    80006350:	02d7d7bb          	divuw	a5,a5,a3
    80006354:	f8b40323          	sb	a1,-122(s0)
    80006358:	3eeaf863          	bgeu	s5,a4,80006748 <__printf+0x5f0>
    8000635c:	02d7f5bb          	remuw	a1,a5,a3
    80006360:	02059593          	slli	a1,a1,0x20
    80006364:	0205d593          	srli	a1,a1,0x20
    80006368:	00bd85b3          	add	a1,s11,a1
    8000636c:	0005c583          	lbu	a1,0(a1)
    80006370:	02d7d7bb          	divuw	a5,a5,a3
    80006374:	f8b403a3          	sb	a1,-121(s0)
    80006378:	42eb7e63          	bgeu	s6,a4,800067b4 <__printf+0x65c>
    8000637c:	02d7f5bb          	remuw	a1,a5,a3
    80006380:	02059593          	slli	a1,a1,0x20
    80006384:	0205d593          	srli	a1,a1,0x20
    80006388:	00bd85b3          	add	a1,s11,a1
    8000638c:	0005c583          	lbu	a1,0(a1)
    80006390:	02d7d7bb          	divuw	a5,a5,a3
    80006394:	f8b40423          	sb	a1,-120(s0)
    80006398:	42ebfc63          	bgeu	s7,a4,800067d0 <__printf+0x678>
    8000639c:	02079793          	slli	a5,a5,0x20
    800063a0:	0207d793          	srli	a5,a5,0x20
    800063a4:	00fd8db3          	add	s11,s11,a5
    800063a8:	000dc703          	lbu	a4,0(s11)
    800063ac:	00a00793          	li	a5,10
    800063b0:	00900c93          	li	s9,9
    800063b4:	f8e404a3          	sb	a4,-119(s0)
    800063b8:	00065c63          	bgez	a2,800063d0 <__printf+0x278>
    800063bc:	f9040713          	addi	a4,s0,-112
    800063c0:	00f70733          	add	a4,a4,a5
    800063c4:	02d00693          	li	a3,45
    800063c8:	fed70823          	sb	a3,-16(a4)
    800063cc:	00078c93          	mv	s9,a5
    800063d0:	f8040793          	addi	a5,s0,-128
    800063d4:	01978cb3          	add	s9,a5,s9
    800063d8:	f7f40d13          	addi	s10,s0,-129
    800063dc:	000cc503          	lbu	a0,0(s9)
    800063e0:	fffc8c93          	addi	s9,s9,-1
    800063e4:	00000097          	auipc	ra,0x0
    800063e8:	b90080e7          	jalr	-1136(ra) # 80005f74 <consputc>
    800063ec:	ffac98e3          	bne	s9,s10,800063dc <__printf+0x284>
    800063f0:	00094503          	lbu	a0,0(s2)
    800063f4:	e00514e3          	bnez	a0,800061fc <__printf+0xa4>
    800063f8:	1a0c1663          	bnez	s8,800065a4 <__printf+0x44c>
    800063fc:	08813083          	ld	ra,136(sp)
    80006400:	08013403          	ld	s0,128(sp)
    80006404:	07813483          	ld	s1,120(sp)
    80006408:	07013903          	ld	s2,112(sp)
    8000640c:	06813983          	ld	s3,104(sp)
    80006410:	06013a03          	ld	s4,96(sp)
    80006414:	05813a83          	ld	s5,88(sp)
    80006418:	05013b03          	ld	s6,80(sp)
    8000641c:	04813b83          	ld	s7,72(sp)
    80006420:	04013c03          	ld	s8,64(sp)
    80006424:	03813c83          	ld	s9,56(sp)
    80006428:	03013d03          	ld	s10,48(sp)
    8000642c:	02813d83          	ld	s11,40(sp)
    80006430:	0d010113          	addi	sp,sp,208
    80006434:	00008067          	ret
    80006438:	07300713          	li	a4,115
    8000643c:	1ce78a63          	beq	a5,a4,80006610 <__printf+0x4b8>
    80006440:	07800713          	li	a4,120
    80006444:	1ee79e63          	bne	a5,a4,80006640 <__printf+0x4e8>
    80006448:	f7843783          	ld	a5,-136(s0)
    8000644c:	0007a703          	lw	a4,0(a5)
    80006450:	00878793          	addi	a5,a5,8
    80006454:	f6f43c23          	sd	a5,-136(s0)
    80006458:	28074263          	bltz	a4,800066dc <__printf+0x584>
    8000645c:	00002d97          	auipc	s11,0x2
    80006460:	2d4d8d93          	addi	s11,s11,724 # 80008730 <digits>
    80006464:	00f77793          	andi	a5,a4,15
    80006468:	00fd87b3          	add	a5,s11,a5
    8000646c:	0007c683          	lbu	a3,0(a5)
    80006470:	00f00613          	li	a2,15
    80006474:	0007079b          	sext.w	a5,a4
    80006478:	f8d40023          	sb	a3,-128(s0)
    8000647c:	0047559b          	srliw	a1,a4,0x4
    80006480:	0047569b          	srliw	a3,a4,0x4
    80006484:	00000c93          	li	s9,0
    80006488:	0ee65063          	bge	a2,a4,80006568 <__printf+0x410>
    8000648c:	00f6f693          	andi	a3,a3,15
    80006490:	00dd86b3          	add	a3,s11,a3
    80006494:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006498:	0087d79b          	srliw	a5,a5,0x8
    8000649c:	00100c93          	li	s9,1
    800064a0:	f8d400a3          	sb	a3,-127(s0)
    800064a4:	0cb67263          	bgeu	a2,a1,80006568 <__printf+0x410>
    800064a8:	00f7f693          	andi	a3,a5,15
    800064ac:	00dd86b3          	add	a3,s11,a3
    800064b0:	0006c583          	lbu	a1,0(a3)
    800064b4:	00f00613          	li	a2,15
    800064b8:	0047d69b          	srliw	a3,a5,0x4
    800064bc:	f8b40123          	sb	a1,-126(s0)
    800064c0:	0047d593          	srli	a1,a5,0x4
    800064c4:	28f67e63          	bgeu	a2,a5,80006760 <__printf+0x608>
    800064c8:	00f6f693          	andi	a3,a3,15
    800064cc:	00dd86b3          	add	a3,s11,a3
    800064d0:	0006c503          	lbu	a0,0(a3)
    800064d4:	0087d813          	srli	a6,a5,0x8
    800064d8:	0087d69b          	srliw	a3,a5,0x8
    800064dc:	f8a401a3          	sb	a0,-125(s0)
    800064e0:	28b67663          	bgeu	a2,a1,8000676c <__printf+0x614>
    800064e4:	00f6f693          	andi	a3,a3,15
    800064e8:	00dd86b3          	add	a3,s11,a3
    800064ec:	0006c583          	lbu	a1,0(a3)
    800064f0:	00c7d513          	srli	a0,a5,0xc
    800064f4:	00c7d69b          	srliw	a3,a5,0xc
    800064f8:	f8b40223          	sb	a1,-124(s0)
    800064fc:	29067a63          	bgeu	a2,a6,80006790 <__printf+0x638>
    80006500:	00f6f693          	andi	a3,a3,15
    80006504:	00dd86b3          	add	a3,s11,a3
    80006508:	0006c583          	lbu	a1,0(a3)
    8000650c:	0107d813          	srli	a6,a5,0x10
    80006510:	0107d69b          	srliw	a3,a5,0x10
    80006514:	f8b402a3          	sb	a1,-123(s0)
    80006518:	28a67263          	bgeu	a2,a0,8000679c <__printf+0x644>
    8000651c:	00f6f693          	andi	a3,a3,15
    80006520:	00dd86b3          	add	a3,s11,a3
    80006524:	0006c683          	lbu	a3,0(a3)
    80006528:	0147d79b          	srliw	a5,a5,0x14
    8000652c:	f8d40323          	sb	a3,-122(s0)
    80006530:	21067663          	bgeu	a2,a6,8000673c <__printf+0x5e4>
    80006534:	02079793          	slli	a5,a5,0x20
    80006538:	0207d793          	srli	a5,a5,0x20
    8000653c:	00fd8db3          	add	s11,s11,a5
    80006540:	000dc683          	lbu	a3,0(s11)
    80006544:	00800793          	li	a5,8
    80006548:	00700c93          	li	s9,7
    8000654c:	f8d403a3          	sb	a3,-121(s0)
    80006550:	00075c63          	bgez	a4,80006568 <__printf+0x410>
    80006554:	f9040713          	addi	a4,s0,-112
    80006558:	00f70733          	add	a4,a4,a5
    8000655c:	02d00693          	li	a3,45
    80006560:	fed70823          	sb	a3,-16(a4)
    80006564:	00078c93          	mv	s9,a5
    80006568:	f8040793          	addi	a5,s0,-128
    8000656c:	01978cb3          	add	s9,a5,s9
    80006570:	f7f40d13          	addi	s10,s0,-129
    80006574:	000cc503          	lbu	a0,0(s9)
    80006578:	fffc8c93          	addi	s9,s9,-1
    8000657c:	00000097          	auipc	ra,0x0
    80006580:	9f8080e7          	jalr	-1544(ra) # 80005f74 <consputc>
    80006584:	ff9d18e3          	bne	s10,s9,80006574 <__printf+0x41c>
    80006588:	0100006f          	j	80006598 <__printf+0x440>
    8000658c:	00000097          	auipc	ra,0x0
    80006590:	9e8080e7          	jalr	-1560(ra) # 80005f74 <consputc>
    80006594:	000c8493          	mv	s1,s9
    80006598:	00094503          	lbu	a0,0(s2)
    8000659c:	c60510e3          	bnez	a0,800061fc <__printf+0xa4>
    800065a0:	e40c0ee3          	beqz	s8,800063fc <__printf+0x2a4>
    800065a4:	00005517          	auipc	a0,0x5
    800065a8:	eac50513          	addi	a0,a0,-340 # 8000b450 <pr>
    800065ac:	00001097          	auipc	ra,0x1
    800065b0:	94c080e7          	jalr	-1716(ra) # 80006ef8 <release>
    800065b4:	e49ff06f          	j	800063fc <__printf+0x2a4>
    800065b8:	f7843783          	ld	a5,-136(s0)
    800065bc:	03000513          	li	a0,48
    800065c0:	01000d13          	li	s10,16
    800065c4:	00878713          	addi	a4,a5,8
    800065c8:	0007bc83          	ld	s9,0(a5)
    800065cc:	f6e43c23          	sd	a4,-136(s0)
    800065d0:	00000097          	auipc	ra,0x0
    800065d4:	9a4080e7          	jalr	-1628(ra) # 80005f74 <consputc>
    800065d8:	07800513          	li	a0,120
    800065dc:	00000097          	auipc	ra,0x0
    800065e0:	998080e7          	jalr	-1640(ra) # 80005f74 <consputc>
    800065e4:	00002d97          	auipc	s11,0x2
    800065e8:	14cd8d93          	addi	s11,s11,332 # 80008730 <digits>
    800065ec:	03ccd793          	srli	a5,s9,0x3c
    800065f0:	00fd87b3          	add	a5,s11,a5
    800065f4:	0007c503          	lbu	a0,0(a5)
    800065f8:	fffd0d1b          	addiw	s10,s10,-1
    800065fc:	004c9c93          	slli	s9,s9,0x4
    80006600:	00000097          	auipc	ra,0x0
    80006604:	974080e7          	jalr	-1676(ra) # 80005f74 <consputc>
    80006608:	fe0d12e3          	bnez	s10,800065ec <__printf+0x494>
    8000660c:	f8dff06f          	j	80006598 <__printf+0x440>
    80006610:	f7843783          	ld	a5,-136(s0)
    80006614:	0007bc83          	ld	s9,0(a5)
    80006618:	00878793          	addi	a5,a5,8
    8000661c:	f6f43c23          	sd	a5,-136(s0)
    80006620:	000c9a63          	bnez	s9,80006634 <__printf+0x4dc>
    80006624:	1080006f          	j	8000672c <__printf+0x5d4>
    80006628:	001c8c93          	addi	s9,s9,1
    8000662c:	00000097          	auipc	ra,0x0
    80006630:	948080e7          	jalr	-1720(ra) # 80005f74 <consputc>
    80006634:	000cc503          	lbu	a0,0(s9)
    80006638:	fe0518e3          	bnez	a0,80006628 <__printf+0x4d0>
    8000663c:	f5dff06f          	j	80006598 <__printf+0x440>
    80006640:	02500513          	li	a0,37
    80006644:	00000097          	auipc	ra,0x0
    80006648:	930080e7          	jalr	-1744(ra) # 80005f74 <consputc>
    8000664c:	000c8513          	mv	a0,s9
    80006650:	00000097          	auipc	ra,0x0
    80006654:	924080e7          	jalr	-1756(ra) # 80005f74 <consputc>
    80006658:	f41ff06f          	j	80006598 <__printf+0x440>
    8000665c:	02500513          	li	a0,37
    80006660:	00000097          	auipc	ra,0x0
    80006664:	914080e7          	jalr	-1772(ra) # 80005f74 <consputc>
    80006668:	f31ff06f          	j	80006598 <__printf+0x440>
    8000666c:	00030513          	mv	a0,t1
    80006670:	00000097          	auipc	ra,0x0
    80006674:	7bc080e7          	jalr	1980(ra) # 80006e2c <acquire>
    80006678:	b4dff06f          	j	800061c4 <__printf+0x6c>
    8000667c:	40c0053b          	negw	a0,a2
    80006680:	00a00713          	li	a4,10
    80006684:	02e576bb          	remuw	a3,a0,a4
    80006688:	00002d97          	auipc	s11,0x2
    8000668c:	0a8d8d93          	addi	s11,s11,168 # 80008730 <digits>
    80006690:	ff700593          	li	a1,-9
    80006694:	02069693          	slli	a3,a3,0x20
    80006698:	0206d693          	srli	a3,a3,0x20
    8000669c:	00dd86b3          	add	a3,s11,a3
    800066a0:	0006c683          	lbu	a3,0(a3)
    800066a4:	02e557bb          	divuw	a5,a0,a4
    800066a8:	f8d40023          	sb	a3,-128(s0)
    800066ac:	10b65e63          	bge	a2,a1,800067c8 <__printf+0x670>
    800066b0:	06300593          	li	a1,99
    800066b4:	02e7f6bb          	remuw	a3,a5,a4
    800066b8:	02069693          	slli	a3,a3,0x20
    800066bc:	0206d693          	srli	a3,a3,0x20
    800066c0:	00dd86b3          	add	a3,s11,a3
    800066c4:	0006c683          	lbu	a3,0(a3)
    800066c8:	02e7d73b          	divuw	a4,a5,a4
    800066cc:	00200793          	li	a5,2
    800066d0:	f8d400a3          	sb	a3,-127(s0)
    800066d4:	bca5ece3          	bltu	a1,a0,800062ac <__printf+0x154>
    800066d8:	ce5ff06f          	j	800063bc <__printf+0x264>
    800066dc:	40e007bb          	negw	a5,a4
    800066e0:	00002d97          	auipc	s11,0x2
    800066e4:	050d8d93          	addi	s11,s11,80 # 80008730 <digits>
    800066e8:	00f7f693          	andi	a3,a5,15
    800066ec:	00dd86b3          	add	a3,s11,a3
    800066f0:	0006c583          	lbu	a1,0(a3)
    800066f4:	ff100613          	li	a2,-15
    800066f8:	0047d69b          	srliw	a3,a5,0x4
    800066fc:	f8b40023          	sb	a1,-128(s0)
    80006700:	0047d59b          	srliw	a1,a5,0x4
    80006704:	0ac75e63          	bge	a4,a2,800067c0 <__printf+0x668>
    80006708:	00f6f693          	andi	a3,a3,15
    8000670c:	00dd86b3          	add	a3,s11,a3
    80006710:	0006c603          	lbu	a2,0(a3)
    80006714:	00f00693          	li	a3,15
    80006718:	0087d79b          	srliw	a5,a5,0x8
    8000671c:	f8c400a3          	sb	a2,-127(s0)
    80006720:	d8b6e4e3          	bltu	a3,a1,800064a8 <__printf+0x350>
    80006724:	00200793          	li	a5,2
    80006728:	e2dff06f          	j	80006554 <__printf+0x3fc>
    8000672c:	00002c97          	auipc	s9,0x2
    80006730:	fe4c8c93          	addi	s9,s9,-28 # 80008710 <CONSOLE_STATUS+0x700>
    80006734:	02800513          	li	a0,40
    80006738:	ef1ff06f          	j	80006628 <__printf+0x4d0>
    8000673c:	00700793          	li	a5,7
    80006740:	00600c93          	li	s9,6
    80006744:	e0dff06f          	j	80006550 <__printf+0x3f8>
    80006748:	00700793          	li	a5,7
    8000674c:	00600c93          	li	s9,6
    80006750:	c69ff06f          	j	800063b8 <__printf+0x260>
    80006754:	00300793          	li	a5,3
    80006758:	00200c93          	li	s9,2
    8000675c:	c5dff06f          	j	800063b8 <__printf+0x260>
    80006760:	00300793          	li	a5,3
    80006764:	00200c93          	li	s9,2
    80006768:	de9ff06f          	j	80006550 <__printf+0x3f8>
    8000676c:	00400793          	li	a5,4
    80006770:	00300c93          	li	s9,3
    80006774:	dddff06f          	j	80006550 <__printf+0x3f8>
    80006778:	00400793          	li	a5,4
    8000677c:	00300c93          	li	s9,3
    80006780:	c39ff06f          	j	800063b8 <__printf+0x260>
    80006784:	00500793          	li	a5,5
    80006788:	00400c93          	li	s9,4
    8000678c:	c2dff06f          	j	800063b8 <__printf+0x260>
    80006790:	00500793          	li	a5,5
    80006794:	00400c93          	li	s9,4
    80006798:	db9ff06f          	j	80006550 <__printf+0x3f8>
    8000679c:	00600793          	li	a5,6
    800067a0:	00500c93          	li	s9,5
    800067a4:	dadff06f          	j	80006550 <__printf+0x3f8>
    800067a8:	00600793          	li	a5,6
    800067ac:	00500c93          	li	s9,5
    800067b0:	c09ff06f          	j	800063b8 <__printf+0x260>
    800067b4:	00800793          	li	a5,8
    800067b8:	00700c93          	li	s9,7
    800067bc:	bfdff06f          	j	800063b8 <__printf+0x260>
    800067c0:	00100793          	li	a5,1
    800067c4:	d91ff06f          	j	80006554 <__printf+0x3fc>
    800067c8:	00100793          	li	a5,1
    800067cc:	bf1ff06f          	j	800063bc <__printf+0x264>
    800067d0:	00900793          	li	a5,9
    800067d4:	00800c93          	li	s9,8
    800067d8:	be1ff06f          	j	800063b8 <__printf+0x260>
    800067dc:	00002517          	auipc	a0,0x2
    800067e0:	f3c50513          	addi	a0,a0,-196 # 80008718 <CONSOLE_STATUS+0x708>
    800067e4:	00000097          	auipc	ra,0x0
    800067e8:	918080e7          	jalr	-1768(ra) # 800060fc <panic>

00000000800067ec <printfinit>:
    800067ec:	fe010113          	addi	sp,sp,-32
    800067f0:	00813823          	sd	s0,16(sp)
    800067f4:	00913423          	sd	s1,8(sp)
    800067f8:	00113c23          	sd	ra,24(sp)
    800067fc:	02010413          	addi	s0,sp,32
    80006800:	00005497          	auipc	s1,0x5
    80006804:	c5048493          	addi	s1,s1,-944 # 8000b450 <pr>
    80006808:	00048513          	mv	a0,s1
    8000680c:	00002597          	auipc	a1,0x2
    80006810:	f1c58593          	addi	a1,a1,-228 # 80008728 <CONSOLE_STATUS+0x718>
    80006814:	00000097          	auipc	ra,0x0
    80006818:	5f4080e7          	jalr	1524(ra) # 80006e08 <initlock>
    8000681c:	01813083          	ld	ra,24(sp)
    80006820:	01013403          	ld	s0,16(sp)
    80006824:	0004ac23          	sw	zero,24(s1)
    80006828:	00813483          	ld	s1,8(sp)
    8000682c:	02010113          	addi	sp,sp,32
    80006830:	00008067          	ret

0000000080006834 <uartinit>:
    80006834:	ff010113          	addi	sp,sp,-16
    80006838:	00813423          	sd	s0,8(sp)
    8000683c:	01010413          	addi	s0,sp,16
    80006840:	100007b7          	lui	a5,0x10000
    80006844:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006848:	f8000713          	li	a4,-128
    8000684c:	00e781a3          	sb	a4,3(a5)
    80006850:	00300713          	li	a4,3
    80006854:	00e78023          	sb	a4,0(a5)
    80006858:	000780a3          	sb	zero,1(a5)
    8000685c:	00e781a3          	sb	a4,3(a5)
    80006860:	00700693          	li	a3,7
    80006864:	00d78123          	sb	a3,2(a5)
    80006868:	00e780a3          	sb	a4,1(a5)
    8000686c:	00813403          	ld	s0,8(sp)
    80006870:	01010113          	addi	sp,sp,16
    80006874:	00008067          	ret

0000000080006878 <uartputc>:
    80006878:	00004797          	auipc	a5,0x4
    8000687c:	9307a783          	lw	a5,-1744(a5) # 8000a1a8 <panicked>
    80006880:	00078463          	beqz	a5,80006888 <uartputc+0x10>
    80006884:	0000006f          	j	80006884 <uartputc+0xc>
    80006888:	fd010113          	addi	sp,sp,-48
    8000688c:	02813023          	sd	s0,32(sp)
    80006890:	00913c23          	sd	s1,24(sp)
    80006894:	01213823          	sd	s2,16(sp)
    80006898:	01313423          	sd	s3,8(sp)
    8000689c:	02113423          	sd	ra,40(sp)
    800068a0:	03010413          	addi	s0,sp,48
    800068a4:	00004917          	auipc	s2,0x4
    800068a8:	90c90913          	addi	s2,s2,-1780 # 8000a1b0 <uart_tx_r>
    800068ac:	00093783          	ld	a5,0(s2)
    800068b0:	00004497          	auipc	s1,0x4
    800068b4:	90848493          	addi	s1,s1,-1784 # 8000a1b8 <uart_tx_w>
    800068b8:	0004b703          	ld	a4,0(s1)
    800068bc:	02078693          	addi	a3,a5,32
    800068c0:	00050993          	mv	s3,a0
    800068c4:	02e69c63          	bne	a3,a4,800068fc <uartputc+0x84>
    800068c8:	00001097          	auipc	ra,0x1
    800068cc:	834080e7          	jalr	-1996(ra) # 800070fc <push_on>
    800068d0:	00093783          	ld	a5,0(s2)
    800068d4:	0004b703          	ld	a4,0(s1)
    800068d8:	02078793          	addi	a5,a5,32
    800068dc:	00e79463          	bne	a5,a4,800068e4 <uartputc+0x6c>
    800068e0:	0000006f          	j	800068e0 <uartputc+0x68>
    800068e4:	00001097          	auipc	ra,0x1
    800068e8:	88c080e7          	jalr	-1908(ra) # 80007170 <pop_on>
    800068ec:	00093783          	ld	a5,0(s2)
    800068f0:	0004b703          	ld	a4,0(s1)
    800068f4:	02078693          	addi	a3,a5,32
    800068f8:	fce688e3          	beq	a3,a4,800068c8 <uartputc+0x50>
    800068fc:	01f77693          	andi	a3,a4,31
    80006900:	00005597          	auipc	a1,0x5
    80006904:	b7058593          	addi	a1,a1,-1168 # 8000b470 <uart_tx_buf>
    80006908:	00d586b3          	add	a3,a1,a3
    8000690c:	00170713          	addi	a4,a4,1
    80006910:	01368023          	sb	s3,0(a3)
    80006914:	00e4b023          	sd	a4,0(s1)
    80006918:	10000637          	lui	a2,0x10000
    8000691c:	02f71063          	bne	a4,a5,8000693c <uartputc+0xc4>
    80006920:	0340006f          	j	80006954 <uartputc+0xdc>
    80006924:	00074703          	lbu	a4,0(a4)
    80006928:	00f93023          	sd	a5,0(s2)
    8000692c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006930:	00093783          	ld	a5,0(s2)
    80006934:	0004b703          	ld	a4,0(s1)
    80006938:	00f70e63          	beq	a4,a5,80006954 <uartputc+0xdc>
    8000693c:	00564683          	lbu	a3,5(a2)
    80006940:	01f7f713          	andi	a4,a5,31
    80006944:	00e58733          	add	a4,a1,a4
    80006948:	0206f693          	andi	a3,a3,32
    8000694c:	00178793          	addi	a5,a5,1
    80006950:	fc069ae3          	bnez	a3,80006924 <uartputc+0xac>
    80006954:	02813083          	ld	ra,40(sp)
    80006958:	02013403          	ld	s0,32(sp)
    8000695c:	01813483          	ld	s1,24(sp)
    80006960:	01013903          	ld	s2,16(sp)
    80006964:	00813983          	ld	s3,8(sp)
    80006968:	03010113          	addi	sp,sp,48
    8000696c:	00008067          	ret

0000000080006970 <uartputc_sync>:
    80006970:	ff010113          	addi	sp,sp,-16
    80006974:	00813423          	sd	s0,8(sp)
    80006978:	01010413          	addi	s0,sp,16
    8000697c:	00004717          	auipc	a4,0x4
    80006980:	82c72703          	lw	a4,-2004(a4) # 8000a1a8 <panicked>
    80006984:	02071663          	bnez	a4,800069b0 <uartputc_sync+0x40>
    80006988:	00050793          	mv	a5,a0
    8000698c:	100006b7          	lui	a3,0x10000
    80006990:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006994:	02077713          	andi	a4,a4,32
    80006998:	fe070ce3          	beqz	a4,80006990 <uartputc_sync+0x20>
    8000699c:	0ff7f793          	andi	a5,a5,255
    800069a0:	00f68023          	sb	a5,0(a3)
    800069a4:	00813403          	ld	s0,8(sp)
    800069a8:	01010113          	addi	sp,sp,16
    800069ac:	00008067          	ret
    800069b0:	0000006f          	j	800069b0 <uartputc_sync+0x40>

00000000800069b4 <uartstart>:
    800069b4:	ff010113          	addi	sp,sp,-16
    800069b8:	00813423          	sd	s0,8(sp)
    800069bc:	01010413          	addi	s0,sp,16
    800069c0:	00003617          	auipc	a2,0x3
    800069c4:	7f060613          	addi	a2,a2,2032 # 8000a1b0 <uart_tx_r>
    800069c8:	00003517          	auipc	a0,0x3
    800069cc:	7f050513          	addi	a0,a0,2032 # 8000a1b8 <uart_tx_w>
    800069d0:	00063783          	ld	a5,0(a2)
    800069d4:	00053703          	ld	a4,0(a0)
    800069d8:	04f70263          	beq	a4,a5,80006a1c <uartstart+0x68>
    800069dc:	100005b7          	lui	a1,0x10000
    800069e0:	00005817          	auipc	a6,0x5
    800069e4:	a9080813          	addi	a6,a6,-1392 # 8000b470 <uart_tx_buf>
    800069e8:	01c0006f          	j	80006a04 <uartstart+0x50>
    800069ec:	0006c703          	lbu	a4,0(a3)
    800069f0:	00f63023          	sd	a5,0(a2)
    800069f4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800069f8:	00063783          	ld	a5,0(a2)
    800069fc:	00053703          	ld	a4,0(a0)
    80006a00:	00f70e63          	beq	a4,a5,80006a1c <uartstart+0x68>
    80006a04:	01f7f713          	andi	a4,a5,31
    80006a08:	00e806b3          	add	a3,a6,a4
    80006a0c:	0055c703          	lbu	a4,5(a1)
    80006a10:	00178793          	addi	a5,a5,1
    80006a14:	02077713          	andi	a4,a4,32
    80006a18:	fc071ae3          	bnez	a4,800069ec <uartstart+0x38>
    80006a1c:	00813403          	ld	s0,8(sp)
    80006a20:	01010113          	addi	sp,sp,16
    80006a24:	00008067          	ret

0000000080006a28 <uartgetc>:
    80006a28:	ff010113          	addi	sp,sp,-16
    80006a2c:	00813423          	sd	s0,8(sp)
    80006a30:	01010413          	addi	s0,sp,16
    80006a34:	10000737          	lui	a4,0x10000
    80006a38:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006a3c:	0017f793          	andi	a5,a5,1
    80006a40:	00078c63          	beqz	a5,80006a58 <uartgetc+0x30>
    80006a44:	00074503          	lbu	a0,0(a4)
    80006a48:	0ff57513          	andi	a0,a0,255
    80006a4c:	00813403          	ld	s0,8(sp)
    80006a50:	01010113          	addi	sp,sp,16
    80006a54:	00008067          	ret
    80006a58:	fff00513          	li	a0,-1
    80006a5c:	ff1ff06f          	j	80006a4c <uartgetc+0x24>

0000000080006a60 <uartintr>:
    80006a60:	100007b7          	lui	a5,0x10000
    80006a64:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006a68:	0017f793          	andi	a5,a5,1
    80006a6c:	0a078463          	beqz	a5,80006b14 <uartintr+0xb4>
    80006a70:	fe010113          	addi	sp,sp,-32
    80006a74:	00813823          	sd	s0,16(sp)
    80006a78:	00913423          	sd	s1,8(sp)
    80006a7c:	00113c23          	sd	ra,24(sp)
    80006a80:	02010413          	addi	s0,sp,32
    80006a84:	100004b7          	lui	s1,0x10000
    80006a88:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006a8c:	0ff57513          	andi	a0,a0,255
    80006a90:	fffff097          	auipc	ra,0xfffff
    80006a94:	534080e7          	jalr	1332(ra) # 80005fc4 <consoleintr>
    80006a98:	0054c783          	lbu	a5,5(s1)
    80006a9c:	0017f793          	andi	a5,a5,1
    80006aa0:	fe0794e3          	bnez	a5,80006a88 <uartintr+0x28>
    80006aa4:	00003617          	auipc	a2,0x3
    80006aa8:	70c60613          	addi	a2,a2,1804 # 8000a1b0 <uart_tx_r>
    80006aac:	00003517          	auipc	a0,0x3
    80006ab0:	70c50513          	addi	a0,a0,1804 # 8000a1b8 <uart_tx_w>
    80006ab4:	00063783          	ld	a5,0(a2)
    80006ab8:	00053703          	ld	a4,0(a0)
    80006abc:	04f70263          	beq	a4,a5,80006b00 <uartintr+0xa0>
    80006ac0:	100005b7          	lui	a1,0x10000
    80006ac4:	00005817          	auipc	a6,0x5
    80006ac8:	9ac80813          	addi	a6,a6,-1620 # 8000b470 <uart_tx_buf>
    80006acc:	01c0006f          	j	80006ae8 <uartintr+0x88>
    80006ad0:	0006c703          	lbu	a4,0(a3)
    80006ad4:	00f63023          	sd	a5,0(a2)
    80006ad8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006adc:	00063783          	ld	a5,0(a2)
    80006ae0:	00053703          	ld	a4,0(a0)
    80006ae4:	00f70e63          	beq	a4,a5,80006b00 <uartintr+0xa0>
    80006ae8:	01f7f713          	andi	a4,a5,31
    80006aec:	00e806b3          	add	a3,a6,a4
    80006af0:	0055c703          	lbu	a4,5(a1)
    80006af4:	00178793          	addi	a5,a5,1
    80006af8:	02077713          	andi	a4,a4,32
    80006afc:	fc071ae3          	bnez	a4,80006ad0 <uartintr+0x70>
    80006b00:	01813083          	ld	ra,24(sp)
    80006b04:	01013403          	ld	s0,16(sp)
    80006b08:	00813483          	ld	s1,8(sp)
    80006b0c:	02010113          	addi	sp,sp,32
    80006b10:	00008067          	ret
    80006b14:	00003617          	auipc	a2,0x3
    80006b18:	69c60613          	addi	a2,a2,1692 # 8000a1b0 <uart_tx_r>
    80006b1c:	00003517          	auipc	a0,0x3
    80006b20:	69c50513          	addi	a0,a0,1692 # 8000a1b8 <uart_tx_w>
    80006b24:	00063783          	ld	a5,0(a2)
    80006b28:	00053703          	ld	a4,0(a0)
    80006b2c:	04f70263          	beq	a4,a5,80006b70 <uartintr+0x110>
    80006b30:	100005b7          	lui	a1,0x10000
    80006b34:	00005817          	auipc	a6,0x5
    80006b38:	93c80813          	addi	a6,a6,-1732 # 8000b470 <uart_tx_buf>
    80006b3c:	01c0006f          	j	80006b58 <uartintr+0xf8>
    80006b40:	0006c703          	lbu	a4,0(a3)
    80006b44:	00f63023          	sd	a5,0(a2)
    80006b48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006b4c:	00063783          	ld	a5,0(a2)
    80006b50:	00053703          	ld	a4,0(a0)
    80006b54:	02f70063          	beq	a4,a5,80006b74 <uartintr+0x114>
    80006b58:	01f7f713          	andi	a4,a5,31
    80006b5c:	00e806b3          	add	a3,a6,a4
    80006b60:	0055c703          	lbu	a4,5(a1)
    80006b64:	00178793          	addi	a5,a5,1
    80006b68:	02077713          	andi	a4,a4,32
    80006b6c:	fc071ae3          	bnez	a4,80006b40 <uartintr+0xe0>
    80006b70:	00008067          	ret
    80006b74:	00008067          	ret

0000000080006b78 <kinit>:
    80006b78:	fc010113          	addi	sp,sp,-64
    80006b7c:	02913423          	sd	s1,40(sp)
    80006b80:	fffff7b7          	lui	a5,0xfffff
    80006b84:	00006497          	auipc	s1,0x6
    80006b88:	90b48493          	addi	s1,s1,-1781 # 8000c48f <end+0xfff>
    80006b8c:	02813823          	sd	s0,48(sp)
    80006b90:	01313c23          	sd	s3,24(sp)
    80006b94:	00f4f4b3          	and	s1,s1,a5
    80006b98:	02113c23          	sd	ra,56(sp)
    80006b9c:	03213023          	sd	s2,32(sp)
    80006ba0:	01413823          	sd	s4,16(sp)
    80006ba4:	01513423          	sd	s5,8(sp)
    80006ba8:	04010413          	addi	s0,sp,64
    80006bac:	000017b7          	lui	a5,0x1
    80006bb0:	01100993          	li	s3,17
    80006bb4:	00f487b3          	add	a5,s1,a5
    80006bb8:	01b99993          	slli	s3,s3,0x1b
    80006bbc:	06f9e063          	bltu	s3,a5,80006c1c <kinit+0xa4>
    80006bc0:	00005a97          	auipc	s5,0x5
    80006bc4:	8d0a8a93          	addi	s5,s5,-1840 # 8000b490 <end>
    80006bc8:	0754ec63          	bltu	s1,s5,80006c40 <kinit+0xc8>
    80006bcc:	0734fa63          	bgeu	s1,s3,80006c40 <kinit+0xc8>
    80006bd0:	00088a37          	lui	s4,0x88
    80006bd4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006bd8:	00003917          	auipc	s2,0x3
    80006bdc:	5e890913          	addi	s2,s2,1512 # 8000a1c0 <kmem>
    80006be0:	00ca1a13          	slli	s4,s4,0xc
    80006be4:	0140006f          	j	80006bf8 <kinit+0x80>
    80006be8:	000017b7          	lui	a5,0x1
    80006bec:	00f484b3          	add	s1,s1,a5
    80006bf0:	0554e863          	bltu	s1,s5,80006c40 <kinit+0xc8>
    80006bf4:	0534f663          	bgeu	s1,s3,80006c40 <kinit+0xc8>
    80006bf8:	00001637          	lui	a2,0x1
    80006bfc:	00100593          	li	a1,1
    80006c00:	00048513          	mv	a0,s1
    80006c04:	00000097          	auipc	ra,0x0
    80006c08:	5e4080e7          	jalr	1508(ra) # 800071e8 <__memset>
    80006c0c:	00093783          	ld	a5,0(s2)
    80006c10:	00f4b023          	sd	a5,0(s1)
    80006c14:	00993023          	sd	s1,0(s2)
    80006c18:	fd4498e3          	bne	s1,s4,80006be8 <kinit+0x70>
    80006c1c:	03813083          	ld	ra,56(sp)
    80006c20:	03013403          	ld	s0,48(sp)
    80006c24:	02813483          	ld	s1,40(sp)
    80006c28:	02013903          	ld	s2,32(sp)
    80006c2c:	01813983          	ld	s3,24(sp)
    80006c30:	01013a03          	ld	s4,16(sp)
    80006c34:	00813a83          	ld	s5,8(sp)
    80006c38:	04010113          	addi	sp,sp,64
    80006c3c:	00008067          	ret
    80006c40:	00002517          	auipc	a0,0x2
    80006c44:	b0850513          	addi	a0,a0,-1272 # 80008748 <digits+0x18>
    80006c48:	fffff097          	auipc	ra,0xfffff
    80006c4c:	4b4080e7          	jalr	1204(ra) # 800060fc <panic>

0000000080006c50 <freerange>:
    80006c50:	fc010113          	addi	sp,sp,-64
    80006c54:	000017b7          	lui	a5,0x1
    80006c58:	02913423          	sd	s1,40(sp)
    80006c5c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006c60:	009504b3          	add	s1,a0,s1
    80006c64:	fffff537          	lui	a0,0xfffff
    80006c68:	02813823          	sd	s0,48(sp)
    80006c6c:	02113c23          	sd	ra,56(sp)
    80006c70:	03213023          	sd	s2,32(sp)
    80006c74:	01313c23          	sd	s3,24(sp)
    80006c78:	01413823          	sd	s4,16(sp)
    80006c7c:	01513423          	sd	s5,8(sp)
    80006c80:	01613023          	sd	s6,0(sp)
    80006c84:	04010413          	addi	s0,sp,64
    80006c88:	00a4f4b3          	and	s1,s1,a0
    80006c8c:	00f487b3          	add	a5,s1,a5
    80006c90:	06f5e463          	bltu	a1,a5,80006cf8 <freerange+0xa8>
    80006c94:	00004a97          	auipc	s5,0x4
    80006c98:	7fca8a93          	addi	s5,s5,2044 # 8000b490 <end>
    80006c9c:	0954e263          	bltu	s1,s5,80006d20 <freerange+0xd0>
    80006ca0:	01100993          	li	s3,17
    80006ca4:	01b99993          	slli	s3,s3,0x1b
    80006ca8:	0734fc63          	bgeu	s1,s3,80006d20 <freerange+0xd0>
    80006cac:	00058a13          	mv	s4,a1
    80006cb0:	00003917          	auipc	s2,0x3
    80006cb4:	51090913          	addi	s2,s2,1296 # 8000a1c0 <kmem>
    80006cb8:	00002b37          	lui	s6,0x2
    80006cbc:	0140006f          	j	80006cd0 <freerange+0x80>
    80006cc0:	000017b7          	lui	a5,0x1
    80006cc4:	00f484b3          	add	s1,s1,a5
    80006cc8:	0554ec63          	bltu	s1,s5,80006d20 <freerange+0xd0>
    80006ccc:	0534fa63          	bgeu	s1,s3,80006d20 <freerange+0xd0>
    80006cd0:	00001637          	lui	a2,0x1
    80006cd4:	00100593          	li	a1,1
    80006cd8:	00048513          	mv	a0,s1
    80006cdc:	00000097          	auipc	ra,0x0
    80006ce0:	50c080e7          	jalr	1292(ra) # 800071e8 <__memset>
    80006ce4:	00093703          	ld	a4,0(s2)
    80006ce8:	016487b3          	add	a5,s1,s6
    80006cec:	00e4b023          	sd	a4,0(s1)
    80006cf0:	00993023          	sd	s1,0(s2)
    80006cf4:	fcfa76e3          	bgeu	s4,a5,80006cc0 <freerange+0x70>
    80006cf8:	03813083          	ld	ra,56(sp)
    80006cfc:	03013403          	ld	s0,48(sp)
    80006d00:	02813483          	ld	s1,40(sp)
    80006d04:	02013903          	ld	s2,32(sp)
    80006d08:	01813983          	ld	s3,24(sp)
    80006d0c:	01013a03          	ld	s4,16(sp)
    80006d10:	00813a83          	ld	s5,8(sp)
    80006d14:	00013b03          	ld	s6,0(sp)
    80006d18:	04010113          	addi	sp,sp,64
    80006d1c:	00008067          	ret
    80006d20:	00002517          	auipc	a0,0x2
    80006d24:	a2850513          	addi	a0,a0,-1496 # 80008748 <digits+0x18>
    80006d28:	fffff097          	auipc	ra,0xfffff
    80006d2c:	3d4080e7          	jalr	980(ra) # 800060fc <panic>

0000000080006d30 <kfree>:
    80006d30:	fe010113          	addi	sp,sp,-32
    80006d34:	00813823          	sd	s0,16(sp)
    80006d38:	00113c23          	sd	ra,24(sp)
    80006d3c:	00913423          	sd	s1,8(sp)
    80006d40:	02010413          	addi	s0,sp,32
    80006d44:	03451793          	slli	a5,a0,0x34
    80006d48:	04079c63          	bnez	a5,80006da0 <kfree+0x70>
    80006d4c:	00004797          	auipc	a5,0x4
    80006d50:	74478793          	addi	a5,a5,1860 # 8000b490 <end>
    80006d54:	00050493          	mv	s1,a0
    80006d58:	04f56463          	bltu	a0,a5,80006da0 <kfree+0x70>
    80006d5c:	01100793          	li	a5,17
    80006d60:	01b79793          	slli	a5,a5,0x1b
    80006d64:	02f57e63          	bgeu	a0,a5,80006da0 <kfree+0x70>
    80006d68:	00001637          	lui	a2,0x1
    80006d6c:	00100593          	li	a1,1
    80006d70:	00000097          	auipc	ra,0x0
    80006d74:	478080e7          	jalr	1144(ra) # 800071e8 <__memset>
    80006d78:	00003797          	auipc	a5,0x3
    80006d7c:	44878793          	addi	a5,a5,1096 # 8000a1c0 <kmem>
    80006d80:	0007b703          	ld	a4,0(a5)
    80006d84:	01813083          	ld	ra,24(sp)
    80006d88:	01013403          	ld	s0,16(sp)
    80006d8c:	00e4b023          	sd	a4,0(s1)
    80006d90:	0097b023          	sd	s1,0(a5)
    80006d94:	00813483          	ld	s1,8(sp)
    80006d98:	02010113          	addi	sp,sp,32
    80006d9c:	00008067          	ret
    80006da0:	00002517          	auipc	a0,0x2
    80006da4:	9a850513          	addi	a0,a0,-1624 # 80008748 <digits+0x18>
    80006da8:	fffff097          	auipc	ra,0xfffff
    80006dac:	354080e7          	jalr	852(ra) # 800060fc <panic>

0000000080006db0 <kalloc>:
    80006db0:	fe010113          	addi	sp,sp,-32
    80006db4:	00813823          	sd	s0,16(sp)
    80006db8:	00913423          	sd	s1,8(sp)
    80006dbc:	00113c23          	sd	ra,24(sp)
    80006dc0:	02010413          	addi	s0,sp,32
    80006dc4:	00003797          	auipc	a5,0x3
    80006dc8:	3fc78793          	addi	a5,a5,1020 # 8000a1c0 <kmem>
    80006dcc:	0007b483          	ld	s1,0(a5)
    80006dd0:	02048063          	beqz	s1,80006df0 <kalloc+0x40>
    80006dd4:	0004b703          	ld	a4,0(s1)
    80006dd8:	00001637          	lui	a2,0x1
    80006ddc:	00500593          	li	a1,5
    80006de0:	00048513          	mv	a0,s1
    80006de4:	00e7b023          	sd	a4,0(a5)
    80006de8:	00000097          	auipc	ra,0x0
    80006dec:	400080e7          	jalr	1024(ra) # 800071e8 <__memset>
    80006df0:	01813083          	ld	ra,24(sp)
    80006df4:	01013403          	ld	s0,16(sp)
    80006df8:	00048513          	mv	a0,s1
    80006dfc:	00813483          	ld	s1,8(sp)
    80006e00:	02010113          	addi	sp,sp,32
    80006e04:	00008067          	ret

0000000080006e08 <initlock>:
    80006e08:	ff010113          	addi	sp,sp,-16
    80006e0c:	00813423          	sd	s0,8(sp)
    80006e10:	01010413          	addi	s0,sp,16
    80006e14:	00813403          	ld	s0,8(sp)
    80006e18:	00b53423          	sd	a1,8(a0)
    80006e1c:	00052023          	sw	zero,0(a0)
    80006e20:	00053823          	sd	zero,16(a0)
    80006e24:	01010113          	addi	sp,sp,16
    80006e28:	00008067          	ret

0000000080006e2c <acquire>:
    80006e2c:	fe010113          	addi	sp,sp,-32
    80006e30:	00813823          	sd	s0,16(sp)
    80006e34:	00913423          	sd	s1,8(sp)
    80006e38:	00113c23          	sd	ra,24(sp)
    80006e3c:	01213023          	sd	s2,0(sp)
    80006e40:	02010413          	addi	s0,sp,32
    80006e44:	00050493          	mv	s1,a0
    80006e48:	10002973          	csrr	s2,sstatus
    80006e4c:	100027f3          	csrr	a5,sstatus
    80006e50:	ffd7f793          	andi	a5,a5,-3
    80006e54:	10079073          	csrw	sstatus,a5
    80006e58:	fffff097          	auipc	ra,0xfffff
    80006e5c:	8ec080e7          	jalr	-1812(ra) # 80005744 <mycpu>
    80006e60:	07852783          	lw	a5,120(a0)
    80006e64:	06078e63          	beqz	a5,80006ee0 <acquire+0xb4>
    80006e68:	fffff097          	auipc	ra,0xfffff
    80006e6c:	8dc080e7          	jalr	-1828(ra) # 80005744 <mycpu>
    80006e70:	07852783          	lw	a5,120(a0)
    80006e74:	0004a703          	lw	a4,0(s1)
    80006e78:	0017879b          	addiw	a5,a5,1
    80006e7c:	06f52c23          	sw	a5,120(a0)
    80006e80:	04071063          	bnez	a4,80006ec0 <acquire+0x94>
    80006e84:	00100713          	li	a4,1
    80006e88:	00070793          	mv	a5,a4
    80006e8c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006e90:	0007879b          	sext.w	a5,a5
    80006e94:	fe079ae3          	bnez	a5,80006e88 <acquire+0x5c>
    80006e98:	0ff0000f          	fence
    80006e9c:	fffff097          	auipc	ra,0xfffff
    80006ea0:	8a8080e7          	jalr	-1880(ra) # 80005744 <mycpu>
    80006ea4:	01813083          	ld	ra,24(sp)
    80006ea8:	01013403          	ld	s0,16(sp)
    80006eac:	00a4b823          	sd	a0,16(s1)
    80006eb0:	00013903          	ld	s2,0(sp)
    80006eb4:	00813483          	ld	s1,8(sp)
    80006eb8:	02010113          	addi	sp,sp,32
    80006ebc:	00008067          	ret
    80006ec0:	0104b903          	ld	s2,16(s1)
    80006ec4:	fffff097          	auipc	ra,0xfffff
    80006ec8:	880080e7          	jalr	-1920(ra) # 80005744 <mycpu>
    80006ecc:	faa91ce3          	bne	s2,a0,80006e84 <acquire+0x58>
    80006ed0:	00002517          	auipc	a0,0x2
    80006ed4:	88050513          	addi	a0,a0,-1920 # 80008750 <digits+0x20>
    80006ed8:	fffff097          	auipc	ra,0xfffff
    80006edc:	224080e7          	jalr	548(ra) # 800060fc <panic>
    80006ee0:	00195913          	srli	s2,s2,0x1
    80006ee4:	fffff097          	auipc	ra,0xfffff
    80006ee8:	860080e7          	jalr	-1952(ra) # 80005744 <mycpu>
    80006eec:	00197913          	andi	s2,s2,1
    80006ef0:	07252e23          	sw	s2,124(a0)
    80006ef4:	f75ff06f          	j	80006e68 <acquire+0x3c>

0000000080006ef8 <release>:
    80006ef8:	fe010113          	addi	sp,sp,-32
    80006efc:	00813823          	sd	s0,16(sp)
    80006f00:	00113c23          	sd	ra,24(sp)
    80006f04:	00913423          	sd	s1,8(sp)
    80006f08:	01213023          	sd	s2,0(sp)
    80006f0c:	02010413          	addi	s0,sp,32
    80006f10:	00052783          	lw	a5,0(a0)
    80006f14:	00079a63          	bnez	a5,80006f28 <release+0x30>
    80006f18:	00002517          	auipc	a0,0x2
    80006f1c:	84050513          	addi	a0,a0,-1984 # 80008758 <digits+0x28>
    80006f20:	fffff097          	auipc	ra,0xfffff
    80006f24:	1dc080e7          	jalr	476(ra) # 800060fc <panic>
    80006f28:	01053903          	ld	s2,16(a0)
    80006f2c:	00050493          	mv	s1,a0
    80006f30:	fffff097          	auipc	ra,0xfffff
    80006f34:	814080e7          	jalr	-2028(ra) # 80005744 <mycpu>
    80006f38:	fea910e3          	bne	s2,a0,80006f18 <release+0x20>
    80006f3c:	0004b823          	sd	zero,16(s1)
    80006f40:	0ff0000f          	fence
    80006f44:	0f50000f          	fence	iorw,ow
    80006f48:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006f4c:	ffffe097          	auipc	ra,0xffffe
    80006f50:	7f8080e7          	jalr	2040(ra) # 80005744 <mycpu>
    80006f54:	100027f3          	csrr	a5,sstatus
    80006f58:	0027f793          	andi	a5,a5,2
    80006f5c:	04079a63          	bnez	a5,80006fb0 <release+0xb8>
    80006f60:	07852783          	lw	a5,120(a0)
    80006f64:	02f05e63          	blez	a5,80006fa0 <release+0xa8>
    80006f68:	fff7871b          	addiw	a4,a5,-1
    80006f6c:	06e52c23          	sw	a4,120(a0)
    80006f70:	00071c63          	bnez	a4,80006f88 <release+0x90>
    80006f74:	07c52783          	lw	a5,124(a0)
    80006f78:	00078863          	beqz	a5,80006f88 <release+0x90>
    80006f7c:	100027f3          	csrr	a5,sstatus
    80006f80:	0027e793          	ori	a5,a5,2
    80006f84:	10079073          	csrw	sstatus,a5
    80006f88:	01813083          	ld	ra,24(sp)
    80006f8c:	01013403          	ld	s0,16(sp)
    80006f90:	00813483          	ld	s1,8(sp)
    80006f94:	00013903          	ld	s2,0(sp)
    80006f98:	02010113          	addi	sp,sp,32
    80006f9c:	00008067          	ret
    80006fa0:	00001517          	auipc	a0,0x1
    80006fa4:	7d850513          	addi	a0,a0,2008 # 80008778 <digits+0x48>
    80006fa8:	fffff097          	auipc	ra,0xfffff
    80006fac:	154080e7          	jalr	340(ra) # 800060fc <panic>
    80006fb0:	00001517          	auipc	a0,0x1
    80006fb4:	7b050513          	addi	a0,a0,1968 # 80008760 <digits+0x30>
    80006fb8:	fffff097          	auipc	ra,0xfffff
    80006fbc:	144080e7          	jalr	324(ra) # 800060fc <panic>

0000000080006fc0 <holding>:
    80006fc0:	00052783          	lw	a5,0(a0)
    80006fc4:	00079663          	bnez	a5,80006fd0 <holding+0x10>
    80006fc8:	00000513          	li	a0,0
    80006fcc:	00008067          	ret
    80006fd0:	fe010113          	addi	sp,sp,-32
    80006fd4:	00813823          	sd	s0,16(sp)
    80006fd8:	00913423          	sd	s1,8(sp)
    80006fdc:	00113c23          	sd	ra,24(sp)
    80006fe0:	02010413          	addi	s0,sp,32
    80006fe4:	01053483          	ld	s1,16(a0)
    80006fe8:	ffffe097          	auipc	ra,0xffffe
    80006fec:	75c080e7          	jalr	1884(ra) # 80005744 <mycpu>
    80006ff0:	01813083          	ld	ra,24(sp)
    80006ff4:	01013403          	ld	s0,16(sp)
    80006ff8:	40a48533          	sub	a0,s1,a0
    80006ffc:	00153513          	seqz	a0,a0
    80007000:	00813483          	ld	s1,8(sp)
    80007004:	02010113          	addi	sp,sp,32
    80007008:	00008067          	ret

000000008000700c <push_off>:
    8000700c:	fe010113          	addi	sp,sp,-32
    80007010:	00813823          	sd	s0,16(sp)
    80007014:	00113c23          	sd	ra,24(sp)
    80007018:	00913423          	sd	s1,8(sp)
    8000701c:	02010413          	addi	s0,sp,32
    80007020:	100024f3          	csrr	s1,sstatus
    80007024:	100027f3          	csrr	a5,sstatus
    80007028:	ffd7f793          	andi	a5,a5,-3
    8000702c:	10079073          	csrw	sstatus,a5
    80007030:	ffffe097          	auipc	ra,0xffffe
    80007034:	714080e7          	jalr	1812(ra) # 80005744 <mycpu>
    80007038:	07852783          	lw	a5,120(a0)
    8000703c:	02078663          	beqz	a5,80007068 <push_off+0x5c>
    80007040:	ffffe097          	auipc	ra,0xffffe
    80007044:	704080e7          	jalr	1796(ra) # 80005744 <mycpu>
    80007048:	07852783          	lw	a5,120(a0)
    8000704c:	01813083          	ld	ra,24(sp)
    80007050:	01013403          	ld	s0,16(sp)
    80007054:	0017879b          	addiw	a5,a5,1
    80007058:	06f52c23          	sw	a5,120(a0)
    8000705c:	00813483          	ld	s1,8(sp)
    80007060:	02010113          	addi	sp,sp,32
    80007064:	00008067          	ret
    80007068:	0014d493          	srli	s1,s1,0x1
    8000706c:	ffffe097          	auipc	ra,0xffffe
    80007070:	6d8080e7          	jalr	1752(ra) # 80005744 <mycpu>
    80007074:	0014f493          	andi	s1,s1,1
    80007078:	06952e23          	sw	s1,124(a0)
    8000707c:	fc5ff06f          	j	80007040 <push_off+0x34>

0000000080007080 <pop_off>:
    80007080:	ff010113          	addi	sp,sp,-16
    80007084:	00813023          	sd	s0,0(sp)
    80007088:	00113423          	sd	ra,8(sp)
    8000708c:	01010413          	addi	s0,sp,16
    80007090:	ffffe097          	auipc	ra,0xffffe
    80007094:	6b4080e7          	jalr	1716(ra) # 80005744 <mycpu>
    80007098:	100027f3          	csrr	a5,sstatus
    8000709c:	0027f793          	andi	a5,a5,2
    800070a0:	04079663          	bnez	a5,800070ec <pop_off+0x6c>
    800070a4:	07852783          	lw	a5,120(a0)
    800070a8:	02f05a63          	blez	a5,800070dc <pop_off+0x5c>
    800070ac:	fff7871b          	addiw	a4,a5,-1
    800070b0:	06e52c23          	sw	a4,120(a0)
    800070b4:	00071c63          	bnez	a4,800070cc <pop_off+0x4c>
    800070b8:	07c52783          	lw	a5,124(a0)
    800070bc:	00078863          	beqz	a5,800070cc <pop_off+0x4c>
    800070c0:	100027f3          	csrr	a5,sstatus
    800070c4:	0027e793          	ori	a5,a5,2
    800070c8:	10079073          	csrw	sstatus,a5
    800070cc:	00813083          	ld	ra,8(sp)
    800070d0:	00013403          	ld	s0,0(sp)
    800070d4:	01010113          	addi	sp,sp,16
    800070d8:	00008067          	ret
    800070dc:	00001517          	auipc	a0,0x1
    800070e0:	69c50513          	addi	a0,a0,1692 # 80008778 <digits+0x48>
    800070e4:	fffff097          	auipc	ra,0xfffff
    800070e8:	018080e7          	jalr	24(ra) # 800060fc <panic>
    800070ec:	00001517          	auipc	a0,0x1
    800070f0:	67450513          	addi	a0,a0,1652 # 80008760 <digits+0x30>
    800070f4:	fffff097          	auipc	ra,0xfffff
    800070f8:	008080e7          	jalr	8(ra) # 800060fc <panic>

00000000800070fc <push_on>:
    800070fc:	fe010113          	addi	sp,sp,-32
    80007100:	00813823          	sd	s0,16(sp)
    80007104:	00113c23          	sd	ra,24(sp)
    80007108:	00913423          	sd	s1,8(sp)
    8000710c:	02010413          	addi	s0,sp,32
    80007110:	100024f3          	csrr	s1,sstatus
    80007114:	100027f3          	csrr	a5,sstatus
    80007118:	0027e793          	ori	a5,a5,2
    8000711c:	10079073          	csrw	sstatus,a5
    80007120:	ffffe097          	auipc	ra,0xffffe
    80007124:	624080e7          	jalr	1572(ra) # 80005744 <mycpu>
    80007128:	07852783          	lw	a5,120(a0)
    8000712c:	02078663          	beqz	a5,80007158 <push_on+0x5c>
    80007130:	ffffe097          	auipc	ra,0xffffe
    80007134:	614080e7          	jalr	1556(ra) # 80005744 <mycpu>
    80007138:	07852783          	lw	a5,120(a0)
    8000713c:	01813083          	ld	ra,24(sp)
    80007140:	01013403          	ld	s0,16(sp)
    80007144:	0017879b          	addiw	a5,a5,1
    80007148:	06f52c23          	sw	a5,120(a0)
    8000714c:	00813483          	ld	s1,8(sp)
    80007150:	02010113          	addi	sp,sp,32
    80007154:	00008067          	ret
    80007158:	0014d493          	srli	s1,s1,0x1
    8000715c:	ffffe097          	auipc	ra,0xffffe
    80007160:	5e8080e7          	jalr	1512(ra) # 80005744 <mycpu>
    80007164:	0014f493          	andi	s1,s1,1
    80007168:	06952e23          	sw	s1,124(a0)
    8000716c:	fc5ff06f          	j	80007130 <push_on+0x34>

0000000080007170 <pop_on>:
    80007170:	ff010113          	addi	sp,sp,-16
    80007174:	00813023          	sd	s0,0(sp)
    80007178:	00113423          	sd	ra,8(sp)
    8000717c:	01010413          	addi	s0,sp,16
    80007180:	ffffe097          	auipc	ra,0xffffe
    80007184:	5c4080e7          	jalr	1476(ra) # 80005744 <mycpu>
    80007188:	100027f3          	csrr	a5,sstatus
    8000718c:	0027f793          	andi	a5,a5,2
    80007190:	04078463          	beqz	a5,800071d8 <pop_on+0x68>
    80007194:	07852783          	lw	a5,120(a0)
    80007198:	02f05863          	blez	a5,800071c8 <pop_on+0x58>
    8000719c:	fff7879b          	addiw	a5,a5,-1
    800071a0:	06f52c23          	sw	a5,120(a0)
    800071a4:	07853783          	ld	a5,120(a0)
    800071a8:	00079863          	bnez	a5,800071b8 <pop_on+0x48>
    800071ac:	100027f3          	csrr	a5,sstatus
    800071b0:	ffd7f793          	andi	a5,a5,-3
    800071b4:	10079073          	csrw	sstatus,a5
    800071b8:	00813083          	ld	ra,8(sp)
    800071bc:	00013403          	ld	s0,0(sp)
    800071c0:	01010113          	addi	sp,sp,16
    800071c4:	00008067          	ret
    800071c8:	00001517          	auipc	a0,0x1
    800071cc:	5d850513          	addi	a0,a0,1496 # 800087a0 <digits+0x70>
    800071d0:	fffff097          	auipc	ra,0xfffff
    800071d4:	f2c080e7          	jalr	-212(ra) # 800060fc <panic>
    800071d8:	00001517          	auipc	a0,0x1
    800071dc:	5a850513          	addi	a0,a0,1448 # 80008780 <digits+0x50>
    800071e0:	fffff097          	auipc	ra,0xfffff
    800071e4:	f1c080e7          	jalr	-228(ra) # 800060fc <panic>

00000000800071e8 <__memset>:
    800071e8:	ff010113          	addi	sp,sp,-16
    800071ec:	00813423          	sd	s0,8(sp)
    800071f0:	01010413          	addi	s0,sp,16
    800071f4:	1a060e63          	beqz	a2,800073b0 <__memset+0x1c8>
    800071f8:	40a007b3          	neg	a5,a0
    800071fc:	0077f793          	andi	a5,a5,7
    80007200:	00778693          	addi	a3,a5,7
    80007204:	00b00813          	li	a6,11
    80007208:	0ff5f593          	andi	a1,a1,255
    8000720c:	fff6071b          	addiw	a4,a2,-1
    80007210:	1b06e663          	bltu	a3,a6,800073bc <__memset+0x1d4>
    80007214:	1cd76463          	bltu	a4,a3,800073dc <__memset+0x1f4>
    80007218:	1a078e63          	beqz	a5,800073d4 <__memset+0x1ec>
    8000721c:	00b50023          	sb	a1,0(a0)
    80007220:	00100713          	li	a4,1
    80007224:	1ae78463          	beq	a5,a4,800073cc <__memset+0x1e4>
    80007228:	00b500a3          	sb	a1,1(a0)
    8000722c:	00200713          	li	a4,2
    80007230:	1ae78a63          	beq	a5,a4,800073e4 <__memset+0x1fc>
    80007234:	00b50123          	sb	a1,2(a0)
    80007238:	00300713          	li	a4,3
    8000723c:	18e78463          	beq	a5,a4,800073c4 <__memset+0x1dc>
    80007240:	00b501a3          	sb	a1,3(a0)
    80007244:	00400713          	li	a4,4
    80007248:	1ae78263          	beq	a5,a4,800073ec <__memset+0x204>
    8000724c:	00b50223          	sb	a1,4(a0)
    80007250:	00500713          	li	a4,5
    80007254:	1ae78063          	beq	a5,a4,800073f4 <__memset+0x20c>
    80007258:	00b502a3          	sb	a1,5(a0)
    8000725c:	00700713          	li	a4,7
    80007260:	18e79e63          	bne	a5,a4,800073fc <__memset+0x214>
    80007264:	00b50323          	sb	a1,6(a0)
    80007268:	00700e93          	li	t4,7
    8000726c:	00859713          	slli	a4,a1,0x8
    80007270:	00e5e733          	or	a4,a1,a4
    80007274:	01059e13          	slli	t3,a1,0x10
    80007278:	01c76e33          	or	t3,a4,t3
    8000727c:	01859313          	slli	t1,a1,0x18
    80007280:	006e6333          	or	t1,t3,t1
    80007284:	02059893          	slli	a7,a1,0x20
    80007288:	40f60e3b          	subw	t3,a2,a5
    8000728c:	011368b3          	or	a7,t1,a7
    80007290:	02859813          	slli	a6,a1,0x28
    80007294:	0108e833          	or	a6,a7,a6
    80007298:	03059693          	slli	a3,a1,0x30
    8000729c:	003e589b          	srliw	a7,t3,0x3
    800072a0:	00d866b3          	or	a3,a6,a3
    800072a4:	03859713          	slli	a4,a1,0x38
    800072a8:	00389813          	slli	a6,a7,0x3
    800072ac:	00f507b3          	add	a5,a0,a5
    800072b0:	00e6e733          	or	a4,a3,a4
    800072b4:	000e089b          	sext.w	a7,t3
    800072b8:	00f806b3          	add	a3,a6,a5
    800072bc:	00e7b023          	sd	a4,0(a5)
    800072c0:	00878793          	addi	a5,a5,8
    800072c4:	fed79ce3          	bne	a5,a3,800072bc <__memset+0xd4>
    800072c8:	ff8e7793          	andi	a5,t3,-8
    800072cc:	0007871b          	sext.w	a4,a5
    800072d0:	01d787bb          	addw	a5,a5,t4
    800072d4:	0ce88e63          	beq	a7,a4,800073b0 <__memset+0x1c8>
    800072d8:	00f50733          	add	a4,a0,a5
    800072dc:	00b70023          	sb	a1,0(a4)
    800072e0:	0017871b          	addiw	a4,a5,1
    800072e4:	0cc77663          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    800072e8:	00e50733          	add	a4,a0,a4
    800072ec:	00b70023          	sb	a1,0(a4)
    800072f0:	0027871b          	addiw	a4,a5,2
    800072f4:	0ac77e63          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    800072f8:	00e50733          	add	a4,a0,a4
    800072fc:	00b70023          	sb	a1,0(a4)
    80007300:	0037871b          	addiw	a4,a5,3
    80007304:	0ac77663          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007308:	00e50733          	add	a4,a0,a4
    8000730c:	00b70023          	sb	a1,0(a4)
    80007310:	0047871b          	addiw	a4,a5,4
    80007314:	08c77e63          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007318:	00e50733          	add	a4,a0,a4
    8000731c:	00b70023          	sb	a1,0(a4)
    80007320:	0057871b          	addiw	a4,a5,5
    80007324:	08c77663          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007328:	00e50733          	add	a4,a0,a4
    8000732c:	00b70023          	sb	a1,0(a4)
    80007330:	0067871b          	addiw	a4,a5,6
    80007334:	06c77e63          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007338:	00e50733          	add	a4,a0,a4
    8000733c:	00b70023          	sb	a1,0(a4)
    80007340:	0077871b          	addiw	a4,a5,7
    80007344:	06c77663          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007348:	00e50733          	add	a4,a0,a4
    8000734c:	00b70023          	sb	a1,0(a4)
    80007350:	0087871b          	addiw	a4,a5,8
    80007354:	04c77e63          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007358:	00e50733          	add	a4,a0,a4
    8000735c:	00b70023          	sb	a1,0(a4)
    80007360:	0097871b          	addiw	a4,a5,9
    80007364:	04c77663          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007368:	00e50733          	add	a4,a0,a4
    8000736c:	00b70023          	sb	a1,0(a4)
    80007370:	00a7871b          	addiw	a4,a5,10
    80007374:	02c77e63          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007378:	00e50733          	add	a4,a0,a4
    8000737c:	00b70023          	sb	a1,0(a4)
    80007380:	00b7871b          	addiw	a4,a5,11
    80007384:	02c77663          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007388:	00e50733          	add	a4,a0,a4
    8000738c:	00b70023          	sb	a1,0(a4)
    80007390:	00c7871b          	addiw	a4,a5,12
    80007394:	00c77e63          	bgeu	a4,a2,800073b0 <__memset+0x1c8>
    80007398:	00e50733          	add	a4,a0,a4
    8000739c:	00b70023          	sb	a1,0(a4)
    800073a0:	00d7879b          	addiw	a5,a5,13
    800073a4:	00c7f663          	bgeu	a5,a2,800073b0 <__memset+0x1c8>
    800073a8:	00f507b3          	add	a5,a0,a5
    800073ac:	00b78023          	sb	a1,0(a5)
    800073b0:	00813403          	ld	s0,8(sp)
    800073b4:	01010113          	addi	sp,sp,16
    800073b8:	00008067          	ret
    800073bc:	00b00693          	li	a3,11
    800073c0:	e55ff06f          	j	80007214 <__memset+0x2c>
    800073c4:	00300e93          	li	t4,3
    800073c8:	ea5ff06f          	j	8000726c <__memset+0x84>
    800073cc:	00100e93          	li	t4,1
    800073d0:	e9dff06f          	j	8000726c <__memset+0x84>
    800073d4:	00000e93          	li	t4,0
    800073d8:	e95ff06f          	j	8000726c <__memset+0x84>
    800073dc:	00000793          	li	a5,0
    800073e0:	ef9ff06f          	j	800072d8 <__memset+0xf0>
    800073e4:	00200e93          	li	t4,2
    800073e8:	e85ff06f          	j	8000726c <__memset+0x84>
    800073ec:	00400e93          	li	t4,4
    800073f0:	e7dff06f          	j	8000726c <__memset+0x84>
    800073f4:	00500e93          	li	t4,5
    800073f8:	e75ff06f          	j	8000726c <__memset+0x84>
    800073fc:	00600e93          	li	t4,6
    80007400:	e6dff06f          	j	8000726c <__memset+0x84>

0000000080007404 <__memmove>:
    80007404:	ff010113          	addi	sp,sp,-16
    80007408:	00813423          	sd	s0,8(sp)
    8000740c:	01010413          	addi	s0,sp,16
    80007410:	0e060863          	beqz	a2,80007500 <__memmove+0xfc>
    80007414:	fff6069b          	addiw	a3,a2,-1
    80007418:	0006881b          	sext.w	a6,a3
    8000741c:	0ea5e863          	bltu	a1,a0,8000750c <__memmove+0x108>
    80007420:	00758713          	addi	a4,a1,7
    80007424:	00a5e7b3          	or	a5,a1,a0
    80007428:	40a70733          	sub	a4,a4,a0
    8000742c:	0077f793          	andi	a5,a5,7
    80007430:	00f73713          	sltiu	a4,a4,15
    80007434:	00174713          	xori	a4,a4,1
    80007438:	0017b793          	seqz	a5,a5
    8000743c:	00e7f7b3          	and	a5,a5,a4
    80007440:	10078863          	beqz	a5,80007550 <__memmove+0x14c>
    80007444:	00900793          	li	a5,9
    80007448:	1107f463          	bgeu	a5,a6,80007550 <__memmove+0x14c>
    8000744c:	0036581b          	srliw	a6,a2,0x3
    80007450:	fff8081b          	addiw	a6,a6,-1
    80007454:	02081813          	slli	a6,a6,0x20
    80007458:	01d85893          	srli	a7,a6,0x1d
    8000745c:	00858813          	addi	a6,a1,8
    80007460:	00058793          	mv	a5,a1
    80007464:	00050713          	mv	a4,a0
    80007468:	01088833          	add	a6,a7,a6
    8000746c:	0007b883          	ld	a7,0(a5)
    80007470:	00878793          	addi	a5,a5,8
    80007474:	00870713          	addi	a4,a4,8
    80007478:	ff173c23          	sd	a7,-8(a4)
    8000747c:	ff0798e3          	bne	a5,a6,8000746c <__memmove+0x68>
    80007480:	ff867713          	andi	a4,a2,-8
    80007484:	02071793          	slli	a5,a4,0x20
    80007488:	0207d793          	srli	a5,a5,0x20
    8000748c:	00f585b3          	add	a1,a1,a5
    80007490:	40e686bb          	subw	a3,a3,a4
    80007494:	00f507b3          	add	a5,a0,a5
    80007498:	06e60463          	beq	a2,a4,80007500 <__memmove+0xfc>
    8000749c:	0005c703          	lbu	a4,0(a1)
    800074a0:	00e78023          	sb	a4,0(a5)
    800074a4:	04068e63          	beqz	a3,80007500 <__memmove+0xfc>
    800074a8:	0015c603          	lbu	a2,1(a1)
    800074ac:	00100713          	li	a4,1
    800074b0:	00c780a3          	sb	a2,1(a5)
    800074b4:	04e68663          	beq	a3,a4,80007500 <__memmove+0xfc>
    800074b8:	0025c603          	lbu	a2,2(a1)
    800074bc:	00200713          	li	a4,2
    800074c0:	00c78123          	sb	a2,2(a5)
    800074c4:	02e68e63          	beq	a3,a4,80007500 <__memmove+0xfc>
    800074c8:	0035c603          	lbu	a2,3(a1)
    800074cc:	00300713          	li	a4,3
    800074d0:	00c781a3          	sb	a2,3(a5)
    800074d4:	02e68663          	beq	a3,a4,80007500 <__memmove+0xfc>
    800074d8:	0045c603          	lbu	a2,4(a1)
    800074dc:	00400713          	li	a4,4
    800074e0:	00c78223          	sb	a2,4(a5)
    800074e4:	00e68e63          	beq	a3,a4,80007500 <__memmove+0xfc>
    800074e8:	0055c603          	lbu	a2,5(a1)
    800074ec:	00500713          	li	a4,5
    800074f0:	00c782a3          	sb	a2,5(a5)
    800074f4:	00e68663          	beq	a3,a4,80007500 <__memmove+0xfc>
    800074f8:	0065c703          	lbu	a4,6(a1)
    800074fc:	00e78323          	sb	a4,6(a5)
    80007500:	00813403          	ld	s0,8(sp)
    80007504:	01010113          	addi	sp,sp,16
    80007508:	00008067          	ret
    8000750c:	02061713          	slli	a4,a2,0x20
    80007510:	02075713          	srli	a4,a4,0x20
    80007514:	00e587b3          	add	a5,a1,a4
    80007518:	f0f574e3          	bgeu	a0,a5,80007420 <__memmove+0x1c>
    8000751c:	02069613          	slli	a2,a3,0x20
    80007520:	02065613          	srli	a2,a2,0x20
    80007524:	fff64613          	not	a2,a2
    80007528:	00e50733          	add	a4,a0,a4
    8000752c:	00c78633          	add	a2,a5,a2
    80007530:	fff7c683          	lbu	a3,-1(a5)
    80007534:	fff78793          	addi	a5,a5,-1
    80007538:	fff70713          	addi	a4,a4,-1
    8000753c:	00d70023          	sb	a3,0(a4)
    80007540:	fec798e3          	bne	a5,a2,80007530 <__memmove+0x12c>
    80007544:	00813403          	ld	s0,8(sp)
    80007548:	01010113          	addi	sp,sp,16
    8000754c:	00008067          	ret
    80007550:	02069713          	slli	a4,a3,0x20
    80007554:	02075713          	srli	a4,a4,0x20
    80007558:	00170713          	addi	a4,a4,1
    8000755c:	00e50733          	add	a4,a0,a4
    80007560:	00050793          	mv	a5,a0
    80007564:	0005c683          	lbu	a3,0(a1)
    80007568:	00178793          	addi	a5,a5,1
    8000756c:	00158593          	addi	a1,a1,1
    80007570:	fed78fa3          	sb	a3,-1(a5)
    80007574:	fee798e3          	bne	a5,a4,80007564 <__memmove+0x160>
    80007578:	f89ff06f          	j	80007500 <__memmove+0xfc>

000000008000757c <__putc>:
    8000757c:	fe010113          	addi	sp,sp,-32
    80007580:	00813823          	sd	s0,16(sp)
    80007584:	00113c23          	sd	ra,24(sp)
    80007588:	02010413          	addi	s0,sp,32
    8000758c:	00050793          	mv	a5,a0
    80007590:	fef40593          	addi	a1,s0,-17
    80007594:	00100613          	li	a2,1
    80007598:	00000513          	li	a0,0
    8000759c:	fef407a3          	sb	a5,-17(s0)
    800075a0:	fffff097          	auipc	ra,0xfffff
    800075a4:	b3c080e7          	jalr	-1220(ra) # 800060dc <console_write>
    800075a8:	01813083          	ld	ra,24(sp)
    800075ac:	01013403          	ld	s0,16(sp)
    800075b0:	02010113          	addi	sp,sp,32
    800075b4:	00008067          	ret

00000000800075b8 <__getc>:
    800075b8:	fe010113          	addi	sp,sp,-32
    800075bc:	00813823          	sd	s0,16(sp)
    800075c0:	00113c23          	sd	ra,24(sp)
    800075c4:	02010413          	addi	s0,sp,32
    800075c8:	fe840593          	addi	a1,s0,-24
    800075cc:	00100613          	li	a2,1
    800075d0:	00000513          	li	a0,0
    800075d4:	fffff097          	auipc	ra,0xfffff
    800075d8:	ae8080e7          	jalr	-1304(ra) # 800060bc <console_read>
    800075dc:	fe844503          	lbu	a0,-24(s0)
    800075e0:	01813083          	ld	ra,24(sp)
    800075e4:	01013403          	ld	s0,16(sp)
    800075e8:	02010113          	addi	sp,sp,32
    800075ec:	00008067          	ret

00000000800075f0 <console_handler>:
    800075f0:	fe010113          	addi	sp,sp,-32
    800075f4:	00813823          	sd	s0,16(sp)
    800075f8:	00113c23          	sd	ra,24(sp)
    800075fc:	00913423          	sd	s1,8(sp)
    80007600:	02010413          	addi	s0,sp,32
    80007604:	14202773          	csrr	a4,scause
    80007608:	100027f3          	csrr	a5,sstatus
    8000760c:	0027f793          	andi	a5,a5,2
    80007610:	06079e63          	bnez	a5,8000768c <console_handler+0x9c>
    80007614:	00074c63          	bltz	a4,8000762c <console_handler+0x3c>
    80007618:	01813083          	ld	ra,24(sp)
    8000761c:	01013403          	ld	s0,16(sp)
    80007620:	00813483          	ld	s1,8(sp)
    80007624:	02010113          	addi	sp,sp,32
    80007628:	00008067          	ret
    8000762c:	0ff77713          	andi	a4,a4,255
    80007630:	00900793          	li	a5,9
    80007634:	fef712e3          	bne	a4,a5,80007618 <console_handler+0x28>
    80007638:	ffffe097          	auipc	ra,0xffffe
    8000763c:	6dc080e7          	jalr	1756(ra) # 80005d14 <plic_claim>
    80007640:	00a00793          	li	a5,10
    80007644:	00050493          	mv	s1,a0
    80007648:	02f50c63          	beq	a0,a5,80007680 <console_handler+0x90>
    8000764c:	fc0506e3          	beqz	a0,80007618 <console_handler+0x28>
    80007650:	00050593          	mv	a1,a0
    80007654:	00001517          	auipc	a0,0x1
    80007658:	05450513          	addi	a0,a0,84 # 800086a8 <CONSOLE_STATUS+0x698>
    8000765c:	fffff097          	auipc	ra,0xfffff
    80007660:	afc080e7          	jalr	-1284(ra) # 80006158 <__printf>
    80007664:	01013403          	ld	s0,16(sp)
    80007668:	01813083          	ld	ra,24(sp)
    8000766c:	00048513          	mv	a0,s1
    80007670:	00813483          	ld	s1,8(sp)
    80007674:	02010113          	addi	sp,sp,32
    80007678:	ffffe317          	auipc	t1,0xffffe
    8000767c:	6d430067          	jr	1748(t1) # 80005d4c <plic_complete>
    80007680:	fffff097          	auipc	ra,0xfffff
    80007684:	3e0080e7          	jalr	992(ra) # 80006a60 <uartintr>
    80007688:	fddff06f          	j	80007664 <console_handler+0x74>
    8000768c:	00001517          	auipc	a0,0x1
    80007690:	11c50513          	addi	a0,a0,284 # 800087a8 <digits+0x78>
    80007694:	fffff097          	auipc	ra,0xfffff
    80007698:	a68080e7          	jalr	-1432(ra) # 800060fc <panic>
	...
