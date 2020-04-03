function dv_dx = zz_create_elasticity_coefficient_matrix(model)

S_f_b = model.conserved_model_info.S_f_b_conserved;
n_rxns = size(S_f_b,2);

iter = 0;

dv_dx = {};

for z = 1:n_rxns 
    metab_set = find(S_f_b(:,z)<0);
    
    dv_dx_eqns = cell(length(metab_set),1);
    
    for i = 1:length(metab_set)
        iter = iter + 1;
        dv_dx_now = strcat('dv_dx(', num2str(z), ',', ...
            num2str(metab_set(i)), ') =');      
        
        if length(metab_set) > 1
            other_metab = metab_set(metab_set ~= metab_set(i));
            
            if S_f_b(metab_set(i),z) ~= -1
                rxn_now = strcat(num2str(abs(S_f_b(metab_set(i),z))), ...
                    '*k(',num2str(z), ')*','x(',num2str(other_metab), ...
                    ')*x(', num2str(metab_set(i)),')^(',...
                    num2str(abs(S_f_b(metab_set(i),z))-1),')');
         
            elseif S_f_b(other_metab,z) ~= -1
                 rxn_now = strcat(' k(',num2str(z), ')*','x(', ...
                     num2str(other_metab),')^(', ...
                     num2str(abs(S_f_b(other_metab,z))),')');
                
            else
                rxn_now = strcat(' k(', num2str(z), ')*', ...
                    'x(',num2str(other_metab),')');
                
            end
            
            
        else
            rxn_now = strcat(' k(', num2str(z), ')');
        end
        
        dv_dx_now = strcat(dv_dx_now, rxn_now, ';');

        dv_dx(iter) = cellstr(dv_dx_now);
        
    end
end

dv_dx = dv_dx';

end