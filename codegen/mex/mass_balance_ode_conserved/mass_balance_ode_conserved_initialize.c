/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mass_balance_ode_conserved_initialize.c
 *
 * Code generation for function 'mass_balance_ode_conserved_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "mass_balance_ode_conserved.h"
#include "mass_balance_ode_conserved_initialize.h"
#include "_coder_mass_balance_ode_conserved_mex.h"
#include "mass_balance_ode_conserved_data.h"

/* Function Definitions */
void mass_balance_ode_conserved_initialize(void)
{
  emlrtStack st = { NULL, NULL, NULL };

  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (mass_balance_ode_conserved_initialize.c) */
