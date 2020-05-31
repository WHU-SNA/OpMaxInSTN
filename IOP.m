g = (ones(1, numNodes) / (L + I))';
absG = abs(g);
deltaS = zeros(numNodes, 1);
budget = 10;
while budget > 0
    index = find(absG==max(absG));
    index = index(1);
    maxG = g(index);
    absG(index) = 0;
    if maxG > 0
        tmp = 1 - s(index);
        if tmp < budget
            deltaS(index) = 1;
            budget = budget - tmp;
        else
            deltaS(index) = s(index) + budget;
            budget = 0;
        end
    else
        tmp = 1 + s(index);
        if tmp < budget
            deltaS(index) = -1;
            budget = budget - tmp;
        else
            deltaS(index) = s(index) - budget;
            budget = 0;
        end
    end
end

