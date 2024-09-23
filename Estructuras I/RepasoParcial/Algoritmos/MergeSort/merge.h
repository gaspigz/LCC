#ifndef __MEGRE_H__
#define __MERGE_H__
#include "garray.h"

GArray merge(GArray array, int inicio, int mitad, int final, FuncionCopiadora copy, FuncionComparadora comp);

GArray merge_sort_aux(GArray array, FuncionComparadora comp, int inicio, int final, FuncionCopiadora copy);

GArray merge_sort(GArray array, int largo, FuncionComparadora comp, FuncionCopiadora copy);


#endif