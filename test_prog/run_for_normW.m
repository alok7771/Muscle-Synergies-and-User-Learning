for p=5
for tr=8
a=cell2mat(W50(tr,p));
b=cell2mat(Wb50(tr,p));
% a=cell2mat(sy(i));
aa=[a(:,1)/norm(a(:,1)) a(:,2)/norm(a(:,2)) a(:,3)/norm(a(:,3)) a(:,4)/norm(a(:,4))];
bb=[b(:,1)/norm(b(:,1)) b(:,2)/norm(b(:,2)) b(:,3)/norm(b(:,3)) b(:,4)/norm(b(:,4))];

[aa bb]
corr2(aa,bb)
co(tr,p)=corr2(aa,bb);
% pause
end
end