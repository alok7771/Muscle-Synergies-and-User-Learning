
close all
  d1 = designfilt('lowpassiir','FilterOrder',3, ...
    'HalfPowerFrequency',0.2,'DesignMethod','butter');

for p=3
        name=['Activation coefficiennts_H(1-4)','_P',num2str(p)];
        f1=figure('Name',name);
        aa=[0.1 0.3 0.5 0.7];
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.1, 0.8, 0.9]);
 for tr=1:15
        H=cell2mat(Hacmat(tr,p));
            for k=1:4
                
            subplot(15,4,4*(tr-1)+k)


%             h=H(k,:);
            h=downsample(H(k,:),100);
         
            y = filtfilt(d1,h);
            plot(y,'LineWidth',0.5,'color','b')


            if tr==1
       text( 425, 1, ['H',num2str(k)], 'FontSize', 15, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
            end
            
            if k==1
             text(-220, 0, ['tr=',num2str(tr)], 'FontSize', 12, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
            end
            set(gca, 'FontName', 'Courier')
            T=gca;
            T.LineWidth=0.75;

            T.YLimMode='manual';
%             T.XLimMode='manual';
            xticks([])
            yticks([0 0.5 1])
            hold on
            if tr==15
                xticks([1 2 3 4 5 6 7 8]*10^2)
                xtickangle(45)
                xticklabels({'1x10^4','2x10^4','3x10^4','4x10^4','5x10^4','6x10^4','7x10^4','8x10^4'})
            end
            end
            
 end
 hold off
 axes( 'Position', [0, 0.95, 1, 0.05] ) ;
 set( gca, 'Color', 'None', 'XColor', 'none', 'YColor', 'none' ) ;
 text( 0.5, 0, ['Activation coefficients structure for participant  ',num2str(p)], 'FontSize', 14, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;

        filename1 = [name '.eps'];
        saveas(gcf,filename1,'epsc')
        filename2 = [name '.png'];
        saveas(gcf,filename2)
        filename3 = [name '.fig'];
        saveas(gcf,filename3)
 end


        

% H=cell2mat(Hacmat(3,4));
% h=H(4,:);
% x=h;
% % y = downsample(x,100);
% y = filtfilt(d1,x);
% 
% % plot(x)
% hold on
% plot(y,'LineWidth',1)
