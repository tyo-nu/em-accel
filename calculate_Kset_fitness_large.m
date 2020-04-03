function y = calculate_Kset_fitness_large(Experimental_Data, solutions, ...
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
    %%% literature data is weighted by glucose uptake rxn and
    %%% calculated as percentage
    %%% e.g.: glucose uptake is always 100 for each KO data set
    perturbed_fluxes = solutions(:,m);
            
    if max(abs(S*perturbed_fluxes))>= 0.1
        y_iter = 10 + y_iter;                                               % Penalize parameter sets unable to predict mass-balanced perturbed steady state
               
    else
        weighted_fluxes = perturbed_fluxes./perturbed_fluxes(27).*100;      % Convert predicted flux values to weighted flux values
        predicted_flux = weighted_fluxes(flux_rxns);                        % Select flux values specific to reactions included in fitness calculation from overall flux distribution
            
        %combined reference fluxes specific to literature data
        sucd_flux = weighted_fluxes(88) - weighted_fluxes(43);
        mdh_flux = weighted_fluxes(63) + weighted_fluxes(102);
        ppc_flux = weighted_fluxes(78) - weighted_fluxes(79);
        me_flux = weighted_fluxes(64) + weighted_fluxes(65);
        pfk_flux = weighted_fluxes(71) + weighted_fluxes(96) - ...
            weighted_fluxes(40) - weighted_fluxes(100);
        pyk_flux = weighted_fluxes(82) + weighted_fluxes(97) - ...
            weighted_fluxes(80);
            
        predicted_flux2 = [predicted_flux; sucd_flux; mdh_flux; ...
            ppc_flux; me_flux; pfk_flux; pyk_flux];
                      
        ref_flux = ref_fluxes(:,find(flux_KOs == knockouts(m))+1);          % Select experimentally observed fluxes of perturbed steady state from Experimental Data object
        weighted_rxn_flux = ref_flux(flux_rxns == weighted_rxn);            % Weighted rxn is net glucose uptake rxn
        n_refs = length(ref_flux);
        
        y_iter_next = 1/n_refs*sum(1./CV.*(abs(predicted_flux2 - ...        % Calculate parameter set fitness for perturbed state prediction
            ref_flux)./weighted_rxn_flux)); 
        y_iter = y_iter + y_iter_next;
              
    end
           
    y =  1/length(knockouts) * y_iter;                                      % Average fitness values for each perturbed state of the current parameter set
        
end   
    
end