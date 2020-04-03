function [value,isterminal,direction] = ...
    event_function_conserved(t,xi,CPU_t,kinetic_param,S_f_b,Sr,T,Lo, ...
    mass_balance_ode_conserved_mex)

    Error=max(abs(mass_balance_ode_conserved_mex(0,xi,kinetic_param, ...    % Calculate maximum deviation from dx = S*v = 0
        S_f_b,Sr,T,Lo)));
    direction = 0;                                                          % Required for event function
    tol=0.0001;                                                             % Maximum deviation dx = S*v = 0 allowed before ending integration
    
    if toc(CPU_t)<80 && Error>tol                                           % If integration time is greater than 80s, end integration; 80s was time required to complete 99% of integrations in time trial
        value=Error;
        isterminal = 0;
    elseif t <= 0.001                                                       % Avoid event not triggering if event happens on first integration step
        value=Error;
        isterminal = 0;
    else
        value=0;
        isterminal = 1;                                                     % Terminate integration if error drops below tolerance or integration time surpases 80 seconds
    end
    
end