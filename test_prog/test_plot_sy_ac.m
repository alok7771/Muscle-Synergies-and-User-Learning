%% plotting muscle syngergies
close all
for p=4
    for tr=1:15
        sy=cell2mat(W_sy(tr,p));
        W1=sy(:,1);
        W2=sy(:,2);
        W3=sy(:,3);
        W4=sy(:,4);
        
       
       k=1; % synergy number (1:4)
        name=['Synergy.W1','.P',num2str(p)];
        f1=figure('Name',name)
        aa=[0.1 0.3 0.5 0.7];
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [aa(k), 0.05, 0.2, 0.9]);
        subplot(15,1,tr,'align')
%       bar(sy(:,k)./max(sy(:,k)))
        bar(W1./max(W1));
        hold on
       
     
%         pause(1)
        
        
        
    end
end
