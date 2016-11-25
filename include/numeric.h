#pragma once

/**
Numeric operators for variables
*/
#include "variable.h"

//these functions return a new variable containing the result of the operation.
variable* variableNumericAdd(variable* v1, variable* v2);
variable* variableNumericSubtract(variable* v1, variable* v2);
variable* variableNumericMultiply(variable* v1, variable* v2);
variable* variableNumericDivide(variable* v1, variable* v2);
