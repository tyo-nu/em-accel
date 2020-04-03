function zz_SET_UP(model_size)

load(strcat(model_size,'_model'))

zz_generate_conserved_info(model)

delete sbml_model.xml

warning off                                                                 % avoids printing message if file didn't already exist
delete(strcat('elasticity_coeff_',model_size,'.m'))                         % delete any existing file so file isn't added to old file
warning on

zz_write_elasticity_coefficient_function(model)

zz_write_mass_balance_ODE_mex_file(model);

clearvars -except model Experimental_Data

save(strcat(model.model_size,'_model'))

clc

fprintf('Model Files Completed')
fprintf(1,'\n');



