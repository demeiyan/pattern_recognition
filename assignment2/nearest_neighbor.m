x = rand(5000,10);
distance = zeros(5000,5000);
indices = zeros(5000,1,'int32');
tic
for i=1:5000
    distance(i,:) = sum((x - x(i,:)).^2,2);
end
distance(logical(eye(size(distance)))) = 9999;
for i=1:5000
    [c,tmp] = min(distance(i,:));
    indices(i) = tmp;
end
toc
disp(['time : ',num2str(toc)]);
        