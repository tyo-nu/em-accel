function [fractions] = sample_enzyme_fractions(Network_Data)

%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

n_metabs = size(Network_Data.S,1);
[n_metabs_and_enz_complexes, n_rev_rxns] = ...
    size(Network_Data.enz_enzComplex);
enz_complex_indices = Network_Data.enz_enzComplex(n_metabs+1:end,:);

%%%%%%%%%%%%%%%%%%%%%% Sample enzyme fractions, Eij %%%%%%%%%%%%%%%%%%%%%%%
    
fractions = rand(n_metabs_and_enz_complexes - n_metabs,1);                  % sample random values between 0 and 1 for each enzyme fraction
    
for i = 1:n_rev_rxns
    
    rxn_ind_tmp = find(enz_complex_indices(:,i) ~=0);                       % identify all enzyme fractions associated with each enzyme
    rxn_ind_tmp2 = [i; rxn_ind_tmp];
    
    rxn_frac_tmp = ...                                                      % normalize fraction values for all fractions associated with one enzyme sum to 1
        fractions(rxn_ind_tmp2,1)./sum(fractions(rxn_ind_tmp2,1));
    
    fractions(rxn_ind_tmp2,1) = rxn_frac_tmp;

end

end