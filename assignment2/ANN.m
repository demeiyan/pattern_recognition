rand('seed',0);
maxComparisons = 500;
datasize = 5000;
X = rand(10,datasize);
kdtree = vl_kdtreebuild(X,'NumTrees',1);
Q = X;
[index, ~] = vl_kdtreequery(kdtree,X,Q,'NumNeighbors',2,'MaxComparisons', maxComparisons);

% The Ground Truth
distance = zeros(datasize,datasize);
indices = zeros(datasize,1,'uint32');
X = X';
for i=1:datasize
    distance(i,:) = sum((X - X(i,:)).^2,2);
end
distance(logical(eye(size(distance)))) = 9999;
for i=1:datasize
    [~, indices(i)] = min(distance(i,:));
end
error_rate = (1 - sum(index(2,:)' == indices)/datasize)*100;
fprintf('maxComparisons is %d The error rate is %.2f%%\n',maxComparisons,error_rate);


