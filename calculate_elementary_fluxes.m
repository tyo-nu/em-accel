function [v_ik] = calculate_elementary_fluxes(Network_Data, Rref)
     
%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

v_indices = Network_Data.rxn_indices;
n_rxn_steps = ((v_indices(:,2) - v_indices(:,1))+ 1)./2;
n_rev_rxns = sum(Network_Data.rxn_type == 1);
rev_rxns = find(Network_Data.rxn_type == 1);
n_elem_rxns = length(Network_Data.rxns_f_b);
n_reg_rxns = sum(Network_Data.rxn_type == 3);
n_transport_rxns = sum(Network_Data.rxn_type == 2);
transport_rxns = find(Network_Data.rxn_type == 2);
rxn_type = Network_Data.rxn_type;   

rVnet = Network_Data.WT_solution;
rVnet(rVnet > -1e-10 & rVnet < 1e-10) = 0;                                  % set small rxn flux values to 0 for v_ik calculations

v_ik = zeros(n_elem_rxns,1);                                                % preallocate elementary flux vector

%%%%%%%%%%%%%%% Solve for elementary reaction rates, v_i,k %%%%%%%%%%%%%%%%
  % v_i,2j-1 = V_i,ref / (1 - R_i,j^(sign(V_i,ref)))
  % v_i,2j = V_i,ref * R_i,j^(sign(V_i,ref)) / (1 - R_i,j^(sign(V_i,ref)))

for i = 1:n_rev_rxns                                                        % calculate elementary fluxes for one reaction at a time
    
    n_steps = n_rxn_steps(rev_rxns(i));
    v_index = v_indices(rev_rxns(i),1):1:v_indices(rev_rxns(i),2);
    sign_rVnet = sign(rVnet(rev_rxns(i)));
    
    if rVnet(i) ~= 0                                                        
        
        for j = 1:n_steps
            
            R_step = Rref(v_index(1,2*j)/2);
            v_ik(v_index(2*j-1)) = rVnet(i)/(1 - R_step^(sign_rVnet));      % calculate forward elementary fluxes from WT rxn flux distribution and sampled reaction revseribilities
            v_ik(v_index(2*j)) = ...                                        % calculate reverse elementary fluxes from WT rxn flux distribution and sampled reaction revseribilities
                rVnet(i)*R_step^(sign_rVnet)/(1 - R_step^(sign_rVnet));
            
            if v_ik(v_index(2*j-1)) < 0                                     % if reaction is reversed, switch forward and backward reaction rates
                switch_forward = v_ik(v_index(2*j-1));
                switch_backward = v_ik(v_index(2*j));
                v_ik(v_index(2*j-1)) = -switch_backward;
                v_ik(v_index(2*j))= -switch_forward;
            end  
            
        end
        
    else                                                                    % if net reaction flux is 0, randomly sample elementary reaction fluxes within range of net reaction flux distribution
        
        for j = 1:n_steps
            
            v_ik(v_index(2*j-1)) = rand(1,1)*abs(max(rVnet));               % sample forward elementary reaction flux
            v_ik(v_index(2*j)) = v_ik(v_index(2*j-1));                      % set reverse elementary reaction flux to forward value so net is equal to 0
            
        end       
           
    end
end
    
for m = 1:n_transport_rxns                                                  % set elementary fluxes for transport reactions to net reaction flux value
    
    v_ik(v_indices(transport_rxns(m),1)) = rVnet(transport_rxns(m));
    
end
    
reg_rxns = find(rxn_type == 3);

if ~isempty(reg_rxns)                                                       % Regulation reactions have 0 net flux in WT reference flux distribution
    
    first_reg_rxn = reg_rxns(1);
    v_reg_index = v_indices(first_reg_rxn,1);
    
    for w = 1:n_reg_rxns
        
        for m = 1:n_rxn_steps(reg_rxns(w))
            
            v_ik(v_reg_index) = rand(1,1)*abs(max(rVnet));                  % Sample forward elementary regulation reaction flux within range of reference fluxes
            v_ik(v_reg_index+1) = v_ik(v_reg_index);                        % Set reverse elementary regulation reaction flux to forward value so net is equal to 0
            v_reg_index = v_reg_index + 2;
            
        end
    end
end

end
