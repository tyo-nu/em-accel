function [models2keep, solutions, fvals, All_solutions, All_complete_times] = ...
    screen_models(Network_Data, Experimental_Data, All_K, All_fractions, ...
    knockout, t_interval, screen_fval_threshold)

%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

calculate_Kset_fitness = str2func(strcat('calculate_Kset_fitness_', ...
    Network_Data.model_size));
    
S = Network_Data.S;
nmodels = size(All_K,2);    

fvals = zeros(nmodels,1);                                                   % Preallocate fvals vector

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Screen Models %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[All_solutions, All_complete_times] = perturb_parent_Ksets(Network_Data,... % Calculate perturbed steady state flux distribution after knocking out enzyme for each parameter set
        knockout, All_K, All_fractions, t_interval);  
           
for i = 1:nmodels
    
    fvals(i) = calculate_Kset_fitness(Experimental_Data,...                 % Calculate fitness value for each parameter set prediction of the knockout steady state flux distribution
        All_solutions(:,i), knockout, S);
        
end
    
models2keep = find(fvals <= screen_fval_threshold);                         % Keep models with fitness value less than or equal to provided threshold value
    
solutions = All_solutions(:,models2keep);

end
