function zz_generate_conserved_info(model)

n_metabs = length(model.metabs_and_enzyme_complexes);

sbml_model.mets = model.metabs_and_enzyme_complexes;
sbml_model.rxns = model.rxns_f_b;
sbml_model.S = model.S_f_b;
n_elem_rxns = length(model.rxns_f_b);
sbml_model.lb = -1000*ones(n_elem_rxns,1);
sbml_model.ub = 1000*ones(n_elem_rxns,1);
sbml_model.c = zeros(n_elem_rxns,1);

writeSBML(sbml_model,'sbml_model');
modelObj = sbmlimport('sbml_model.xml');
[SI, SD, Lo, NR, ND] = sbioconsmoiety(modelObj,'link');

n_indep_metabs = length(SI);

n_dep_metabs = n_metabs - n_indep_metabs;

conserved_model_info.Sr = full(NR);

conserved_model_info.So = full(ND(1:n_dep_metabs,:));

conserved_model_info.Lo = full(Lo(1:n_dep_metabs,:));

conserved_model_info.L = full([eye(n_indep_metabs); conserved_model_info.Lo]);

conserved_model_info.metabs_and_enzyme_complexes = [SI; SD(1:n_dep_metabs)];

for i = 1:n_metabs
   conserved_model_info.metabs_and_enzyme_complexes(i) = strrep(conserved_model_info.metabs_and_enzyme_complexes(i),'_DASH_','-');  
   conserved_model_info.metabs_and_enzyme_complexes(i) = strrep(conserved_model_info.metabs_and_enzyme_complexes(i),'_LPAREN_e_RPAREN_','');
   conserved_model_info.metabs_and_enzyme_complexes(i) = strrep(conserved_model_info.metabs_and_enzyme_complexes(i),'__LSQBKT_c_RSQBKT_','');
   conserved_model_info.metabs_and_enzyme_complexes{i}(1:2) = ''; %Delete 'M_' in front of each metabolite  
end

conserved_model_info.metab_index_old_to_new = zeros(n_metabs,1);

conserved_model_info.metab_index_new_to_old = zeros(n_metabs,1);

for i = 1:n_metabs
    conserved_model_info.metab_index_new_to_old(i) = find(strcmp(conserved_model_info.metabs_and_enzyme_complexes{i,1}, model.metabs_and_enzyme_complexes));
    conserved_model_info.metab_index_old_to_new(i) = find(strcmp(model.metabs_and_enzyme_complexes(i), conserved_model_info.metabs_and_enzyme_complexes));
end

conserved_model_info.S_f_b_conserved = [conserved_model_info.Sr; conserved_model_info.So];

model.conserved_model_info = conserved_model_info;

end