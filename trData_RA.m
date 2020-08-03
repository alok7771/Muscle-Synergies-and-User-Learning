%% Introduction
% This program compares data matrix X with recreated data matrix Xr
% Compares X and Xr ang gives VAF  and Rsq
% Plots the synergies 


clear all; close all;clc;
%% Insert the data location/ change as per your data location
load ('E:\BME_coursework\Masters_thesis\biopatrec_master\presigTreated.mat')
disp (sigTreated.cmt)
trData=sigTreated.trData;
mat=(permute(trData,[2,1,3]));
% X=[mat(:,:)].^2;
X=abs(mat(:,:));
n=length(sigTreated.nCh); %number of electrodes%
% nSy=5;
%% Extracting syngergies
for nSy=1:8  %number of synergies we want to extract%
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
   
   %% Plotting Synergies
    figure (nSy);
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.25, 0.2, 0.5, 0.12+nSy*0.085]);
for k=1:nSy
    subplot(nSy,1,k)
    bar(W(:,k)./max(W(:,k)));
    hold on
end
end

% pW=pinv(W);
% pWp=pW(:,1:2:end);
% % %% electrode wise variance in data
% % SSE=var(W*H,0,2); %variance(sum of square errors)%
% % SST=var(X,0,2); %variance(total sum of squares)%
% % sqR(:,nSy)=1-(SSE./SST); % column 1= var because of nSy=1%
% % 
% % %% Total variance in data
% % tSST=var(var(X,0,2));
% % tSSE=var(var(W*H,0,2));
% % tsqR(:,nSy)=1-(tSSE/tSST); % column 1= var because of nSy=1%

  