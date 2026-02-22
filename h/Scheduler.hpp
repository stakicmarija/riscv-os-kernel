//
// Created by os on 8/4/25.
//

#ifndef SCHEDULER_H
#define SCHEDULER_H

#include "list.hpp"
class TCB;

class Scheduler {
private:
	static List<TCB> threadQueue;

public:
	static TCB* get();
	static void put(TCB* tcb);

};


#endif //SCHEDULER_H
