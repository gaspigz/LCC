#include <pthread.h>
#include <stdlib.h>
#include "stackConcurrente.h"
#include "stackSinLimite.h"

void stackInitC(struct StackC* concurrentStack){
    concurrentStack->stack = NULL;
    pthread_mutex_init(&concurrentStack->mutex, NULL);
}

int isEmptyC(struct StackC* root){
    pthread_mutex_lock(&root->mutex);
    int res = isEmpty(root);
    pthread_mutex_unlock(&root->mutex);
    return res;
}

void pushC(struct StackC* root, int data){
    pthread_mutex_lock(&root->mutex);
    push(&root->stack, data);
    pthread_mutex_unlock(&root->mutex);
}

void popC(struct StackC* root){
    pthread_mutex_lock(&root->mutex);
    pop(&root->stack);
    pthread_mutex_unlock(&root->mutex);
}

void topC(struct StackC* root){
    pthread_mutex_lock(&root->mutex);
    top(&root->stack);
    pthread_mutex_unlock(&root->mutex);
}

void stackFreeC(struct StackC* root){
    pthread_mutex_lock(&root->mutex);
    stackFree(root->stack);
    pthread_mutex_unlock(&root->mutex);
}