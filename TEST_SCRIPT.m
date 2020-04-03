%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% KINETIC ENSEMBLE MODELING %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Portions of code adapted from scripts provided by Liao & Maranas groups:
% 1. Rizk, M. L., and J. C. Liao. 2009. Ensemble modeling and related 
%  mathematical modeling of metabolic networks. Journal of the Taiwan 
%  Institute of Chemical Engineers 40:595-601.
% 2. Tan, Y., J. G. Rivera, C. A. Contador, J. A. Asenjo, and J. C. Liao.
%  2011. Reducing the allowable kinetic space by constructing ensemble of 
%  dynamic models with the same steady-state flux. Metab. Eng. 13:60-75.
% 3. Khodayari, A., A. R. Zomorrodi, J. C. Liao, and C. D. Maranas. 2014.
%  A kinetic model of Escherichia coli core metabolism satisfying multiple
%  sets of mutant flux data. Metab. Eng. 25:50-62.

tic                                                                         % used to record calculation times                        

rng('default')                                                              % initializes random no. generator so results are reproducible

load small_model                                                            % INPUT model file to load
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%   SET THESE PARAMETERS PlEASE  %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% SET RUN PARAMETERS
generate_Ksets = 1;                                                         % 1-generate new parameter sets; 0-use if wanting to screen previously generated parameter sets           
n_Ksets = 1;                                                              % INPUT number of parameter sets to generate             
screening_knockouts = [2];                                                  % INPUT knockouts to screen against        
post_screen_knockouts = [2 3];                                              % INPUT knockouts you want to use to evaluate remaining ensemble fitness 

check_local_stability = 1;                                                  % 1-keep only sampled parameter sets that are locally stable; 0-do not screen for local stability

screen_TS = 0;                                                              % 1-screen ensemble of parameter sets against knockouts in the ordered defined by screening_knockouts above; 0-do not screen parameter sets
if screen_TS
    screen_fval_thresholds = 0.1*ones(2,1);                                 % INPUT vector of threshold values for each knockout in order defined by screening_knockouts above  
end 

save_results = 0;                                                           % 1-save results as matlab file; 0-do not save results
    file_save_name = 'test_1_';                                             % INPUT desired name of results file

t_interval = 0:1e4;                                                         % INPUT - time interval for ODE integration

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% BEGIN CODE TO GENERATE ENSEMBLE OF WT REF MODELS %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if generate_Ksets
    [All_K, All_Rref, All_fractions, All_v_ik, count] = ...                          
        initial_ensemble_generation(model, n_Ksets, ...
        check_local_stability); 
    time_elapsed_parameter_set_generation = toc                             % Prints time elapsed to generate parameter sets to command window 
end

if save_results
    save(strcat(file_save_name,'a')) 
end

% All_K = matrix containing sampled elementary kinetic parameters sets
% All_Rref = matrix containing sampled reversibilities
% All_fractions = matrix containing sampled enzyme fractions
% count = number of parameter sets sampled to generate n_Ksets; should
%   equal n_Ksets if not checking for local stability

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% BEGIN CODE TO SCREEN ENSEMBLE USING TRADITIONAL SCREEN %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if screen_TS
    [all_models2keep, fvals_post_TS_screen, ...
        all_solutions_post_TS_screen, TS_solve_times, avg_final_fitness,...
        all_screen_times,All_K_post_screen, All_fractions_post_screen] =...
        traditional_ensemble_screen(model, Experimental_Data,...
        t_interval, screening_knockouts, All_K, All_fractions, ...
        save_results, file_save_name, screen_fval_thresholds, ...
        post_screen_knockouts);
    time_elapsed_traditional_screen = toc                                   % Prints time elapsed to screen parameter sets to command window
end

if save_results
    save(strcat(file_save_name,'c'))
end

% all_models2keep = cell containing the parameter sets kept after each
%   screening round
% fvals_post_TS_screen = vector of fitness values of each remaining
%   parameter set in the ensemble
% all_solutions_post_TS_screen = cell containing flux distributions for
%   each remaining parameter set for all knockouts defined in 
%   post_screen_knockouts
% TS_solve_times = total time elapsed after each KO screening step defined
%   in screening_knockouts
% avg_final_fitness = average fitness across all knockouts defined in
%   post_screen_knockouts after averaging the flux distributions of each
%   remaining parameter for a given perturbed state
% total_compute_time = total time required to screen against each KO
%   defined in screening_knockouts
% all_screen_times = cell containing computation time required to perturb
%   each remaining knockout against each specified knockout defined in
%   screening_knockouts
% All_K_post_screen = kinetic parameters remaining after screen
% All_fractions_post_screen = respective fractions remaining after screen