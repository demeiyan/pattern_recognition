rand('seed',0);
X = rand(10, 5000) ;
kdtree = vl_kdtreebuild(X,'NumTrees',1);
Q = X;
tic
[index, distance] = vl_kdtreequery(kdtree, X, X, 'NumNeighbors',2,'MaxComparisons', 6000) ;
toc
disp(['time : ',num2str(toc)]);

