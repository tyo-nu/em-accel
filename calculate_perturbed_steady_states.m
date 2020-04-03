function [fvals, all_solutions, all_complete_times] = ... 
    calculate_perturbed_steady_states(Network_Data, Experimental_Data, ...
    knockouts, All_K, All_fractions, t_interval)
    
%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

model_size = Network_Data.model_size;
calculate_Kset_fitness = ...                                                % Indicate the correct fitness function file to see (specific to model size)
    str2func(strcat('calculate_Kset_fitness_',model_size));
       
nKOs = length(knockouts);
nKsets = size(All_K,2);

%%%%%%%%%%%%%%%%%%%%%%%%%% Preallocate Variables %%%%%%%%%%%%%%%%%%%%%%%%%%

fvals = zeros(nKsets,1);
solutions = zeros(size(Network_Data.S,2),nKOs);
all_solutions = cell(nKOs,1);
all_complete_times = zeros(nKsets, nKOs);


%%%%%%%%%%%%%% Calculate Perturbed Steady State for Ensemble %%%%%%%%%%%%%%

fprintf(1,'\n');
fprintf(1,'Calculate steady state flux results for entire ensemble of');
fprintf(1,' k-sets across all perturbations...');
fprintf(1,'\n');
    
for y = 1:nKOs
      
    fprintf(1,'\n');
       
    fprintf(1,'Starting KO %d out of %d: %s',y,nKOs, ... 
        Network_Data.rxns{knockouts(y)});
        
    fprintf(1,'\n');
        
    [all_solutions{y}, all_complete_times(:,y)] = ... 
        perturb_parent_Ksets(Network_Data, knockouts(y), All_K, ... 
        All_fractions, t_interval);

end
    
for x = 1:nKsets
       
    for y = 1:nKOs
            
        solutions(:,y) = all_solutions{y}(:,x);
        
    end
        
    fvals(x) = calculate_Kset_fitness(Experimental_Data, solutions, ...
        knockouts, Network_Data.S);
        
end
    
end