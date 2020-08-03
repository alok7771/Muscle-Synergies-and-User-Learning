% clear;clc;
% for mm=1
% tic
%  n=8;m=72000;xmin=-1;xmax=1;
%  Ca=xmin+randn(n,1)*(xmax-xmin);
%  %% Type 1 data
% for i=1:n
%        Wa(i,:)=xmin+randn(1,m)*(xmax-xmin); 
%        V(i,:)=Ca(i)*Wa(i,:);
% end
% 
% %% Type 2  data
% 
% %        Wa=xmin+randn(n,4)*(xmax-xmin); 
% %        Ha=xmin+randn(4,m)*(xmax-xmin);
% %        V=Wa*Ha;
% %       
% %%
% epmin=-10e-2;
% epmax=10e-2;
% % epmin=0;
% % epmax=0;
% ep=xmin+randn(n,m)*(xmax-xmin);
% mat=V+ep;
% 
% % mat=abs(mat);
% mat(mat<0)=0; % for negative values zero constraint
% %% 
% for j=1:n
% X(j,:)= mat(j,:) / max(mat(j,:));
% end
% %note: sqrt(mat(j,:) * mat(j,:)'); is same as norm(mat(j,:));
%%
[W,H]=nnmf(X,4);
[W1,H1]=nnmf(X,4);
% [W,H]=nmf_als(X,4,10000,1);
% % pause(5)
% [W1,H1]=nmf_als(X,4,25000,1);
Xr=W*H;
me=mean(X,2);
SST=sum(sum((X-me).^2,2));
SSE=sum(sum((X-(Xr)).^2,2));
VAF=1-(SSE/SST)
Rsq=corr2(X,Xr).^2

Xr1=W1*H1;
me1=mean(X,2);
SST1=sum(sum((X-me1).^2,2));
SSE1=sum(sum((X-(Xr1)).^2,2));
VAF1=1-(SSE1/SST1)
Rsq1=corr2(X,Xr1).^2
% save('W_W1')
toc

for jj=1:4
    nW(:,jj)=W(:,jj)/norm(W(:,jj));
    nW1(:,jj)=W1(:,jj)/norm(W1(:,jj));
end

% cc(mm)=corr2(nW,nW1)
% end