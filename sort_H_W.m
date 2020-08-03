%% Intro
%This program sorts synergy structure and shuffles them based on their NDP with next trial



for p=4
    
        for tr=1:14
            disp('combinattion is') 
                disp(tr)
                
            if tr==1
               sy_1=cell2mat(W_sy(tr,p));
            else
                sy_1=cell2mat(M_sy(tr,p));
            end
        M_sy(1,p)=W_sy(1,p);
        sy_2=cell2mat(W_sy(tr+1,p));
        for j=1:4
            for k=1:4
                normsy1=sy_1(:,j)./norm(sy_1(:,j));
                normsy2=sy_2(:,k)./norm(sy_2(:,k));
                cNDP(k,j)=dot(normsy1,normsy2);
                              
            end
            
        end
        c_NDP_data(tr,p)={cNDP};
        [maxc,n]=max(cNDP);
        
        
%         if length(n) == length(unique(n))
%             sy_2re=sy_2(:,[n]);%rearrangng columns
%         else
% %             length(unique(n)) == 1
% %             n = sort(n)
% %             keyboard
%         [chk, bin] = histc(n, unique(n));
%             %get index of repetitive values
%             %compare the index relativity
%             %if higher assign accordingly
%         multiple = find(chk > 1);
%         index    = find(ismember(bin, multiple));
%         if maxc(index(1))>maxc(index(2)) %%% limitation is one time repet of same index
%             n(index(1))=index(1);
%                 n(index(2))=index(2);
%             else
%                 n(index(1))=index(2);
%             end
%             sy_2re=sy_2(:,[n]);
%         end  
            M_sy(tr+1,p)={sy_2re};
                order(tr,p)={n};
                
               cell2mat(c_NDP_data(tr,p))
               n
               [[[1 2 3 4]*1.0e+05 ; cell2mat(W_sy(tr+1,p))] zeros(9,1) [n.*1.0e+05;cell2mat(M_sy(tr+1,p))]]

        end
end
%                [cell2mat(W_sy(tr,p)) cell2mat(M_sy(tr,p))]

