/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mass_balance_ode_conserved.h
 *
 * Code generation for function 'mass_balance_ode_conserved'
 *
 */

#ifndef MASS_BALANCE_ODE_CONSERVED_H
#define MASS_BALANCE_ODE_CONSERVED_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "mass_balance_ode_conserved_types.h"

/* Function Declarations */
extern void mass_balance_ode_conserved(const emlrtStack *sp, real_T unusedU0,
  const real_T xi[12], const real_T kinetic_param[26], const real_T S_f_b[416],
  const real_T Sr[312], const real_T T[4], const real_T Lo[48], real_T dxi[12]);

#endif

/* End of code generation (mass_balance_ode_conserved.h) */
