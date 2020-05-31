alpha = 1;
smin = 0;
alpha2 =alpha-1;
a = randn(numNodes,1);
b = normcdf(abs(a));
b = 2 - 2 * b;
s = b.^(-1/alpha2);
s = s*smin;