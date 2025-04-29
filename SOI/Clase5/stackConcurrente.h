#ifndef STACK_CONCURRENTE_H
#define STACK_CONCURRENTE_H
#include "stackSinLimite.h"

struct StackC{
    struct StackNode* stack;
    pthread_mutex_t mutex;
};

void stackInitC(struct StackC* concurrentStack);

int isEmptyC(struct StackC* root);

void pushC(struct StackC* root, int data);

void popC(struct StackC* root);

void topC(struct StackC* root);

void stackFreeC(struct StackC* root);



#endif