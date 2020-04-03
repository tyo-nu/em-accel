function [solutions, complete_times] = ... 
    perturb_parent_Ksets(Network_Data, knockout, All_K, All_fractions, ...
    t_interval)

%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

n_Ksets = size(All_K,2);
n_rxns = length(Network_Data.rxns);
enz_enzComplex = Network_Data.enz_enzComplex;
n_metabs = size(Network_Data.S,1);
metab_index_old_to_new = ...
    Network_Data.conserved_model_info.metab_index_old_to_new;
rxn_ind_tmp = find(enz_enzComplex(:,knockout) ~=0);
rxn_ind_tmp2 = [knockout + n_metabs; rxn_ind_tmp];  

%%%%%%%%%%%%%%%%%%%%%%%%%% Preallocate Variables %%%%%%%%%%%%%%%%%%%%%%%%%%

solutions = zeros(n_rxns,n_Ksets);
complete_times = zeros(n_Ksets,1);

parfor x = 1:n_Ksets
    
    initial_conc_perturbed = [ones(n_metabs,1); All_fractions(:,x)];        % Initial concentration defined as 1 for all metabs and fractions specifically sampled with the kinetic parameter set  for enzyme complexes
    initial_conc_perturbed(rxn_ind_tmp2) = 0;                               % Set enzyme complex fractions associated with knocked out enzyme to 0
       
    new_initial_conc_perturbed = initial_conc_perturbed;                    % Reorder metabolite and enzyme fraction index to match conservation analysis results which sorts independent metabolites and then dependent metabolites (see model)
    new_initial_conc_perturbed(metab_index_old_to_new) = ...
        initial_conc_perturbed;
       
    [solutions(:,x), complete_times(x)] = calculate_rates(Network_Data, ... % Calculate new steady state after enzyme knockout perturbation; time to complete ODE integration is also recorded
        t_interval, All_K(:,x), new_initial_conc_perturbed);
    
end
         
end
