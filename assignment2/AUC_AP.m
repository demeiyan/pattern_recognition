label_scores = zeros(10,2);
label_scores([1,3,4,6,9],1) = 1;
label_scores([2,5,7,8,10],1) = 2;
precision = zeros(11,1);
recall = zeros(11,1);
auc_pr = zeros(10,1);
ap = zeros(10,1);
for i = 1:10
    label_scores(i,2) = (1-(i*0.1)+0.1);
end
precision(1) = 1.0000;
recall(1) = 0.0000;
positive_count = sum(label_scores(:,1) == 1);
for i =1:10
    precision(i+1) = sum(label_scores(1:i,1) == 1)/i;
    recall(i+1) = sum(label_scores(1:i,1) == 1)/positive_count;
    auc_pr(i) = (recall(i+1)-recall(i))*(precision(i+1)+precision(i))/2;
    ap(i) = (recall(i+1)-recall(i))*precision(i+1);
end
sum(auc_pr)
sum(ap)