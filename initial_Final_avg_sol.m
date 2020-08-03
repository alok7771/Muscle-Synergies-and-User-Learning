% clear;clc;
close all;
 d1 = designfilt('lowpassiir','FilterOrder',3, ...
    'HalfPowerFrequency',0.2,'DesignMethod','butter');
% Wall=transpose(cell2mat(transpose((Wsymat(tr,p))))); 

% load('E:\BME_coursework\Masters_thesis\Data_repository\all_sol\Hacmat_NDP_final.mat')
ff1=figure (1);
 set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.05, 0.4, 0.35, 0.4]);
for p=20
    
    %% initial sy
  
    Hall=(cell2mat((Hacmat(:,p)))); 
 
    for ii=1:4
           if ii==1
        sy1=sum(Wall(c1,:))./length(c1);
         H1=sum(Hall(c1,:))./length(c1);
            elseif ii==2
        sy2=sum(Wall(c2,:))./length(c2);
         H2=sum(Hall(c2,:))./length(c2);
            elseif ii==3
        sy3=sum(Wall(c3,:))./length(c3);
         H3=sum(Hall(c3,:))./length(c3);
            elseif ii==4
        sy4=sum(Wall(c4,:))./length(c4);
         H4=sum(Hall(c4,:))./length(c4);
           end
    end
   syi=[sy1;sy2;sy3;sy4];
   Hi=[H1;H2;H3;H4];
                            subplot(1,2,1,'position', [0.1, 0.1, 0.4, 0.9])
                                hold on
        
                            spider_plot(syi,'AxesInterval',2,'FillTransparency',0.2,...
   'AxesLabels','none','LabelFontSize',10,'AxesDisplay','none','FillOption','on','LineWidth',0.05,...
   'AxesFontSize',12,'AxesLabelsOffset',0.25,'LineStyle','-','MarkerSize',3,'AxesLimits',[0 0 0 0 0 0 0 0; 1 1 1 1 1 1 1 1]);
                        
