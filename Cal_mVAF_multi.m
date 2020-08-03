clear all; close all;clc;
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
load('WandHof_sy_nnmf_bestof50.mat')
mVAF=zeros(15,20);
result=('nnmf: bestVAF of 50 is initial solution: W based on mult algorithm: 4 muscle synergies: norm of each row of X');
for p=1:20
   part= ['EF_data.EF',num2str(p)];
   for tr=1:15
       tic
       if isempty(fieldnames(eval([part,'.Trial_',num2str(tr)])))==1
       Vc=0;
       disp('no RAW data')
       else     
       trial=[part,'.Trial_',num2str(tr),'.RAW']; 
       data = eval(trial);
       mat=abs(permute(data,[2,1,3]));
       Xa=mat(:,:);
       X=Xa./max(Xa,[],2); %normalize over each row
       W0=cell2mat(W_sy(tr,p));
       H0=cell2mat(H_ac(tr,p));
       [W,H,VAF,Rsq] = calSynergy_VAF(X,W0,H0);
       disp(trial)
       fprintf('combination p=%i  tr=%i \n', p, tr);
       toc
       end
       mVAF(tr,p)=VAF;
       rsq(tr,p)=Rsq;
       Wsy(tr,p)={W};
       Hac(tr,p)={H};
   end

         
        
end
 save('sy_nnmf_bestof50_iter25k_multi')
% ---------------------------- Information ---------------------------
% This program gives a max VAF value from defined 'i' iterations for the 
% same dataset iterating again and again to ensure if reconstruction is going well or not.



function [W,H,VAF,Rsq] = calSynergy_VAF(X,W0,H0)
%%%%i= number of iterations for checking the least reconstruction accuracy

    
%% Extracting syngergies
nSy=4;  %number of synergies we want to extract%

    opt = statset('MaxIter',25000,'Tolfun',1e-11,'TolX',1e-11);
    [W,H]=nnmf(X,nSy,'w0',W0,'h0',H0,'options',opt,'algorithm','mult');

    Xr=W*H;
    me=mean(X,2);
    SST=sum(sum((X-me).^2,2));
    SSE=sum(sum((X-Xr).^2,2));
    VAF=1-(SSE./SST); %Variability accounted for
    Rsq=corr2(X,Xr).^2; % perason corr coeff squared
  
end




