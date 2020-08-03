%% trial comparison
clear all; close all;clc;
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')


for p=1
part= ['EF_data.EF',num2str(p)];

    for tr=1:15
    %% Extracting synergies

        trial_1=[part,'.Trial_',num2str(tr),'.RAW']; 
        data_1 = eval(trial_1);
        mat_1=abs(permute(data_1,[2,1,3]));
        X_1=mat_1(:,:);

        [WSy1,HAc1,VAF1,Rsq1] = calSynergy_VAF(X_1);
        [Vc1,n1]=max(VAF1); %cutoff V%
        Wsy=cell2mat(WSy1(n1));
        disp (tr)
        sy(tr)={Wsy};
    end
    %% CPA 

    for comb=1:14

    sy_1=cell2mat(sy(comb));
    sy_2=cell2mat(sy(comb+1));

    nsy=4;

        for j=1:nsy
            
            normsy1=sy_1(:,j)./norm(sy_1(:,j));
            normsy2=sy_2(:,j)./norm(sy_2(:,j));
            cpa(comb,j)=subspace(normsy1,normsy2);
%             cpa2(comb,j)=atan2(norm(cross(normsy1,normsy2)),dot(normsy1,normsy2));
           
        end
    end
end

   


%% function in use

function [WSy,HAc,VAF,Rsq] = calSynergy_VAF(X)
%%%%i= number of iterations for checking the highest reconstruction accuracy
for i=1:50
    
%% Extracting syngergies
nSy=4;  %number of synergies we want to extract%

    [W,H]=nnmf(X,nSy);
    WSy(i)={W};% to see values use cell2mat(WSy(2))%%
    HAc(i)={H};
    Xr=W*H;
    me=mean(X,2);
    SST=sum(sum((X-me).^2,2));
    SSE=sum(sum((X-Xr).^2,2));
    VAF(i)=1-(SSE/SST); %Variability accounted for
    Rsq(i)=corr2(X,Xr).^2; % perason corr coeff squared
  

% V(i,:)=VAF;
% [Vc,n]=max(V); %cutoff V%
% R_sq(i,:)=Rsq;
% r2=R_sq(n);
% Wsy=cell2mat(WSy(n)); 
% Hac=cell2mat(HAc(n));
end

end
