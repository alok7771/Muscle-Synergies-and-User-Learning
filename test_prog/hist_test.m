pd = makedist('Normal',0,i);
    t = truncate(pd,-10,10);
    r = random(t,10000,1);
    hi=histogram(Xa(1,:),'Normalization','count')