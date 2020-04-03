READ ME

This repository provides all the code and notebooks used in [this paper](https://www.sciencedirect.com/science/article/pii/S0006349517308433), published at the Biophysical Journal.

Available Model Sizes:
- large
- medium
- small


1. Write elasticity coefficient and mass_balance_ODE_mex files specific to model size

zz_SET_UP('model_size')

ex: zz_SET_UP('small')

2. Open TEST_SCRIPT and Alter to input Model Size, Ensemble Size, and Screening Paramters


Portions of ensemble modeling code was adapted from MATLAB scripts provided by the Liao and Maranas groups:
1. Rizk, M. L., and J. C. Liao. 2009. Ensemble modeling and related mathematical modeling of metabolic networks. Journal of the Taiwan Institute of Chemical Engineers 40:595-601.
2. Tan, Y., J. G. Rivera, C. A. Contador, J. A. Asenjo, and J. C. Liao. 2011. Reducing the allowable kinetic space by constructing ensemble of dynamic models with the same steady-state flux. Metab. Eng. 13:60-75.
3. Khodayari, A., A. R. Zomorrodi, J. C. Liao, and C. D. Maranas. 2014. A kinetic model of Escherichia coli core metabolism satisfying multiple sets of mutant flux data. Metab. Eng. 25:50-62.