/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_mass_balance_ode_conserved_info.c
 *
 * Code generation for function '_coder_mass_balance_ode_conserved_info'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "mass_balance_ode_conserved.h"
#include "_coder_mass_balance_ode_conserved_info.h"

/* Function Definitions */
mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xResult;
  mxArray *xEntryPoints;
  const char * fldNames[4] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs" };

  mxArray *xInputs;
  const char * b_fldNames[4] = { "Version", "ResolvedFunctions", "EntryPoints",
    "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 4, fldNames);
  xInputs = emlrtCreateLogicalMatrix(1, 7);
  emlrtSetField(xEntryPoints, 0, "Name", mxCreateString(
    "mass_balance_ode_conserved"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", mxCreateDoubleScalar(7.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", mxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  xResult = emlrtCreateStructMatrix(1, 1, 4, b_fldNames);
  emlrtSetField(xResult, 0, "Version", mxCreateString("9.0.0.341360 (R2016a)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  const char * data[16] = {
    "789ced5ccd6fdc44149fd0b42a42a52051a1f29980842895d62d4508f594b424cd5649b322499b1255aed73bce8e6acfac6ca7dd2084961ea0470e1cfa1fc001"
    "892be26f801b9cf9179090007162666def7a27ee8ee38fac933e4babddb73b6ffcbe7e7eef79c68ba6ea2b881fcff3d7e617089de0ef27f9eb19141cc7437a8a",
    "bfce85efc1f7d3e854483fe42f93511f77fde0476a381845478b39841ad45fdfed60e4628fd9f771abff8b456cbc4e1cbccc62c412e184b318fb6940889fdcb6"
    "379819d9712238841e3fa1a11ed3097a7c1dd3e38590de5ab873f5b2b6e161d7d3ae634a89855ded0aebceaced5253bbe6624cf1cce087859599d58e4f1cf299",
    "e11346671a46877fbb66baa4e37bd1fb8cc5dcf09795f9f5e5f92b3342114f730ccfd39b866d5013ebac85756e3b7e5e6e959ad3977f4921ff8b92fc82c68ead"
    "3b5c22ece96d6cf373c6ec7161cc7cd1119f2fe27ba490634de213f4567d79b36fca86cbb65dc309750e0ca07df2fe858b1f1a9acf98dd645d8d0badd9a4c92d",
    "e2db4653631d4fdba307b74924cf4731794e24c8331593e7d9817ebd0fb6cefe3e9f9d7f688f49f3bf1be39f4ae047b1f72ce31fa3f1fe36d0a8bf055d82bf67"
    "4de6388cea661b9bf7bc987c0d857c6f4af209dae400736b845f9c5c6ad835e25dd921b65fa737761cec12738f5f92e63d21cd2be816db69da381d4e3625fecd",
    "2c7613aff37d6db4f3913a9aac4ecdc91167bfbcfdeb6f809314e3ab765d54e58b972579042de1c233793e7217b60bc1434fc1df90f81b59ec938887488d5c38"
    "f8e1cf55c81769c6f75035fc3ca790e3942487a08947834ba62fcad2bdf62e23ee5725fed52cf610d7058b7471abc3b839b4113dc2fa3163dc5c843ae970c5bd",
    "2a5e4f4a72089a7816e169a57d10f17e5de2bf9ec50e7be23d903f4c7f10ef68f2f54e79f5ed30de672de27abe45d2f4016f48f2085ad44f7c5a9df7e436631d"
    "9dddc7ae65b307419791af4ffe4621cf5d89ef6e16fbc4eac1d05c63f4c953fff42e012ed28d57dd67fa0a8dfa5dd065fb7d76fc80c1cd2155bc4f85df0de59f",
    "eee78e82fa0d425bb85ba77e5f8eae62be4569bec5ac7694f288c821903fcac7c9a4fd3ba7387fdafe60bf7831db860b7d417054811ff2c1f87c90a51fe0533b"
    "46b75c7c14d6474476b3f9072d90bc803e02eaa594e39f567c107a58f14128e063c85f363e1ea1f17e3ee83e3b6b7f90f7bed2a4eb45a893261be707bd7ea6ba",
    "9f74569247d0523fdbb40dafd6ddc68e13d333ebf5fe40ec93781d382ff4d0fa7ae4df77f1de7f0f010f95c1c33efcadc2c32b923c824ec203a136a178a86759"
    "fb90d625bef582ed13e8111828473cfdfcdc97b0bfe228e221c5bea33e1e763cacbbd8129f4b5d6fb82df1dd2ed83e313d6af17c07b8281717aafd79261af5bb",
    "a04bc0c56c138bfed86fbbd86b33bb35904f8593d725f9049d8493f8cc65d651b724796e156caf811ef9eebf023e528eaf5ade5852c803fbf2f61547b02f2fe5"
    "f8aae14095175e93e411b48483a8dc18b4d865e6859b923c378bb34fa8c7d04439faebef1edf033ca4197fd49f073a23c92f68093f36a6db7e1be5ebc37b0a39",
    "6e487c822e063781f839f1f2e3f165c0cbd38017555e383622ff316434bd42ea2bd5bac535895fd0f9d6e9ac1daa71e973f517bd8f6fbf03b848337ed2fe85e7"
    "dfe0f937c04121eb7541435a1357fea15e957e4e3ab99f08f4086d13c993310f9cf9e332e481c310ff9b8af3bf259d5fd052fc1b9d8ebdbbd60f9ec51d6a8a22",
    "6ca8df9c62fed3d2fc82b6c259f4b6415b3c31a459a7d892e6d9ca62a7445c24a8971f1fa7ffbd04f84833beaa7e2f2b6f945d3f41fe385af838ecfd75967877"
    "3aec419e7db4fbe9b397247e41e7dd3f16c89febb93af81f9a94e327ed5fe8b3a1cf061c64fd7f013e994bba07b15ebd2cf12fe7d43f7cee21d420f77e3f78ee",
    "21e5f8aac7f971e9fc820ecb9943b96e20f40fd5cf53ef7fff5703e2bb88f82edbbf50cf403d53051cf4d0787f17b2ff2c1907b396edf73fa6d94f01fbf2f615"
    "3fb02f2fe5f81eaa46fcc3fa01ac1f54192755f5bbaa8e7a55924bd0097903773bf3b6cdcc447f94514795f77c5c5c9ddcfdb206fd72baf155f37701f9243ef1",
    "0d7635f84fbe247f64c1c7e4ae27096ae5cf23df7e3e0d3829228f7c8a46fd2ee8a2eaada0b2d62d9b19be1edd2c42f05c10f41f4fe69f341eeea0513f0bbae8"
    "fe436f31c72054c7aecbd2de3f4dbaff4a3c6ad094fc79e3bf2ef1d773da255a67e01a14f1fc34ac33a41cdf43d5f033dc8f85fbb155c0c351ca07bcd04acd5f",
    "bd7c20f6f7f63528221f2cc0f33c55cd07c97e867c00f900f03094a3a0fbac865b8bb242b9cff76c487c1b59ec32767ff6d04639ee1bd5a04f385c38b8ab90e3"
    "9c2487a0d5eb7475dab00d13c7ce33a7384fdaf5bac78a799ad23ccd2c764bbb6e13aa59c0ff17fffd0facdba51a5f75ff979557caaeb320bf1c2d9cf4d0787f",
    "57651fd44b921c8296f010b5edcafa6a0a3df9ff9854f65891e458c9628fc4f8ef8b9f37ee770986b8578dff1fd459e898",
    "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(data, 32360U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/* End of code generation (_coder_mass_balance_ode_conserved_info.c) */
