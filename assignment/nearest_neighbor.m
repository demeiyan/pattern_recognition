x = rand(5000,10);
distance = zeros(5000,5000);
indices = zeros(5000,1,'int32');
tic
for i=1:5000
    for j=1:5000
        if i==j
            distance(i,j) = 999999;
        else
            distance(i,j) = (x(i)-x(j))*(x(i)-x(j))';
        end
    end
end
for i=1:5000
    [c,tmp] = min(distance(i,:));
    indices(i) = tmp;
end
toc
disp(['time : ',num2str(toc)]);
        