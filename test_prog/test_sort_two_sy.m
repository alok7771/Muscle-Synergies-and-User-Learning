W_sy=Wsy;
p=1;
trc=2;
      sy1=cell2mat(W_sy(trc,p));
      sy2=cell2mat(W_sy(trc+1,p));
      for j=1:4
            for k=1:4
                normsy1=sy1(:,j)./norm(sy1(:,j));
                normsy2=sy2(:,k)./norm(sy2(:,k));
                cNDP(k,j)=dot(normsy1,normsy2);
            end
      end
      cNDP_all(trc,p)={cNDP};
    a=cNDP;
    aa=[[1:16]' a(:)];
    b = sortrows(aa,2,'descend');
    
    for i=1:16
    [n(i),m(i)]=find(a==b(i,2));
    
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
%     keyboard
    
    
    sy2_sort=zeros(size(sy2));
    sy2_sort(:,n)=sy2(:,m);
    
    for k=1:4 % synergy number (1:4)
          name=['Synergy_W',num2str(k),'_P',num2str(p)];
          f1=figure('Name',name);
       
        sy=sy1;
        aa=[0.1 0.3 0.5 0.7];
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [aa(k), 0.25, 0.2, 0.5]);
        subplot(3,1,1,'align')
        bar(sy1(:,k)./norm(sy1(:,k)))% normalized
        title('sy1');
%         bar(sy(:,k)./(1.0e+05))% absolute
        hold on
        subplot(3,1,2,'align')
        bar(sy2_sort(:,k)./norm(sy2_sort(:,k)))% normalized
        title('sy2 - sort');
        subplot(3,1,3,'align')
        bar(sy2(:,k)./norm(sy2(:,k)))% normalized
        title('sy2')
        end

    