%                                        text( -1.5, 0, ['P',num2str(p)], 'FontSize', 14, ...
%       'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
  
             text(0, -1.5, ['Initial W'], 'FontSize', 10, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;

        %% final sy
        finalfile=['P',num2str(p)];
        location=['E:\BME_coursework\Masters_thesis\Data_repository\all_sol\clustering_5\sort_data\final\',finalfile];
%                     load('E:\BME_coursework\Masters_thesis\Data_repository\all_sol\clustering_5\sort_data\final\finalfile.mat')
                    load(location);
                    for ii=1:4
           if ii==1
        sy1=sum(Wall(c1,:))./length(c1);
         H1=sum(Hall(c1,:))./length(c1);
            elseif ii==2
        sy2=sum(Wall(c2,:))./length(c2);
         H2=sum(Hall(c2,:))./length(c2);
            elseif ii==3
        sy3=sum(Wall(c3,:))./length(c3);
         H3=sum(Hall(c3,:))./length(c3);
            elseif ii==4
        sy4=sum(Wall(c4,:))./length(c4);
         H4=sum(Hall(c4,:))./length(c4);
           end
    end
   sy2f=[sy1;sy2;sy3;sy4];
   H2f=[H1;H2;H3;H4];
                    
                    
    sy1=syi;
    sy2=sy2f;
for j=1:4
            for k=1:4
                normsy1=sy1(:,j)./norm(sy1(:,j));
                normsy2=sy2(:,k)./norm(sy2(:,k));
                cNDP(k,j)=dot(normsy1,normsy2);
            end
end
      
             
                a=cNDP;
                aa=[[1:16]' a(:)];
                b = sortrows(aa,2,'descend');
                c=[1 5 9 13;2 6 10 14; 3 7 11 15; 4 8 12 16];
    
                if isequal(single(b(1,2)),single(b(2,2)),single(b(3,2)),single(b(4,2)))==1
                    for iii=1:4
                        [n(iii),m(iii)]=find(c==b(iii,1));

                    end
           
                else
                    for ii=1:16
                    [n(ii),m(ii)]=find(a==b(ii,2));
                    end

    %     keyboard
                    for jj=1:16
                        
                    pp=find(ismember(m,m(jj)));

                    m(:,pp(2:length(pp)))=[];
                    n(:,pp(2:length(pp)))=[];

                    qq=find(ismember(n,n(jj)));

                    n(:,qq(2:length(qq)))=[];
                    m(:,qq(2:length(qq)))=[];
                    %     keyboard
                        if length(m)==4
                        break
                        end
                    end
                    
                    
                end
    syf(m,:)=sy2f(n,:);
    Hf(m,:)=H2f(n,:);


                            subplot(1,2,2,'position', [0.5, 0.1, 0.4, 0.9])
                                       
                            spider_plot(syf,'AxesInterval',2,'FillTransparency',0.2,...
   'AxesLabels','none','LabelFontSize',10,'AxesDisplay','none','FillOption','on','LineWidth',0.05,...
   'AxesFontSize',12,'AxesLabelsOffset',0.25,'LineStyle','-','MarkerSize',3,'AxesLimits',[0 0 0 0 0 0 0 0; 1 1 1 1 1 1 1 1]);

             text(0, -1.5, ['Final W'], 'FontSize', 10, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
hold off
%% act initial
        ff2=figure(2);
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5, 0.4, 0.4, 0.4]);
%          subplot(1,8,1,'position', [0.1, 0.15, 0.3, 0.2])
subplot(4,10,1,'position', [0.1, 0.2, 0.3, 0.16])
        h1=downsample(Hi(1,:),100);
        y1 = filtfilt(d1,h1);
        hi1=plot(y1,'LineWidth',0.5,'color','b');
        hold on;
        xticks([1 2 3 4 5 6 7 8]*10^2)
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})
        
 text(0, -2.5, ['Initial H'], 'FontSize', 10, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
  hold on
  
           subplot(4,10,2,'position', [0.1, 0.4, 0.3, 0.16])
     
        h2=downsample(Hi(2,:),100);
        y2 = filtfilt(d1,h2);
        hi2=plot(y2,'LineWidth',0.5,'color','b');
        xticks([])
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})
%         
%         
        subplot(4,10,3,'position', [0.1, 0.6, 0.3, 0.16])

     
        h3=downsample(Hi(3,:),100);
        y3 = filtfilt(d1,h3);
        hi3=plot(y3,'LineWidth',0.5,'color','b');
        xticks([])
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})

      subplot(4,10,4,'position', [0.1, 0.8, 0.3, 0.16])

     
        h4=downsample(Hi(4,:),100);
        y4 = filtfilt(d1,h4);
        hi4=plot(y4,'LineWidth',0.5,'color','b');
        xticks([])
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})
        %% act final
       subplot(4,8,5,'position', [0.5, 0.2, 0.3, 0.16])

    
        h5=downsample(Hf(1,:),100);
        y5 = filtfilt(d1,h5);
        hf1=plot(y5,'LineWidth',0.5,'color','b');      
        xticks([1 2 3 4 5 6 7 8]*10^2)
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})
        
        
            subplot(4,8,6,'position', [0.5, 0.4, 0.3, 0.16])

    
        h6=downsample(Hf(2,:),100);
        y6 = filtfilt(d1,h6);
        hf2=plot(y6,'LineWidth',0.5,'color','b');      
        xticks([])
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})
        
        
        
            subplot(4,8,7,'position', [0.5, 0.6, 0.3, 0.16])

    
        h7=downsample(Hf(3,:),100);
        y7 = filtfilt(d1,h7);
        hf3=plot(y7,'LineWidth',0.5,'color','b');      
        xticks([])
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})
        
        
        
            subplot(4,8,8,'position', [0.5, 0.8, 0.3, 0.16])

    
        h8=downsample(Hf(4,:),100);
        y8 = filtfilt(d1,h8);
        hf4=plot(y8,'LineWidth',0.5,'color','b');      
        xticks([])
        xticklabels({'1e4','2e4','3e4','4e4','5e4','6e4','7e4','8e4'})
        
             text(-600, -2.8, ['Initial H'], 'FontSize', 10, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
        
        
text(400, -2, ['Final H'], 'FontSize', 10, ...
      'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
 end
 
Wname=['W',num2str(p)];
Hname=['H',num2str(p)];
savefig(ff1,Wname)
savefig(ff2,Hname)
saveas(ff1,Wname,'epsc')
saveas(ff2,Hname,'epsc')


