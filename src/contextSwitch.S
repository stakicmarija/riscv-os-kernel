
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    //a0 - &old->context
    //a1 - &running->context

    sd ra, 0 * 8(a0) //cuvam stari
    sd sp, 1 * 8(a0)

    ld ra, 0 * 8(a1) //loadujem novi
    ld sp, 1 * 8(a1)

    ret