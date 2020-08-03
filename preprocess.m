function [mat]= preprocess(recSession)
cTp=0.7;
tdata=recSession.tdata;
sF=recSession.sF;
nM=recSession.nM;
nR=recSession.nR;
cT=recSession.cT;
for n=1
   Adata=tdata(:,:,n);
   for m=1:nR
      mat=Adata(2*(m-1)*sF*cT+1:2*m*sF*cT);
      cut=(sF*cT-sF*cT*cTp)/2;
      mat2=mat(cut+1:sF*cT-cut);
      mat3(:,m)=mat2;
      matcT=mat3(:);

   end
%    trdata(n,:)=matcT;
end

end