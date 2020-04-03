/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mass_balance_ode_conserved_terminate.c
 *
 * Code generation for function 'mass_balance_ode_conserved_terminate'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "mass_balance_ode_conserved.h"
#include "mass_balance_ode_conserved_terminate.h"
#include "_coder_mass_balance_ode_conserved_mex.h"
#include "mass_balance_ode_conserved_data.h"

/* Function Definitions */
void mass_balance_ode_conserved_atexit(void)
{
  emlrtStack st = { NULL, NULL, NULL };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

void mass_balance_ode_conserved_terminate(void)
{
  emlrtStack st = { NULL, NULL, NULL };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (mass_balance_ode_conserved_terminate.c) */
