% Wsy=Wsy;
for p=1:20
      for trc=1:14 %trial combination
        if trc==1
            sy1=cell2mat(Wsy(trc,p));
            Hac1=cell2mat(Hac(trc,p));
        else
            sy1=cell2mat(Wsymat(trc,p));
        end
        
        sy2=cell2mat(Wsy(trc+1,p));
        Hac2=cell2mat(Hac(trc+1,p));
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
%     keyboard
max_ndp(trc,p)={[a(n(1),m(1)) a(n(2),m(2)) a(n(3),m(3)) a(n(4),m(4))]};

mall(trc,:)=m;% local and valid only for one participant
Wsymat(1,p)=Wsy(1,p);
sy2_sort=zeros(size(sy2));
sy2_sort(:,m)=sy2(:,n);
Wsymat(trc+1,p)={sy2_sort};


Hacmat(1,p)=Hac(1,p);
Hac_sort=zeros(size(Hac2));
Hac_sort(m,:)=Hac2(n,:);
Hacmat(trc+1,p)={Hac_sort};
      end
%       for ii=1:14
% unichk(ii,:)=unique(mall(ii,:));
%       end

end
