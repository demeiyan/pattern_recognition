rng('default')
x = randn(2000,2)*[2 1;1 2];
scatter(x(:,1),x(:,2));

% PCA
m = mean(x);
new_x = x - repmat(m,2000,1);
[U,S,V] = svd(new_x);
S = diag(S);
w1 = V(:,1);
w2 = V(:,2);
w = [w1,w2];
new_x = x*w;
%scatter(new_x(:,1),new_x(:,2));

%Whitening transformation
w1_white = w1/sqrt(S(1));
w2_white = w2/sqrt(S(2));
x_white = x*[w1_white,w2_white];
%scatter(x_white(:,1),x_white(:,2));
