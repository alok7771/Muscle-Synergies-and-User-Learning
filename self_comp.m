%% Intro
%This program calculates W for max VAF of 50 iters
%compares all 50 W with max VAF W

clear; clc;
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
data=EF_data.EF20.Trial_1.RAW;
mat=abs(permute(data,[2,1,3]));
X=mat(:,:);
Xa=X./max(X')';
nsy=4;
for i=1:50
   fprintf('Sy genertion iter no:=%i\n', i)
    [W,H]=nnmf(Xa,nsy);
    sy(i)={W};
    ac(i)={H};
    Xr(i)={W*H};
    me=mean(Xa,2);
    SST=sum(sum((Xa-me).^2,2));
    SSE=sum(sum((Xa-cell2mat(Xr(i))).^2,2));
    VAF(i)=1-(SSE./SST); %Variability accounted for
    [Vc,n]=max(VAF);
    sy_1=cell2mat(sy(n));
end
disp('iterations complete')
for itr=1:50
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
    fprintf('combination iter for NDP:=%i\n', itr);
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
    sy_2=cell2mat(sy(itr));      

        for j=1:nsy
            for k=1:nsy
    normsy1=sy_1(:,j)./norm(sy_1(:,j));
    normsy2=sy_2(:,k)./norm(sy_2(:,k));
    cNDP(k,j)=dot(normsy1,normsy2);
    
    sys=zeros(size(W)); 
    sys(:,k)=sy_2(:,k);
    acs=zeros(size(H));
    ac_2=cell2mat(ac(itr)); 
    acs(k,:)=ac_2(k,:);
    Xrs=sys*acs;
    me=mean(Xa,2);
    SST=sum(sum((Xa-me).^2,2));
    SSE=sum(sum((Xa-Xrs).^2,2));
    VAFs(itr,k)=1-(SSE/SST);
    Rsqs(itr,k)=corr2(Xa,Xrs).^2;
   
            end
        end

cNDP
[mcndp,m]=max(cNDP);
mcndp
R_square=Rsqs(itr,:)
m
mall(itr,1:4)=m;
mcndp_all(itr,1:4)=mcndp;     
end
