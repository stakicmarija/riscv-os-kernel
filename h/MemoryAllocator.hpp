#ifndef MEMORYALLOCATOR_H
#define MEMORYALLOCATOR_H
#include "../lib/hw.h"

struct BlockHeader{
    size_t size; //velicina u blokovima
    BlockHeader *next, *prev;
    bool isFree;
};


class MemoryAllocator{
private:
    MemoryAllocator() {}
public:
    static BlockHeader *freeHead; //lista slobodnih fragmenata
    static BlockHeader *allocHead; //lista zauzetih frag
    static void init();
    static void* mem_alloc(size_t size);
    static int mem_free(void *addr);
    static void tryToJoin(BlockHeader* block);
    static constexpr size_t HEADER_BLOCKS = (sizeof(BlockHeader) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE; //koliko blokova header

};



#endif //MEMORYALLOCATOR_H
