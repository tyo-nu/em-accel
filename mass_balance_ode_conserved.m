function dxi = mass_balance_ode_conserved(~,xi,kinetic_param,S_f_b,Sr,T,Lo)

xd = T + Lo*xi;                                                             % Calculate dependent metabolite concentrations needed to calculate v

x = [xi; xd];                                                               % Combine independent and dependent metabolites into a single vector

%%%%%%%%%%%%%%% Calculate v = k*prod(x^(substrate_stoich)) %%%%%%%%%%%%%%%%
    
v = kinetic_param;                                                      
    
for j = 1:length(kinetic_param)

    for i=1:length(x) 
        if S_f_b(i,j) < 0
            v(j)=v(j)*(x(i)^abs(S_f_b(i,j))); 
        end
    end
    
end

%%%%%%%% Calculate change in independent metabolite concentration %%%%%%%%%
    
dxi = Sr*v;

end