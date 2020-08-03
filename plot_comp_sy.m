
  close all
for p=1
       
      for k=1:4 % synergy number (1:4)
          name=['Synergy_W',num2str(k),'_P',num2str(p)];
          f1=figure('Name',name);
%        text(0.5, 0.98,'Title')
        for tr=1:15
        sy=cell2mat(Wsymat(tr,p));
        aa=[0.1 0.3 0.5 0.7];
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [aa(k), 0.05, 0.2, 0.9]);
        subplot(15,1,tr,'align')
        bar(sy(:,k)./norm(sy(:,k)))% normalized
%         bar(sy(:,k)./(1.0e+05))% absolute
%   Title=('name');
%   text(0.5, 0.98,'Title')
        hold on
        end
        
%       filename1 = ['abs_',name '.fig'];
%       filename2 = ['abs_',name '.png'];
%       saveas(gcf,filename1)
%       saveas(gcf,filename2)
      end  
end
