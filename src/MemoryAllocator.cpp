#include "../h/MemoryAllocator.hpp"

BlockHeader* MemoryAllocator::freeHead = nullptr;
BlockHeader* MemoryAllocator::allocHead = nullptr;

void MemoryAllocator::init() {
    uint64 start = ((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1); //poravnanje
    freeHead = (BlockHeader*)start;
    freeHead->size = ((uint64)HEAP_END_ADDR - start) / MEM_BLOCK_SIZE - HEADER_BLOCKS; //u blokovima
    freeHead->next = nullptr;
    freeHead->prev = nullptr;
    freeHead->isFree = true;
}

void* MemoryAllocator::mem_alloc(size_t size) {
    if(!size || !freeHead) return nullptr;
    if(size > ((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR)) return nullptr;

    size_t totalBlocks = size + HEADER_BLOCKS;
    BlockHeader* curr = freeHead;
    BlockHeader* allocatedBlock = nullptr; //blok koji alociram

    while(curr) {
        if(curr->isFree && curr->size >= totalBlocks) {
            allocatedBlock = curr;

            if(curr->size == totalBlocks) { //tacno odgovara
                //izbacivanje iz slobodnih
                if(curr->prev) curr->prev->next = curr->next;
                else freeHead = curr->next;
                if(curr->next) curr->next->prev = curr->prev;
            }
            else {
                //deljenje bloka
                BlockHeader* free = (BlockHeader*)((char*)curr + totalBlocks * MEM_BLOCK_SIZE);
                free->size = curr->size - totalBlocks;
                free->isFree = true;

                free->next = curr->next;
                free->prev = curr->prev;
                if(curr->prev) curr->prev->next = free;
                else freeHead = free;
                if(curr->next) curr->next->prev = free;

                allocatedBlock->size = size;
            }

            allocatedBlock->isFree = false;
            allocatedBlock->next = nullptr;
            allocatedBlock->prev = nullptr;
            break;
        }
        curr = curr->next;
    }

    if(!allocatedBlock) return nullptr; //nismo nasli odg blok

    //ubacivanje u listu slobodnih, po adr
    if(!allocHead || allocatedBlock < allocHead) {
        allocatedBlock->next = allocHead;
        allocatedBlock->prev = nullptr;
        if(allocHead) allocHead->prev = allocatedBlock;
        allocHead = allocatedBlock;
    } else {
        BlockHeader* tmp = allocHead;
        while(tmp->next && tmp->next < allocatedBlock) tmp = tmp->next;
        allocatedBlock->next = tmp->next;
        allocatedBlock->prev = tmp;
        if(tmp->next) tmp->next->prev = allocatedBlock;
        tmp->next = allocatedBlock;
    }

    return (char*)allocatedBlock + MEM_BLOCK_SIZE;
}

int MemoryAllocator::mem_free(void* addr) {
    if(!addr) return -1;
    if(addr < HEAP_START_ADDR || addr >= HEAP_END_ADDR) return -2;

    BlockHeader* block = (BlockHeader*)((char*)addr - MEM_BLOCK_SIZE);
    if (block < allocHead) return -3;

    bool isAllocated = false;
    BlockHeader* tmp = allocHead;
    while(tmp) {
        if(tmp == block && !block->isFree) {  //proveram jel blok sa datom addr bio alociran
            isAllocated = true;
            break;
        }
        tmp = tmp->next;
    }
    if(!isAllocated) return -3;

    if(block->prev) block->prev->next = block->next;
    else allocHead = block->next;
    if(block->next) block->next->prev = block->prev;

    block->isFree = true;

    if(!freeHead || block < freeHead) { //ubacujem u listu slobodnih po adr
        block->next = freeHead;
        block->prev = nullptr;
        if(freeHead) freeHead->prev = block;
        freeHead = block;
    } else {
        BlockHeader* curr = freeHead;
        while(curr->next && curr->next < block) curr = curr->next;
        block->next = curr->next;
        block->prev = curr;
        if(curr->next) curr->next->prev = block;
        curr->next = block;
    }

    tryToJoin(block); //pokusavam spajanje
    if(block->prev) tryToJoin(block->prev);

    return 0;
}

void MemoryAllocator::tryToJoin(BlockHeader* block) {
    if(!block || !block->isFree) return;

    if(block->next && block->next->isFree && (char*)block + (block->size + HEADER_BLOCKS) * MEM_BLOCK_SIZE == (char*)block->next) {
        block->size += block->next->size + HEADER_BLOCKS;
        block->next = block->next->next;
        if(block->next) block->next->prev = block;
    }

    if(block->prev && block->prev->isFree && (char*)block->prev + (block->prev->size + HEADER_BLOCKS) * MEM_BLOCK_SIZE == (char*)block) {
        block->prev->size += block->size + HEADER_BLOCKS;
        block->prev->next = block->next;
        if(block->next) block->next->prev = block->prev;
    }
}