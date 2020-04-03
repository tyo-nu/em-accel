/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mass_balance_ode_conserved.c
 *
 * Code generation for function 'mass_balance_ode_conserved'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "mass_balance_ode_conserved.h"
#include "error.h"
#include "mass_balance_ode_conserved_data.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 15, "mass_balance_ode_conserved",
  "C:\\Users\\Jennifer\\Box Sync\\Greene Jennifer\\EM Optimization Paper\\Scripts\\Scripts for Paper\\MATLAB Files\\mass_balance_ode_conserv"
  "ed.m" };

static emlrtRSInfo b_emlrtRSI = { 37, "mpower",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\ops\\mpower.m"
};

static emlrtRSInfo c_emlrtRSI = { 49, "power",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\ops\\power.m" };

static emlrtRSInfo d_emlrtRSI = { 61, "power",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\ops\\power.m" };

/* Function Definitions */
void mass_balance_ode_conserved(const emlrtStack *sp, real_T unusedU0, const
  real_T xi[12], const real_T kinetic_param[26], const real_T S_f_b[416], const
  real_T Sr[312], const real_T T[4], const real_T Lo[48], real_T dxi[12])
{
  real_T b_T[4];
  int32_T i0;
  real_T x[16];
  real_T b;
  int32_T i1;
  real_T v[26];
  int32_T j;
  int32_T i;
  boolean_T p;
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  (void)unusedU0;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;

  /*  Calculate dependent metabolite concentrations needed to calculate v */
  for (i0 = 0; i0 < 4; i0++) {
    b = 0.0;
    for (i1 = 0; i1 < 12; i1++) {
      b += Lo[i0 + (i1 << 2)] * xi[i1];
    }

    b_T[i0] = T[i0] + b;
  }

  memcpy(&x[0], &xi[0], 12U * sizeof(real_T));
  for (i0 = 0; i0 < 4; i0++) {
    x[i0 + 12] = b_T[i0];
  }

  /*  Combine independent and dependent metabolites into a single vector */
  /* %%%%%%%%%%%%%% Calculate v = k*prod(x^(substrate_stoich)) %%%%%%%%%%%%%%%% */
  memcpy(&v[0], &kinetic_param[0], 26U * sizeof(real_T));
  j = 0;
  while (j < 26) {
    i = 0;
    while (i < 16) {
      if (S_f_b[i + (j << 4)] < 0.0) {
        b = muDoubleScalarAbs(S_f_b[i + (j << 4)]);
        st.site = &emlrtRSI;
        b_st.site = &b_emlrtRSI;
        c_st.site = &c_emlrtRSI;
        p = false;
        if (x[i] < 0.0) {
          if (muDoubleScalarIsNaN(b) || (muDoubleScalarFloor(b) == b)) {
            p = true;
          } else {
            p = false;
          }

          p = !p;
        }

        if (p) {
          d_st.site = &d_emlrtRSI;
          error(&d_st);
        }

        v[j] *= muDoubleScalarPower(x[i], b);
      }

      i++;
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b(sp);
      }
    }

    j++;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  /* %%%%%%% Calculate change in independent metabolite concentration %%%%%%%%% */
  for (i0 = 0; i0 < 12; i0++) {
    dxi[i0] = 0.0;
    for (i1 = 0; i1 < 26; i1++) {
      dxi[i0] += Sr[i0 + 12 * i1] * v[i1];
    }
  }
}

/* End of code generation (mass_balance_ode_conserved.c) */
