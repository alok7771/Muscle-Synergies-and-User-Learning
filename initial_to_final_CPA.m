for p=1:20;
namei='E:\BME_coursework\Masters_thesis\Data_repository\all_sol\clustering_5\sort_data\Initial\syp';
namef='E:\BME_coursework\Masters_thesis\Data_repository\all_sol\clustering_5\sort_data\final\syfp';
file1=[namei,num2str(p),'.mat'];
file2=[namef,num2str(p),'.mat'];
load(file1);
sy1=sy';
% delete sy.mat;
load(file2);
sy2=sy';



for j=1:4
            for k=1:4
                normsy1=sy1(:,j)./norm(sy1(:,j));
                normsy2=sy2(:,k)./norm(sy2(:,k));
                cNDP(k,j)=dot(normsy1,normsy2);
            end
      end
      
%                 cNDP_all(trc,p)={cNDP};
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
% max_ndp(trc,p)={[a(n(1),m(1)) a(n(2),m(2)) a(n(3),m(3)) a(n(4),m(4))]};
% 
% mall(trc,:)=m;% local and valid only for one participant
% Wsymat(1,p)=Wsy(1,p);
sy2_sort=zeros(size(sy2));
sy2_sort(:,m)=sy2(:,n);


for kk=1:4
cpa(p,kk)=subspace(sy1(:,kk),sy2_sort(:,kk))*90/(pi/2);
end

end