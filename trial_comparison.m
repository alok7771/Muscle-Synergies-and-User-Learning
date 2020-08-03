%% trial comparison
% This program compares individual synergies to the next trial of synergy
% Checks for NDP of all combinations

clear all; close all;clc;
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
mVAF=zeros(15,20);

for p=6
   part= ['EF_data.EF',num2str(p)];
   for tr=1:14 %combi
       
       %% trial 2 data
   if isempty(fieldnames(eval([part,'.Trial_',num2str(tr+1)])))==1
       WSy_2={sy_2};
       
   else
        trial_2=[part,'.Trial_',num2str(tr+1),'.RAW']; 
        data_2 = eval(trial_2);
        mat_2=abs(permute(data_2,[2,1,3]));
        X_2=mat_2(:,:);
        [WSy2,HAc2,VAF2,Rsq2] = calSynergy_VAF(X_2);
%         [a,b]=find(VAF2>0.8);
        WSy_2=WSy2(find(VAF2>0.8));
        vaf2=VAF2(find(VAF2>0.8));
   end
             %% trial 1 data
   if tr==1
        trial_1=[part,'.Trial_',num2str(tr),'.RAW']; 
        data_1 = eval(trial_1);
        mat_1=abs(permute(data_1,[2,1,3]));
        X_1=mat_1(:,:);

        [WSy1,HAc1,VAF1,Rsq1] = calSynergy_VAF(X_1);
        [Vc1,n1]=max(VAF1); %cutoff V%
        sy_1=cell2mat(WSy1(n1));
   else
        sy_1=sy_nt;
   end
   
   %% compare
   count=0;
    for comb=1:size(WSy_2,2)
        sy_2=cell2mat(WSy_2(comb));
           %% calculating NDP
            nsy=4;
                    for j=1:nsy
                        for k=1:nsy
                            normsy1=sy_1(:,j)./norm(sy_1(:,j));
                            normsy2=sy_2(:,k)./norm(sy_2(:,k));
                            cNDP(k,j)=dot(normsy1,normsy2);      
                        end
                    end
                   [mcndp,m]=max(cNDP);
                   mall(comb,1:4)=m;
                    if m(1,:)==[1 2 3 4] & sum(mcndp>0.9)==nsy
                        
                        count=count+1;
                        sy_pool(comb)={sy_2};
                        vaf=zeros(1,comb);
                        vaf(comb)=vaf2(comb);
                        disp('solution achieved')

                    else
                        disp('no solution achieved')
                    end

    end                                    
    [aa,bb]=max(vaf);
    sy_nt=cell2mat(sy_pool(bb));
    if count==0
      disp('%%%%%%%%%%%%No elements in m%%%%%%%%%%%%')
      keyboard                      
    end
    sy_str(tr)={sy_1};
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
    fprintf('participant=%i\n', p)
    fprintf('combination=%i\n', tr)
    fprintf('count=%i\n', count)
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
end
   
    sy_f=[sy_str sy_nt];
    sy_final(:,p)=sy_f';
end
%     save('sy_final')
   




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
