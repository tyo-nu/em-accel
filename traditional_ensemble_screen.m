function [all_models2keep, fvals_post_TS_screen, ...
    all_solutions_post_TS_screen, solve_times, avg_final_fitness, ...
    all_screen_times, All_K_post_screen, All_fractions_post_screen] = ...
    traditional_ensemble_screen(Network_Data, ...
    Experimental_Data, t_interval, knockouts, All_K, All_fractions, ...
    save_results, file_save_name, screen_fval_thresholds, ...
    post_screen_knockouts)

%%%%%%%%%%%%%%%%%%%%%% Define Model Characteristics %%%%%%%%%%%%%%%%%%%%%%%

model_size = Network_Data.model_size;
calculate_Kset_fitness = ...
str2func(strcat('calculate_Kset_fitness_',model_size));
S = Network_Data.S;
All_K_pre_TS = All_K;
All_fractions_pre_TS = All_fractions;
nKOs = length(knockouts);

%%%%%%%%%%%%%%%%%%%%%%%%%% Preallocate Variables %%%%%%%%%%%%%%%%%%%%%%%%%%

all_models2keep = cell(nKOs,1);
all_screen_times = cell(nKOs,1);
solve_times = zeros(nKOs,1);

%%%%%%%%%%%%%%%%%%%%%%%% Screen Parameter Ensemble %%%%%%%%%%%%%%%%%%%%%%%%

fprintf(1,'\n');
fprintf(1,'Screening ensemble of parameter sets...');
fprintf(1,'\n');
            
for w = 1:nKOs                                                              % Screen ensemble against one KO at a time in defined KO order (knockouts)
       
    fprintf(1,'\n');
    fprintf(1,'Starting KO %d out of %d: %s',w,nKOs, ...
        Network_Data.rxns{knockouts(w)});
    fprintf(1,'\n');
        
    [models2keep, ~, ~, ~, compute_times] = ...                             % Screen ensemble against a single KO and return screen times and models passing fitness threshold
        screen_models(Network_Data, Experimental_Data, All_K_pre_TS, ...
        All_fractions_pre_TS, knockouts(w), t_interval, ...
        screen_fval_thresholds(w));
        
    fprintf(1,'\n');
    fprintf(1,'Finished KO %d! %d out of %d models remain!',w, ...
        length(models2keep),size(All_K,2));
    fprintf(1,'\n');
        
    all_models2keep{w} = models2keep;
    all_screen_times{w} = compute_times;
            
    All_K_pre_TS = All_K_pre_TS(:,models2keep);
    All_fractions_pre_TS = All_fractions_pre_TS(:,models2keep);
    solve_times(w) = toc
                               
    if save_results
        save(strcat(file_save_name,'b'),'all_models2keep')
    end
end

All_K_post_screen = All_K_pre_TS;
All_fractions_post_screen = All_fractions;
    
if ~isempty(All_K_pre_TS)                                                   % Calculate fitness of remaining ensemble against defined knockout set (post_screen_knockouts)
        
    fprintf(1,'\n');
    fprintf(1,'Beginning to calculate flux results for remaining models');
    fprintf(1,' for all KOs.');
    fprintf(1,'\n');
    
    [fvals_post_TS_screen, all_solutions_post_TS_screen] = ...
        calculate_perturbed_steady_states(Network_Data, ...
        Experimental_Data, post_screen_knockouts, All_K_pre_TS, ...
        All_fractions_pre_TS, t_interval);
   
    avg_solutions = zeros(size(S,2),length(post_screen_knockouts));         % Preallocate avg_solutions

    for i = 1:length(post_screen_knockouts)
        avg_solutions(:,i) = mean(all_solutions_post_TS_screen{i,1},2);     % Calculate average flux prediction for each flux across all remaining ensemble set predictions
    end

    avg_final_fitness = calculate_Kset_fitness(Experimental_Data,...        % Calculate avgerage final fitness of remaining post-screen ensemble to predict the knockouts defined in post_screen_knockouts
    avg_solutions, post_screen_knockouts, S);

else                                                                        % If remaining ensemble is NULL, return empty vectors
    fvals_post_TS_screen = [];
    all_solutions_post_TS_screen = [];
    avg_final_fitness = [];
    
end

end