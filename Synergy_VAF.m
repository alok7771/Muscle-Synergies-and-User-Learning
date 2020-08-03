% ---------------------------- Information ---------------------------
% This program gives a min VAF value from defined 'i' iterations for the 
% same dataset iterating again and again to ensure if reconstruction is going well or not.



function [Wsy,Hac,Vc] = Synergy_VAF(X)
%%%%i= number of iterations for checking the least reconstruction accuracy
for i=1:25
    
%% Extracting syngergies
nSy=4;  %number of synergies we want to extract%
%     W0=ones(8,4)*100; H0=ones(4,size(X,2))*100;
    [W0,H0]=nnmf(X,nSy);
    opt = statset('MaxIter',200,'Tolfun',1e-8,'TolX',1e-6);
    [W,H]=nnmf(X,nSy,'w0',W0,'h0',H0,'options',opt,'algorithm','als');
    WSy(i)={W};% to see values use cell2mat(WSy(2))%%
    HAc(i)={H};
    Xr=W*H;
    me=mean(X,2);
    SST=sum(sum((X-me).^2,2));
    SSE=sum(sum((X-Xr).^2,2));
    VAF=1-(SSE./SST); %Variability accounted for
%     Rsq(nSy)=corr2(X,Xr).^2; % perason corr coeff squared
  

V(i,:)=VAF;
[Vc,n]=min(V); %cutoff V%
Wsy=cell2mat(WSy(n)); 
Hac=cell2mat(HAc(n));
end

end
