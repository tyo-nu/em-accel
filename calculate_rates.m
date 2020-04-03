function [Vnet, complete_time, conc, t, vuni] = ...
    calculate_rates(Network_Data, t_interval, K, initial_conc)

%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

v_indices = Network_Data.rxn_indices;
n_rxns = size(Network_Data.S,2); 
S_f_b_conserved = Network_Data.conserved_model_info.S_f_b_conserved;
S_f_b = Network_Data.S_f_b;
n_rev_rxns = sum(Network_Data.rxn_type == 1);
export_rxns = find(Network_Data.rxn_type == 2);
Sr = Network_Data.conserved_model_info.Sr;
Lo = Network_Data.conserved_model_info.Lo;
L = Network_Data.conserved_model_info.L;
metab_index_new_to_old = ...
    Network_Data.conserved_model_info.metab_index_new_to_old;
n_independent_metabs = size(Sr,1);
model_size = Network_Data.model_size;
elasticity_coeff = str2func(strcat('elasticity_coeff_',model_size));
mass_balance_ode_conserved_mex = str2func(strcat(...
    'mass_balance_ode_conserved_',model_size,'_mex'));
       
T = initial_conc((n_independent_metabs+1):end) - ...
    Lo*initial_conc(1:n_independent_metabs);
    
A = sparse(S_f_b);                                                          % A matrix is substrate only version of S_f_b matrix
A(A > 0) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Integrate ODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

try

    a = tic;        
       
    if strcmp(model_size, 'large')
        options=odeset('Jacobian',@(t,x)jacobian(t,x,K,Sr,L,T,Lo,...        % Define Jacobian script and event function for large model ODE integration
            elasticity_coeff),'Events',@(t,x)event_function_conserved(...
            t,x,a,K,S_f_b_conserved,Sr,T,Lo, ...
            mass_balance_ode_conserved_mex));

    else                                                                    % Define Jacobian script and event function for small and medium model ODE integration
        options=odeset('Jacobian',@(t,x)jacobian(t,x,K,Sr,L,T,Lo,...
            elasticity_coeff));
    end
        
    [t, conci] = ode15s(@(t,x)mass_balance_ode_conserved_mex(t,x,K,...      % Integrate ODE to calculate concentration vs time data of independent metabolites and enzyme fractions
        S_f_b_conserved,Sr,T,Lo),t_interval,...
        initial_conc(1:n_independent_metabs),options);
        
    complete_time = toc(a);        
              
    if isreal(conci)          
            
        concd = repmat(T,1,size(Lo*conci',2)) + Lo*conci';                  % Calculate dependent metabolite and enzyme fraction concentrations from independent values
        conc = [conci concd'];
            
        conc(:,metab_index_new_to_old) = conc;                              % Reorder metabolite and enzyme fraction index to match original order (see model)
            
        xs = repmat(conc(end,:)',1,length(K));                              % Calculate elementary reaction fluxes from concentrations
        psub = prod(xs.^abs(A));
        vuni = diag(K*psub);
            
        vnet = zeros(n_rxns,length(t));                                     % Preallocate vnet vector
        
        for w = 1:n_rev_rxns
            vnet(w,:) = vuni(v_indices(w,1),:) - vuni(v_indices(w,1)+1,:);  % Calculate net reaction fluxes from elementary flux values
        end
            
        for m = 1:length(export_rxns)                                       % Calculate net reaction for exchange reactions
            vnet(export_rxns(m),:) = vuni(v_indices(export_rxns(m),1));
        end
            
    else
        vnet = zeros(n_rxns,1);
    end
           
    Vnet = vnet(:,end);                                                     % Pass the final steady state flux values of the perturbed state
        
catch 
        
    fprintf('\nError in integration. Assigning Vnet to 1000');              % If integration fails, Vnet set to 1000 so screening will continue but parameter set solution will not pass mass balance during fitness calculation
    fprintf(' for all rxns\n');
    Vnet = 1000*ones(n_rxns,1);

end   
                
    
end
