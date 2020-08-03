%% for Wsymat based plot
for p=3
    for tr=1
        f=figure(1);
%         subplot(3,5,tr)
spider_plot((cell2mat(Wsymat(tr,p)))','AxesInterval',2,'FillTransparency',0.2,...
   'AxesLabels',{'m1','m2','m3','m4','m5','m6','m7','m8'},'LabelFontSize',10,'AxesDisplay','all','FillOption','on','LineWidth',0.05,...
   'AxesFontSize',9,'AxesLabelsOffset',0.25,'LineStyle','-','MarkerSize',3,'AxesLimits',[0 0 0 0 0 0 0 0; 1 1 1 1 1 1 1 1]);
% pause(0.1)
% 'AxesLabels',{'m1','m2','m3','m4','m5','m6','m7','m8'}
    end
    

% filename1 = ['NDP-P-',num2str(p) '.png'];
% saveas(gcf,filename1)
% name=['NDP-P-',num2str(p)];
% saveas(figure,'name','epsc');
% print(figure,'name',-depsc2');
end
     
%% for Hacmat based plots


% for p=1
%     for tr=1
%         f=figure(1);
% %         subplot(3,5,tr)
% a=(cell2mat(Hacmat(tr,p)));
% 
% for k=1:4
% b(k,:)=a(k,:)./norm(a(k,:));   
% idx = 1:72000;                                 % Index
% idxq = linspace(min(idx), max(idx), 500);    % Interpolation Vector
% aa = interp1(idx, b(k,:), idxq, 'linear');       % Downsampled Vector
% aaa(:,k)=aa;
% end
% 
% spider_plot(aaa','AxesInterval',4,'FillTransparency',0.25,...
%    'AxesLabels','none','AxesDisplay','none','FillOption','on','LineWidth',0.05,...
%    'LineStyle','-','MarkerSize',4);
% % pause(0.1)
%     end
% end

%%

% b1=smoothdata(aaa,1,'movmedian',20);
% spider_plot((cell2mat(Wsymat(tr,p)))','AxesLabels','none',...
%     'AxesDisplay','none','FillOption','on','LineWidth',0.0,5);