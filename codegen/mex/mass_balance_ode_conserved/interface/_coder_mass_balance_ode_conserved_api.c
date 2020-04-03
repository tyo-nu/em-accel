/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_mass_balance_ode_conserved_api.c
 *
 * Code generation for function '_coder_mass_balance_ode_conserved_api'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "mass_balance_ode_conserved.h"
#include "_coder_mass_balance_ode_conserved_api.h"
#include "mass_balance_ode_conserved_data.h"

/* Function Declarations */
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId);
static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *xi,
  const char_T *identifier))[12];
static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[12];
static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *kinetic_param, const char_T *identifier))[26];
static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *unusedU0,
  const char_T *identifier);
static const mxArray *emlrt_marshallOut(const real_T u[12]);
static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[26];
static real_T (*g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *S_f_b,
  const char_T *identifier))[416];
static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[416];
static real_T (*i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *Sr,
  const char_T *identifier))[312];
static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[312];
static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *T, const
  char_T *identifier))[4];
static real_T (*l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[4];
static real_T (*m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *Lo,
  const char_T *identifier))[48];
static real_T (*n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[48];
static real_T o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId);
static real_T (*p_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[12];
static real_T (*q_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[26];
static real_T (*r_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[416];
static real_T (*s_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[312];
static real_T (*t_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[4];
static real_T (*u_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[48];

/* Function Definitions */
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = o_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *xi,
  const char_T *identifier))[12]
{
  real_T (*y)[12];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(sp, emlrtAlias(xi), &thisId);
  emlrtDestroyArray(&xi);
  return y;
}
  static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
  const emlrtMsgIdentifier *parentId))[12]
{
  real_T (*y)[12];
  y = p_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *kinetic_param, const char_T *identifier))[26]
{
  real_T (*y)[26];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = f_emlrt_marshallIn(sp, emlrtAlias(kinetic_param), &thisId);
  emlrtDestroyArray(&kinetic_param);
  return y;
}
  static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *unusedU0,
  const char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(sp, emlrtAlias(unusedU0), &thisId);
  emlrtDestroyArray(&unusedU0);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u[12])
{
  const mxArray *y;
  const mxArray *m0;
  static const int32_T iv0[1] = { 0 };

  static const int32_T iv1[1] = { 12 };

  y = NULL;
  m0 = emlrtCreateNumericArray(1, iv0, mxDOUBLE_CLASS, mxREAL);
  mxSetData((mxArray *)m0, (void *)u);
  emlrtSetDimensions((mxArray *)m0, iv1, 1);
  emlrtAssign(&y, m0);
  return y;
}

static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[26]
{
  real_T (*y)[26];
  y = q_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static real_T (*g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *S_f_b,
  const char_T *identifier))[416]
{
  real_T (*y)[416];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = h_emlrt_marshallIn(sp, emlrtAlias(S_f_b), &thisId);
  emlrtDestroyArray(&S_f_b);
  return y;
}

static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[416]
{
  real_T (*y)[416];
  y = r_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static real_T (*i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *Sr,
  const char_T *identifier))[312]
{
  real_T (*y)[312];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = j_emlrt_marshallIn(sp, emlrtAlias(Sr), &thisId);
  emlrtDestroyArray(&Sr);
  return y;
}

static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[312]
{
  real_T (*y)[312];
  y = s_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *T,
  const char_T *identifier))[4]
{
  real_T (*y)[4];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = l_emlrt_marshallIn(sp, emlrtAlias(T), &thisId);
  emlrtDestroyArray(&T);
  return y;
}

static real_T (*l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[4]
{
  real_T (*y)[4];
  y = t_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static real_T (*m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *Lo,
  const char_T *identifier))[48]
{
  real_T (*y)[48];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = n_emlrt_marshallIn(sp, emlrtAlias(Lo), &thisId);
  emlrtDestroyArray(&Lo);
  return y;
}

static real_T (*n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[48]
{
  real_T (*y)[48];
  y = u_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static real_T o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId)
{
  real_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 0U, &dims);
  ret = *(real_T *)mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*p_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[12]
{
  real_T (*ret)[12];
  static const int32_T dims[1] = { 12 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 1U, dims);
  ret = (real_T (*)[12])mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
  static real_T (*q_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[26]
{
  real_T (*ret)[26];
  static const int32_T dims[1] = { 26 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 1U, dims);
  ret = (real_T (*)[26])mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*r_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[416]
{
  real_T (*ret)[416];
  static const int32_T dims[2] = { 16, 26 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  ret = (real_T (*)[416])mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
  static real_T (*s_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[312]
{
  real_T (*ret)[312];
  static const int32_T dims[2] = { 12, 26 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  ret = (real_T (*)[312])mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*t_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[4]
{
  real_T (*ret)[4];
  static const int32_T dims[1] = { 4 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 1U, dims);
  ret = (real_T (*)[4])mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
  static real_T (*u_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[48]
{
  real_T (*ret)[48];
  static const int32_T dims[2] = { 4, 12 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  ret = (real_T (*)[48])mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

void mass_balance_ode_conserved_api(const mxArray * const prhs[7], const mxArray
  *plhs[1])
{
  real_T (*dxi)[12];
  real_T unusedU0;
  real_T (*xi)[12];
  real_T (*kinetic_param)[26];
  real_T (*S_f_b)[416];
  real_T (*Sr)[312];
  real_T (*T)[4];
  real_T (*Lo)[48];
  emlrtStack st = { NULL, NULL, NULL };

  st.tls = emlrtRootTLSGlobal;
  dxi = (real_T (*)[12])mxMalloc(sizeof(real_T [12]));

  /* Marshall function inputs */
  unusedU0 = emlrt_marshallIn(&st, emlrtAliasP(prhs[0]), "unusedU0");
  xi = c_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "xi");
  kinetic_param = e_emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "kinetic_param");
  S_f_b = g_emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "S_f_b");
  Sr = i_emlrt_marshallIn(&st, emlrtAlias(prhs[4]), "Sr");
  T = k_emlrt_marshallIn(&st, emlrtAlias(prhs[5]), "T");
  Lo = m_emlrt_marshallIn(&st, emlrtAlias(prhs[6]), "Lo");

  /* Invoke the target function */
  mass_balance_ode_conserved(&st, unusedU0, *xi, *kinetic_param, *S_f_b, *Sr, *T,
    *Lo, *dxi);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(*dxi);
}

/* End of code generation (_coder_mass_balance_ode_conserved_api.c) */
