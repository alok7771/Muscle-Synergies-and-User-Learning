close all
  
for p=8
        name=['Synergy_W(1-4)','_P',num2str(p)];
        f1=figure('Name',name);
        aa=[0.1 0.3 0.5 0.7];
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.05, 0.75, 0.9]);
 for tr=[1:11 13 14 15]
        sy=cell2mat(Wsymat(tr,p));
            for k=1:4
                
            subplot(15,4,4*(tr-1)+k)
%             yticks([0 1])
            bar(sy(:,k)./norm(sy(:,k)))% normalized
            if tr==1
       text( 4.5, 1, ['W',num2str(k)], 'FontSize', 15, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
            end
            
            if k==1
             text(-3, 0, ['tr=',num2str(tr)], 'FontSize', 12, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
            end
            set(gca, 'FontName', 'Courier')
            H=gca;
            H.LineWidth=0.25;
            %             H.FontName='Georgia';
            %             H.Title.FontName='Georgia';
            H.YLimMode='manual';
            ylim([0 1]);
            yticks([0 1])

            xticks([])

            %             yticklabels({0,1})
            
            %  bar(sy(:,k)./(1.0e+05))% absolute
            hold on
            if tr==15
                xticks([1 2 3 4 5 6 7 8])
                xticklabels({'m_1','m_2','m_3','m_4','m_5','m_6','m_7','m_8'})
            end
            end
            
 end
 hold off
 axes( 'Position', [0, 0.95, 1, 0.05] ) ;
 set( gca, 'Color', 'None', 'XColor', 'none', 'YColor', 'none' ) ;
 text( 0.5, 0, ['Muscle synergy structure for participant  ',num2str(p)], 'FontSize', 14, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
%         suptitle(['Muscle synergy structure for participant  ',num2str(p)])
        filename1 = [name '.fig'];
        filename2 = [name '.png'];
        saveas(gcf,filename1)
        saveas(gcf,filename2)
 end


        
