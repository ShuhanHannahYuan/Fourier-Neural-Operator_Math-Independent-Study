%wave eqn: u_tt = u_xx u(x,0) = u0(x), u0(x) = coeff_a * sin(prd_coeff_a * pi *
%x) + coeff_b * cos(prd_coeff_b * pi * x); u_t(x,0) = ut0(x), 
% ut0(x) = coeff_c * sin(prd_coeff_c * pi * x) + 
% coeff_d * cos(prd_coeff_d * pi * x)
% x in (0,1), t in (0,1]
% number of realizations to generate
N = 1100;

% parameters for initial condition
coeff_a = unifrnd(0,10);
prd_coeff_a = unifrnd(0,10);
coeff_b = unifrnd(0,10);
prd_coeff_b = unifrnd(0,10);
coeff_c = unifrnd(0,10);
prd_coeff_c = unifrnd(0,10);
coeff_d = unifrnd(0,10);
prd_coeff_d = unifrnd(0,10);
bdy_cond = unifrdn(0,10);

% parameter for PDE
c = unifrnd(0,10);

% grid size
s = 8192;
steps = 200;


input = zeros(N, s);
if steps == 1
    output = zeros(N, s);
else
    output = zeros(N, steps, s);
end

tspan = linspace(0,1,steps+1);
x = linspace(0,1,s+1);

for j=1:N
    u0 = initial_wave(coeff_a, prd_coeff_a, coeff_b, prd_coeff_b,x);
    % can use "dirichlet" or "neumann" 
    u = wave1(u0, tspan, c, coeff_a, prd_coeff_a, coeff_b, prd_coeff_b, ...
        coeff_c, prd_coeff_c, coeff_d, prd_coeff_d, ...
        "dirichlet", bdy_cond);
    u0eval = u0;
    
    input(j,:) = u0eval(1:end-1);
    
    if steps == 1
        output(j,:) = u;
    else
        for k=2:(steps+1)
            output(j,k,:) = u(k);
        end
    end
    
    disp(j);
end

save('wave_data_D.mat', 'input', 'output');