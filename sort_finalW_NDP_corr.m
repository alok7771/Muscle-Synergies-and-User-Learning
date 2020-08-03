for p=2
for tr=1:15
sy1=cell2mat(W10(tr,p));
sy2=cell2mat(W50(tr,p));

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
    sy2_sort(:,m)=sy2(:,n);
  
    nsy1=[sy1(:,1)/norm(sy1(:,1)) sy1(:,2)/norm(sy1(:,2)) sy1(:,3)/norm(sy1(:,3)) sy1(:,4)/norm(sy1(:,4))];
    nsy2=[sy2_sort(:,1)/norm(sy2_sort(:,1)) sy2_sort(:,2)/norm(sy2_sort(:,2)) sy2_sort(:,3)/norm(sy2_sort(:,3)) sy2_sort(:,4)/norm(sy2_sort(:,4))];
[nsy1;1.1111 1.1111 1.1111 1.1111; nsy2]

[cNDP(n(1),m(1)) cNDP(n(2),m(2)) cNDP(n(3),m(3)) cNDP(n(4),m(4))]
[p tr]

pause
end
end