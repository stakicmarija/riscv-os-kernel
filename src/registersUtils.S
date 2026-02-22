.global pushRegisters
.type pushRegisters, @function
pushRegisters:
    addi sp, sp, -256 //alociran prostor na steku
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 //makro direktiva za ponavljanje bloka koda za svaki element u listi
    sd x\index, \index * 8(sp) //store doubleword na adresu ukazanu sp
    .endr
    ret

.global popRegisters
.type popRegisters, @function
popRegisters:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31 //makro direktiva za ponavljanje bloka koda za svaki element u listi
    ld x\index, \index * 8(sp) //load doubleword na adresu ukazanu sp
    .endr
    addi sp, sp, 256
    ret