%% plotting muscle syngergies on base W data from NMF
close all
for p=7
   
       
      for k=1:4 % synergy number (1:4)
        name=['Synergy_W',num2str(k),'_P',num2str(p)];
        f1=figure('Name',name)
        for tr=1:15
        sy=cell2mat(W_sy(tr,p));
        aa=[0.1 0.3 0.5 0.7];
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [aa(k), 0.05, 0.2, 0.9]);
        subplot(15,1,tr,'align')
        bar(sy(:,k)./max(sy(:,k)))% normalized
%         bar(sy(:,k)./(1.0e+05))% absolute
        hold on
        end
%       filename1 = ['norm',name '.fig'];
%       filename2 = ['norm',name '.png'];
%       saveas(gcf,filename1)
%       saveas(gcf,filename2)
      end  
    end



%     k=1; % synergy number (1:4)
%         name=['Synergy.W1','.P',num2str(p)];
%         f1=figure('Name',name)
%         aa=[0.1 0.3 0.5 0.7];
%         set(gcf, 'Units', 'Normalized', 'OuterPosition', [aa(k), 0.05, 0.2, 0.9]);
%         subplot(15,1,tr,'align')
% %       bar(sy(:,k)./max(sy(:,k)))
%         bar(W1./max(W1));
%         hold on
%        
%      
% %         pause(1)
        