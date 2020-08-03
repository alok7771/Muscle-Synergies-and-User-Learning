%% Introduction
% Same data recreation accuracy check
% takes a data matrix Xa, decompose it in W and H, 50 times
% finds max VAF of Xr with X and uses that solution as tempelate.
% calculates NDP of all 50 W's with the W of max(Xr) 
% Also calculates VAF and Rsq of X vs Xrs
% here Xrs is a matrix calculated when a single column of W is multiplied-
% with corrosponding single row of H
%% 
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
data=EF_data.EF9.Trial_12.RAW;
mat=abs(permute(data,[2,1,3]));
Xa=mat(:,:);
nsy=4;
for i=1:50
    disp('iter') 
    disp(i)
    [W,H]=nnmf(Xa,nsy);
    sy(i)={W};
    ac(i)={H};
    Xr(i)={W*H};
    me=mean(Xa,2);
    SST=sum(sum((Xa-me).^2,2));
    SSE=sum(sum((Xa-cell2mat(Xr(i))).^2,2));
    VAF(i)=1-(SSE/SST); %Variability accounted for
end
    
[Vc,n]=max(VAF);

for i=1:50
    disp('combinattion is') 
    disp(i)
    disp('VAF')
    disp(VAF(i))
    sy_1=cell2mat(sy(n));      
    sy_2=cell2mat(sy(i)); 
        for j=1:nsy
            for k=1:nsy
    normsy1=sy_1(:,j)./norm(sy_1(:,j));
    normsy2=sy_2(:,k)./norm(sy_2(:,k));
    cNDP(k,j)=dot(normsy1,normsy2);
    
    sys=zeros(size(W)); 
    sys(:,k)=sy_2(:,k);
    acs=zeros(size(H));
    ac_2=cell2mat(ac(i)); 
    acs(k,:)=ac_2(k,:);
    Xrs=sys*acs;
    me=mean(Xa,2);
    SST=sum(sum((Xa-me).^2,2));
    SSE=sum(sum((Xa-Xrs).^2,2));
    VAFs(i,k)=1-(SSE/SST);
    Rsqs(i,k)=corr2(Xa,Xrs).^2;
    
            end
        end
        cNDP
        [mcndp,m]=max(cNDP)
        VAFall=[VAFs(i,:) VAF(i)]
        Rsqall=[Rsqs(i,:) corr2(Xa,cell2mat(Xr(i))).^2]
end
