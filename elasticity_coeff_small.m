function dv_dx = elasticity_coeff_small(x,k)

dv_dx = zeros(length(k),length(x));

dv_dx(1,3) = k(1)*x(12);
dv_dx(1,12) = k(1)*x(3);
dv_dx(2,14) = k(2);
dv_dx(3,14) = k(3);
dv_dx(4,1) = k(4)*x(7);
dv_dx(4,7) = k(4)*x(1);
dv_dx(5,7) = k(5);
dv_dx(6,2) = k(6)*x(12);
dv_dx(6,12) = k(6)*x(2);
dv_dx(7,2) = k(7)*x(15);
dv_dx(7,15) = k(7)*x(2);
dv_dx(8,10) = k(8);
dv_dx(9,10) = k(9);
dv_dx(10,6) = k(10);
dv_dx(11,6) = k(11);
dv_dx(12,1) = k(12)*x(15);
dv_dx(12,15) = k(12)*x(1);
dv_dx(13,1) = k(13)*x(11);
dv_dx(13,11) = k(13)*x(1);
dv_dx(14,13) = k(14);
dv_dx(15,13) = k(15);
dv_dx(16,4) = k(16);
dv_dx(17,4) = k(17);
dv_dx(18,9) = k(18)*x(11);
dv_dx(18,11) = k(18)*x(9);
dv_dx(19,8) = k(19);
dv_dx(20,5) = k(20);
dv_dx(21,5) = k(21);
dv_dx(22,16) = k(22);
dv_dx(23,16) = k(23);
dv_dx(24,3) = k(24)*x(8);
dv_dx(24,8) = k(24)*x(3);
dv_dx(25,9) = k(25);
dv_dx(26,2) = k(26);

end
