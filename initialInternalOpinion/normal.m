s = randn(round(numNodes * 1.5), 1);
s = s(s >= -1 & s <= 1);
s = s(1:numNodes);