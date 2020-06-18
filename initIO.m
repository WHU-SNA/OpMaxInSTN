function [internalOpinion] = initIO(d, numNodes, mode)
if strcmp(mode, 'degree')
    mind = min(d);
    maxd = max(d);
    internalOpinion = zeros(numNodes, 1);
    for i = 1: numNodes
        internalOpinion(i) = (d(i) - mind) / (maxd - mind);
        if rand(1) > 0.5
            internalOpinion(i) = -internalOpinion(i);
        end
    end
elseif strcmp(mode, 'normal')
    internalOpinion = randn(round(numNodes * 1.5), 1);
    internalOpinion = internalOpinion(internalOpinion >= -1 & internalOpinion <= 1);
    internalOpinion = internalOpinion(1:numNodes);
elseif strcmp(mode, 'pow')
    alpha = 2;
    smin = 0;
    alpha2 =alpha-1;
    a = randn(numNodes,1);
    b = normcdf(abs(a));
    b = 2 - 2 * b;
    internalOpinion = b.^(-1/alpha2);
    internalOpinion = internalOpinion * smin;
elseif strcmp(mode, 'uniform')
    internalOpinion = (rand(numNodes, 1) - 0.5) * 2;
else
    internalOpinion = (rand(numNodes, 1) - 0.5) * 2;
end
end
