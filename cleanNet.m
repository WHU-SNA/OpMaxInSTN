nodeIdMap = containers.Map;
edges = load('C:\Users\zhaocuo\Documents\SignedNetworks\WikiElec\network');
edges = edges(:, 1:3);
m = size(edges);
m = m(1);

count = 1;
for i = 1: m
    disp(i)
    edge = edges(i, :);
    source = num2str(edge(1));
    target = num2str(edge(2));
    weight = edge(3);
    if weight == 0
        continue
    end
    if ~ismember(source, nodeIdMap.keys)
        nodeIdMap(source) = count;
        count = count + 1;
    end
    if ~ismember(target, nodeIdMap.keys)
        nodeIdMap(target) = count;
        count = count + 1;
    end
end

sources = [];
targets = [];
weights = [];
for i = 1: m
    edge = edges(i, :);
    source = edge(1);
    target = edge(2);
    weight = edge(3);
    if weight == 0
        continue
    end
    source = nodeIdMap(num2str(source));
    target = nodeIdMap(num2str(target));
    sources = [sources, source];
    targets = [targets, target];
    weights = [weights, weight];
end

G = digraph(sources, targets, weights);
G = simplify(G);
numNodes = G.numnodes;
A = full(adjacency(G,'weighted'));
D = speye(numNodes);
I = eye(numNodes);
for i = 1: numNodes
    D(i, i) = sum(abs(A(i, :)));
end
L = D - A;
