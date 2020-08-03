% clear all; close all;clc;
% load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
result=('nnmf 50k max of X');
maxiter=50000;
for p=1
   part= ['EF_data.EF',num2str(p)];
   for tr=1
       tic
       if isempty(fieldnames(eval([part,'.Trial_',num2str(tr)])))==1
       Vc=0;
       disp('no RAW data')
       else     
       trial=[part,'.Trial_',num2str(tr),'.RAW']; 
       data = eval(trial);
       mat=abs(permute(data,[2,1,3]));
       Xa=mat(:,:);
%        X=abs(Xa./max(Xa,[],2));
X=abs(Xa./max(max(abs(Xa))));
       [W,H,VAF,Rsq] = cal_Sy(X,maxiter);
       disp(trial)
       toc
       end
       vaf(tr,p)=VAF;
       rsq(tr,p)=Rsq;
       Wsy(tr,p)={W};
       Hac(tr,p)={H};
   end  
end
%   save('sy_nnmf_50k')
% ---------------------------- Information ---------------------------
% This program gives a min VAF value from defined 'i' iterations for the 
% same dataset iterating again and again to ensure if reconstruction is going well or not.



function [W,H,VAF,Rsq] = cal_Sy(X,maxiter)

%% Extracting syngergies
nSy=4; %number of synergies we want to extract%

opt = statset('MaxIter',maxiter,'Display','iter','Tolfun',1e-12,'TolX',1e-12);

W0=abs(rand(8,4));
H0=abs(rand(4,72000));

    [W,H]=nnmf(X,nSy,'w0',W0,'h0',H0,'options',opt,'algorithm','als');
    
    Xr=W*H;
    me=mean(X,2);
    SST=sum(sum((X-me).^2,2));
    SSE=sum(sum((X-Xr).^2,2));
    VAF=1-(SSE/SST); %Variability accounted for
    Rsq=corr2(X,Xr)^2; % perason corr coeff squared
  
end

