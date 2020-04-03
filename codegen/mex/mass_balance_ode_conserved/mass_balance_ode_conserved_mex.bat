@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2016a
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2016a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=mass_balance_ode_conserved_small_mex
set MEX_NAME=mass_balance_ode_conserved_small_mex
set MEX_EXT=.mexw64
call "C:\PROGRA~1\MATLAB\R2016a\sys\lcc64\lcc64\mex\lcc64opts.bat"
echo # Make settings for mass_balance_ode_conserved > mass_balance_ode_conserved_mex.mki
echo COMPILER=%COMPILER%>> mass_balance_ode_conserved_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> mass_balance_ode_conserved_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> mass_balance_ode_conserved_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> mass_balance_ode_conserved_mex.mki
echo LINKER=%LINKER%>> mass_balance_ode_conserved_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> mass_balance_ode_conserved_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> mass_balance_ode_conserved_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> mass_balance_ode_conserved_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> mass_balance_ode_conserved_mex.mki
echo BORLAND=%BORLAND%>> mass_balance_ode_conserved_mex.mki
echo OMPFLAGS= >> mass_balance_ode_conserved_mex.mki
echo OMPLINKFLAGS= >> mass_balance_ode_conserved_mex.mki
echo EMC_COMPILER=lcc64>> mass_balance_ode_conserved_mex.mki
echo EMC_CONFIG=optim>> mass_balance_ode_conserved_mex.mki
"C:\Program Files\MATLAB\R2016a\bin\win64\gmake" -B -f mass_balance_ode_conserved_mex.mk
