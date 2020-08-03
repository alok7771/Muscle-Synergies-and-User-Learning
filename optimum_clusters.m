%% optimum clusters

clust = zeros(size(Wall,1),6);
for i=1:6
clust(:,i) = kmeans(Wall,i,'emptyaction','singleton',...
        'replicate',5);
end
va = evalclusters(Wall,clust,'CalinskiHarabasz');
k=va.OptimalK;
p=20;  
%% k means clustering
for i=1
% Wall=transpose(cell2mat(transpose((Wsymat(tr,p))))); 

[idx,C,sumd,D] = kmeans(Wall,k,'MaxIter',10000,'Distance','cosine');
% [idx,C,sumd,D] = kmedoids(Wall,4,'Options',statset('MaxIter',10000),'Distance','cosine','Algorithm','large','PercentNeighbors',0.20,'Start','sample');
c1=(find(idx==1));
c2=(find(idx==2));
c3=(find(idx==3));
c4=(find(idx==4));
if k==5
    c5=(find(idx==5));
    cl5=length(c5);
end
if k==6
    c6=(find(idx==6));
    cl6=length(c6);
end

if k==7
    c7=(find(idx==7));
    cl7=length(c7);
end
cl1=length(c1);
cl2=length(c2);
cl3=length(c3);
cl4=length(c4);

plot(c1,ones(length(c1)),'*')
hold on
plot(c2,2*ones(length(c2)),'*')
plot(c3,3*ones(length(c3)),'*')
plot(c4,4*ones(length(c4)),'*')
plot(c5,5*ones(length(c5)),'*')
% cl=[cl1 cl2 cl3 cl4 cl5 cl6];

    
end

