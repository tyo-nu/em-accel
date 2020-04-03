function df_dx = jacobian(~,xi,k,Sr,L,T,Lo,elasticity_coeff)

    xd = T + Lo*xi;                                                         % Calculate dependent metabolite concentrations

    x = [xi; xd];                                                           % Combine independent and dependent metabolites into a single vector

    e_ij = elasticity_coeff(x,k);                                           % Calculate elasticity matrix needed to calculate jacobian of reduced model
    
    df_dx = Sr*e_ij*L;                                                      % Calculate Jacobian matrix

    df_dx = sparse(df_dx);                                                  % Convert Jacobian to sparse matrix for memory and computation time improvements

end
