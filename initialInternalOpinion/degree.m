d = diag(D);
mind = min(d);
maxd = max(d);
s = zeros(numNodes, 1);
for i = 1: numNodes
    s(i) = (d(i) - mind) / (maxd - mind);
    if rand(1) > 0.5
        s(i) = -s(i);
    end
end
