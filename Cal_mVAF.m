clear all; close all;clc;
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
% mVAF=zeros(15,20);
result=('nnmf: bestVAF of 50: W based on that: 5 muscle synergies: norm of each row of X');
for p=5
   part= ['EF_data.EF',num2str(p)];
   for tr=7
       tic
       if isempty(fieldnames(eval([part,'.Trial_',num2str(tr)])))==1
       Vc=0;
       disp('no RAW data')
       else     
       trial=[part,'.Trial_',num2str(tr),'.RAW']; 
       data = eval(trial);
       mat=abs(permute(data,[2,1,3]));
       Xa=mat(:,:);
       X=Xa./max(Xa,[],2);
       [Wsy,Hac,Vc,r2] = calSynergy_VAF(X);
       disp(trial)
       toc
       end
       mVAF(tr,p)=Vc;
       rsq(tr,p)=r2;
       W_sy(tr,p)={Wsy};
       H_ac(tr,p)={Hac};
   end
fprintf('combination p=%i  tr=%i \n', p, tr);
         
        
end
 save('sy_nnmf_bestof50_8W')
% ---------------------------- Information ---------------------------
% This program gives a max VAF value from defined 'i' iterations for the 
% same dataset iterating again and again to ensure if reconstruction is going well or not.



function [Wsy,Hac,Vc,r2] = calSynergy_VAF(X)
%%%%i= number of iterations for checking the least reconstruction accuracy
for i=1:50
    
%% Extracting syngergies
nSy=8;  %number of synergies we want to extract%
%     W0=ones(8,4)*100; H0=ones(4,size(X,2))*100;
    [W,H]=nnmf(X,nSy);
%     opt = statset('MaxIter',200,'Tolfun',1e-8,'TolX',1e-6);
%     [W,H]=nnmf(X,nSy,'w0',W0,'h0',H0,'options',opt,'algorithm','als');
    WSy(i)={W};% to see values use cell2mat(WSy(2))%%
    HAc(i)={H};
    Xr=W*H;
    me=mean(X,2);
    SST=sum(sum((X-me).^2,2));
    SSE=sum(sum((X-Xr).^2,2));
    VAF=1-(SSE./SST); %Variability accounted for
    Rsq=corr2(X,Xr).^2; % perason corr coeff squared
  

V(i,:)=VAF;
[Vc,n]=max(V); %cutoff V%
R_sq(i,:)=Rsq;
r2=R_sq(n);
Wsy=cell2mat(WSy(n)); 
Hac=cell2mat(HAc(n));
end

end


