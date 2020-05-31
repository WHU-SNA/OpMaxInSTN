budget = 10;
Q = (L + I) \ I;
QPre = Q;
budget = 10;
U = [];
while budget > 0
    budget = budget - 1;
    g = ones(1, numNodes);
    z = QPre * s;
    b = diag(g) / diag(QPre) * (s - z);
    index = find(b == max(b));
    index = index(1);
    while ismember(index, U)
        b(index) = 0;
        index = find(b == max(b));
        index = index(1);
    end
    U = [U, index]
    Q = QPre + QPre(:, index) * (L(index, :) * QPre) / (L(index, :) * QPre(:, index));
    QPre = Q;
end
    