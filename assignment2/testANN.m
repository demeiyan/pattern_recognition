error_rates = zeros(46,2);
%ANN(5000,700);
for i=1:46
    error_rates(i,:) = ANN((500+(i-1)*100),50);
end
%error_rates(1,:) = ANN(5000,5);
scatter(error_rates(:,1),error_rates(:,2),'filled');