#ifndef ROBOT_H
#define ROBOT_H

#include <stdio.h>
#include <stdlib.h>
#include "structures.h"

Robot *robot_crear(Grid *grid);

int robot_finalizo(Robot *robot);

#endif