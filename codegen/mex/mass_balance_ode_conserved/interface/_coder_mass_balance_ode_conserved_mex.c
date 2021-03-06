/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_mass_balance_ode_conserved_mex.c
 *
 * Code generation for function '_coder_mass_balance_ode_conserved_mex'
 *
 */

/* Include files */
#include "mass_balance_ode_conserved.h"
#include "_coder_mass_balance_ode_conserved_mex.h"
#include "mass_balance_ode_conserved_terminate.h"
#include "_coder_mass_balance_ode_conserved_api.h"
#include "mass_balance_ode_conserved_initialize.h"
#include "mass_balance_ode_conserved_data.h"

/* Function Declarations */
static void c_mass_balance_ode_conserved_me(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[7]);

/* Function Definitions */
static void c_mass_balance_ode_conserved_me(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[7])
{
  int32_T n;
  const mxArray *inputs[7];
  const mxArray *outputs[1];
  int32_T b_nlhs;
  emlrtStack st = { NULL, NULL, NULL };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 7) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 7, 4,
                        26, "mass_balance_ode_conserved");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 26,
                        "mass_balance_ode_conserved");
  }

  /* Temporary copy for mex inputs. */
  for (n = 0; n < nrhs; n++) {
    inputs[n] = prhs[n];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(&st);
    }
  }

  /* Call the function. */
  mass_balance_ode_conserved_api(inputs, outputs);

  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }

  emlrtReturnArrays(b_nlhs, plhs, outputs);

  /* Module termination. */
  mass_balance_ode_conserved_terminate();
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(mass_balance_ode_conserved_atexit);

  /* Initialize the memory manager. */
  /* Module initialization. */
  mass_balance_ode_conserved_initialize();

  /* Dispatch the entry-point. */
  c_mass_balance_ode_conserved_me(nlhs, plhs, nrhs, prhs);
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_mass_balance_ode_conserved_mex.c) */
