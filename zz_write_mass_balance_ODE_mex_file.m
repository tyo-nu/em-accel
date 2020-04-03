function zz_write_mass_balance_ODE_mex_file(model)

[n_independent_metabs, n_rxns_f_b] = size(model.conserved_model_info.Sr);
n_metabs = length(model.conserved_model_info.metab_index_new_to_old);
n_dependent_metabs = size(model.conserved_model_info.Lo,1);
model_size = model.model_size;

str1 = strcat('codegen mass_balance_ode_conserved -args {zeros(1,1), zeros(');
str2 = strcat(num2str(n_independent_metabs),',1),zeros(',num2str(n_rxns_f_b));
str3 = strcat(',1),zeros(',num2str(n_metabs),',',num2str(n_rxns_f_b));
str4 = strcat('),zeros(',num2str(n_independent_metabs),',',num2str(n_rxns_f_b));
str5 = strcat('),zeros(',num2str(n_dependent_metabs),',1),zeros(');
str6 = strcat(num2str(n_dependent_metabs),',',num2str(n_independent_metabs));
str7 = strcat(')} -o mass_balance_ode_conserved_',model_size,'_mex');

string = strcat(str1, str2, str3, str4, str5, str6, str7);

eval(string)

end