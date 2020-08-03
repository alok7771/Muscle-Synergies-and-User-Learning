%% Testing algorithms

% clear; clc;
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
data=EF_data.EF11.Trial_14.RAW;
mat=(permute(data,[2,1,3]));
X=mat(:,:);
Xa=abs(X./max(X')');
% [U,S,V] = svd(Xa,'econ');
% [W,H]=nnmf(Xa,4);
% [W4,H4]=nnmf(Xa,4);
[W,H]=nmf_als(Xa,4,10000,1);
[W1,H1]=nmf_als(Xa,4,15000,1);
%[W,H]=nmf_mm(Xa,4,10E4,1);
% [W1,H1]=nmf_mm(Xa,4,10E4,1);
% [W'./(max(W))']'-[W2'./(max(W2))']'
% [W1,H1]=nmf_prob(Xa,4,10E4,1);
% [W1,H1]=nmf_prob(Xa,4,10E3,1);
% save('W_W1')

% 
Xr=W*H;
me=mean(Xa,2);
SST=sum(sum((Xa-me).^2,2));
SSE=sum(sum((Xa-(Xr)).^2,2));
VAF=1-(SSE/SST)
Rsq=corr2(X,Xr).^2