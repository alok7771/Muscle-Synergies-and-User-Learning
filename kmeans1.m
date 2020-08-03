load('Wsy_of_sy_nnmf_bestof50.mat')
Wall=transpose(cell2mat(transpose((W_sy(:,7))))); 
X = Wall;%initialize dataset here
K = 4;
max_iterations = 1000;
centroids = initCentroids(X, K);


for i=1%:max_iterations
  [mm,nn,indices] = getClosestCentroids(X, centroids);
  centroids = computeCentroids(X, indices, K);
end

% [length(find(indices==1))
% length(find(indices==2))
% length(find(indices==3))
% length(find(indices==4))]
function centroids = initCentroids(X, K)
    centroids = zeros(K,size(X,2)); 
    randidx = randperm(size(X,1));
    centroids = X(randidx(1:K), :);
end
  
% function indices = getClosestCentroids(X, centroids)
%   K = size(centroids, 1);
%   indices = zeros(size(X,1), 1);
%   m = size(X,1);
% 
%   for i=1:m
%     k = 1;
%     min_dist = sum((X(i,:) - centroids(1,:)) .^ 2);
%     for j=2:K
%         dist = sum((X(i,:) - centroids(j,:)) .^ 2);
%         if(dist < min_dist)
%           min_dist = dist;
%           k = j;
%         end
%     end
%     indices(i) = k;
%     
%   end
% end


function [mm,nn,indices] = getClosestCentroids(X, centroids)
  K = size(centroids, 1);
  indices = zeros(size(X,1), 1);
  m = size(X,1);

  for i=1:m
    for k = 1:4
%     dist(i,k) = sum((X(i,:) - centroids(k,:)) .^ 2);
sy=X(i,:)./norm(X(i,:));
dist(i,k)=dot(sy,centroids(k,:)./norm(centroids(k,:)));
    end
  end
  dist2=dist;
%    aa=[[1:60]' dist2];
%    b1 = sortrows(aa,2,'descend');
%    b2 = sortrows(aa,3,'descend');
%    b3 = sortrows(aa,4,'descend');
%    b4 = sortrows(aa,5,'descend');
   keyboard
   for ii=1:size(X,1)
    mx=max(max(dist2));
  [mmm,nnn]=find(dist2==mx);
  mm(ii)={mmm};
  nn(ii)={nnn};
  fprintf('iter m and n values are')
  disp(ii)
  disp([mmm nnn])
  
%    fprintf('iter, m and n:=%i, [%d, %d]\n',ii, mmm,nnn)
%    ['Vector is: [',sprintf('%d [%6.3f] [%6.3f]\n',ii,mmm,nnn),']']
   keyboard
  for jj=1:length(mmm)
      dist2(mmm(jj),nnn(jj))= 10^-14;
  end
  keyboard
   end
%   
indices=0;
%   keyboard
end

%                 aa=[[1:60]' dist(:)];
%                 b = sortrows(aa,2,'ascend');
%     
%         if(dist < min_dist)
%           min_dist = dist;
%           k = j;
% 
%         end
%    
%     indices(i) = k;
%     
%     end

function centroids = computeCentroids(X, idx, K)

  [m n] = size(X);
  centroids = zeros(K, n);
  
  for i=1:K
    xi = X(idx==i,:);
    ck = size(xi,1);
     centroids(i, :) = (1/ck) * sum(xi);
%     centroids(i, :) = (1/ck) * [sum(xi(:,1)) sum(xi(:,2))];
  end
end


