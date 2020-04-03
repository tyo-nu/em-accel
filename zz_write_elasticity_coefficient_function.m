function zz_write_elasticity_coefficient_function(model)

dv_dx = zz_create_elasticity_coefficient_matrix(model);

n_eqns = length(dv_dx);

diary(strcat('elasticity_coeff_',model.model_size,'.m'))

fprintf('function dv_dx = elasticity_coeff_')
fprintf(model.model_size)
fprintf('(x,k)')
fprintf(1,'\n');
fprintf(1,'\n');
fprintf('dv_dx = zeros(length(k),length(x));')
fprintf(1,'\n');
fprintf(1,'\n');
 
 
for i = 1:n_eqns
    fprintf(dv_dx{i,1})
    fprintf(1,'\n');    
end

fprintf(1,'\n');
fprintf('end')
fprintf(1,'\n');

diary off

end