function y = calculate_Kset_fitness_medium(Experimental_Data, solutions,...
    knockouts, S)

%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

ref_fluxes = Experimental_Data.ref_fluxes;
flux_rxns = Experimental_Data.flux_rxns;
flux_KOs = Experimental_Data.flux_KOs;
CV = Experimental_Data.CV; 
weighted_rxn = Experimental_Data.weighted_rxn;

%%%%%%%%%%%%%%%%%%%% Calculate Parameter Set Fitness %%%%%%%%%%%%%%%%%%%%%%
    
y_iter = 0;
                
for m = 1:length(knockouts)
    
    perturbed_fluxes = solutions(:,m);
          
    if max(abs(S*perturbed_fluxes))>= 0.1
        y_iter = 10 + y_iter;                                               % Penalize parameter sets unable to predict mass-balanced perturbed steady state
               
    else
        predicted_flux = perturbed_fluxes(flux_rxns);                       % Select flux values specific to reactions included in fitness calculation from overall flux distribution
                      
        ref_flux = ref_fluxes(:,find(flux_KOs == knockouts(m))+1);          % Select experimentally observed fluxes of perturbed steady state from Experimental Data object
        weighted_rxn_flux = ref_flux(flux_rxns == weighted_rxn);            % Weighted rxn is net glucose uptake rxn
        n_refs = length(ref_flux);
        
        y_iter_next = 1/n_refs*sum(1./CV.*(abs(predicted_flux - ...         % Calculate parameter set fitness for perturbed state prediction
            ref_flux)./weighted_rxn_flux)); 
        y_iter = y_iter + y_iter_next;
               
    end
           
    y =  1/length(knockouts) * y_iter;                                      % Average fitness values for each perturbed state of the current parameter set
        
end   
    
end