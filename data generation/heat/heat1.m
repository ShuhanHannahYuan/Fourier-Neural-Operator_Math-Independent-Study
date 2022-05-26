function u = heat1(u0, tspan, c, coeff_a, prd_coeff_a, coeff_b, prd_coeff_b, type, bdy_cond)
    
    if type == "dirichlet"
        u = coeff_a * exp(-c * (prd_coeff_a * pi)^2 * tspan).' * sin(prd_coeff_a * pi * u0) 
        + coeff_b * exp(-c * (prd_coeff_b * pi)^2 * tspan).' * cos(prd_coeff_b * pi * u0);
    elseif type == "neumann"
        u = coeff_a * cos(prd_coeff_a * pi) + coeff_b * sin(prd_coeff_b * pi) + 
        coeff_a * exp(-c * (prd_coeff_a * pi)^2 * tspan).' * cos(prd_coeff_a * pi * u0) 
        + coeff_b * exp(-c * (prd_coeff_b * pi)^2 * tspan).' * sin(prd_coeff_b * pi * u0);
    end
    
end