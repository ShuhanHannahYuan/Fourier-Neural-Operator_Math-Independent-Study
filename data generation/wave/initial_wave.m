function u = initial_wave(coeff_a, prd_coeff_a, coeff_b, prd_coeff_b,x)

    u = coeff_a * sin(prd_coeff_a * pi * x) + coeff_b * cos(prd_coeff_b * pi * x);

end