%% Intro
% calculates synergy
% calculates for VAF and Rsq

clear all; close all;clc;
load ('E:\BME_coursework\Masters_thesis\Data_repository\Data_EF_group_RAW_only\Data_EF_group_RAW_only.mat')
data=EF_data.EF1.Trial_1.RAW;
mat=abs(permute(data,[2,1,3]));
X=mat(:,:);
for i=1
n=8; %number of electrodes%
% nSy=5;
%% Extracting syngergies
for nSy=4  %number of synergies we want to extract%
    [W,H]=nnmf(X,nSy);
    WSy(nSy)={W};% to see values use cell2mat(WSy(2))%%
    Xr=W*H;
    me=mean(X,2);
    SSR=sum((Xr-me).^2,2);
%     SST=var(X,0,2)*size(X,2);
    SST(:,nSy)=sum(sum((X-me).^2,2));
    SSE(:,nSy)=sum(sum((X-Xr).^2,2));
    VAF=1-(SSE./SST); %Variability accounted for
    Rsq(nSy)=corr2(X,Xr).^2; % perason corr coeff squared
%     [R,P]=corrcoef(X,Xr);
%     r(nSy)=R(1,2).^2;
   for m=1:n
    sqR(m,nSy)=(corr((transpose(X(m,:))),transpose(Xr(m,:))).^2);
    
%     plot(sqR(m,:));
%     hold on
   end
   
   % Plotting Synergies
    figure (nSy);
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.25, 0.2, 0.5, 0.12+nSy*0.085]);
for k=1:nSy
    subplot(nSy,1,k)
    bar(W(:,k)./max(W(:,k)));
    hold on
end
end
V(i,:)=VAF;
end

  