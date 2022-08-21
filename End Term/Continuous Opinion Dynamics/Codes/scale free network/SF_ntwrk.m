function [deg,A]=SF_ntwrk(n,gamma)
% 
% n = 100;
% gamma = 3.1;
m = sqrt(n); %%% n^(1/(gamma-1));
d = 10;
p = 1/(gamma-1);
c = (1-p)*d*n^p;
i0 = (c/m)^(1/p) - 1;
w = c./((1:n)+i0).^p;

%     A = CL_generator(w); 
%     GG=graph(A);
%     deg=degree(GG);
ntrial = 200;    % number of random trials
acc = 0;
for trial = 1:ntrial
    A = CL_generator(w); 
    deg = sum(A);
    acc = acc + deg;
end
deg = acc/ntrial;