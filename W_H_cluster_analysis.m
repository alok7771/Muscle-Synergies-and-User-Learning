% clear;clc;
% load('Wsymat_NDP_final.mat')
p=20;  
%% k means clustering
for i=1:100
tr=11:15;
Wall=transpose(cell2mat(transpose((Wsymat(tr,p))))); 

[idx,C,sumd,D] = kmeans(Wall,4,'MaxIter',10000,'Distance','cosine');
% [idx,C,sumd,D] = kmedoids(Wall,4,'Options',statset('MaxIter',10000),'Distance','cosine','Algorithm','large','PercentNeighbors',0.20,'Start','sample');
c1=(find(idx==1));
c2=(find(idx==2));
c3=(find(idx==3));
c4=(find(idx==4));
cl1=length(c1);
cl2=length(c2);
cl3=length(c3);
cl4=length(c4);
cl=[cl1 cl2 cl3 cl4];
% if cl(1,1:4)==[15 15 15 15]
    if cl(1,1:4)==[5 5 5 5] %5 cluster size
    disp('solution achieved')
    
    keyboard
%     break
end

end
cl


%% cluster Wsy





%% bar plot
     
     
% for ii=1:4
%         f1=figure(ii);
%         
%         for tr=1:cl(ii) 
%             if ii==1
%         sy=Wall(c1(tr),:);
%             elseif ii==2
%         sy=Wall(c2(tr),:);
%             elseif ii==3
%         sy=Wall(c3(tr),:);
%             elseif ii==1
%         sy=Wall(c4(tr),:);
%             end
%         
%         aa=[0.1 0.3 0.5 0.7];
%         subplot(cl(ii),1,tr,'align')
%         set(gcf, 'Units', 'Normalized', 'OuterPosition', [aa(ii), 0.05, 0.2, 0.9]);
%         bar(sy./norm(sy))% normalized
%         hold on
%         end
% end
 
%% spider plot
% for tr=1:15
%         f1=figure(1);
%     for ii=1:4
%            if ii==1
%         sy1=Wall(c1(tr),:);
%             elseif ii==2
%         sy2=Wall(c2(tr),:);
%             elseif ii==3
%         sy3=Wall(c3(tr),:);
%             elseif ii==4
%         sy4=Wall(c4(tr),:);
%            end
%     end
%     sy=[sy1;sy2;sy3;sy4];
%         subplot(4,5,tr)
%         hold on
%         set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.9, 0.2, 0.9]);
% spider_plot(sy,'AxesInterval',4,'FillTransparency',0.25,...
%    'AxesLabels','none','AxesDisplay','none','FillOption','on','LineWidth',0.05,...
%    'LineStyle','-','MarkerSize',4);
% end
%         
% % pause(0.1)

    

%% optimum clusters
% clust = zeros(size(Wall,1),6);
% for i=1:6
% clust(:,i) = kmeans(Wall,i,'emptyaction','singleton',...
%         'replicate',5);
% end
% va = evalclusters(Wall,clust,'CalinskiHarabasz')

%% equal size clusters
% p1=Wall';
% p2=normc(p1);
% for i=1:60
%     for j=1:60
%         if i==j
%             dist(i,j)=0;
%         else
%     dist(i,j)=dot(p2(:,i),p2(:,j));
%         end
%     end
% end





