% load('P3.mat')
% load('Hacmat_NDP_final.mat')
% for sider plot go to plot)spider_final
%this code is for H and plots sorted clustering solutions 
 d1 = designfilt('lowpassiir','FilterOrder',3, ...
    'HalfPowerFrequency',0.2,'DesignMethod','butter');
for p=19
Hall=(cell2mat((Hacmat(:,p)))); 

for tr=1:15
        f1=figure(1);
    for ii=1:4
           if ii==1
        H1=Hall(c1(tr),:);
            elseif ii==2
        H2=Hall(c2(tr),:);
            elseif ii==3
        H3=Hall(c3(tr),:);
            elseif ii==4
        H4=Hall(c4(tr),:);
           end
    end
    H=[H1;H2;H3;H4];
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
             text(-180, 0, ['tr=',num2str(tr)], 'FontSize', 12, ...
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
end
