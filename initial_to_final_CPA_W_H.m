% clear;clc;
close all;
 d1 = designfilt('lowpassiir','FilterOrder',3, ...
    'HalfPowerFrequency',0.2,'DesignMethod','butter');
% Wall=transpose(cell2mat(transpose((Wsymat(tr,p))))); 

% load('E:\BME_coursework\Masters_thesis\Data_repository\all_sol\Hacmat_NDP_final.mat')
% ff1=figure (1);
%  set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.05, 0.4, 0.35, 0.4]);
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
%                             subplot(1,2,1,'position', [0.1, 0.1, 0.4, 0.9])
%                                 hold on
%         
%                             spider_plot(syi,'AxesInterval',2,'FillTransparency',0.2,...
%    'AxesLabels','none','LabelFontSize',10,'AxesDisplay','none','FillOption','on','LineWidth',0.05,...
%    'AxesFontSize',12,'AxesLabelsOffset',0.25,'LineStyle','-','MarkerSize',3,'AxesLimits',[0 0 0 0 0 0 0 0; 1 1 1 1 1 1 1 1]);
%                         
% %                                        text( -1.5, 0, ['P',num2str(p)], 'FontSize', 14, ...
% %       'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;
%   
%              text(0, -1.5, ['Initial W'], 'FontSize', 10, ...
%       'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom','FontName', 'Courier' ) ;

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
    syii=syi'; syff=syf';Hii=Hi';Hff=Hf';
for kk=1:4
cpaW(p,kk)=subspace(syii(:,kk),syff(:,kk))
% cpaH(p,kk)=subspace(Hii(:,kk),Hff(:,kk))
meani(:,kk)=mean(Hii(:,kk))
sdi(:,kk)=std(Hii(:,kk))
meanf(:,kk)=mean(Hff(:,kk))
sdf(:,kk)=std(Hff(:,kk))
end
 end
 



