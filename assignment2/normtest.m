for i = 1:10000
p = normpdf(i*0.0001,1,0.5);
r = normpdf(i*0.0001,-1,0.5);
if (p/r)>=10
    fprintf('%d %f %f\n',i,p,r);
    break;
end
end