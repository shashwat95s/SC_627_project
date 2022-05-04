function y= c_cost(prev,curr)
% if prev(1)== 15 && curr(2)<0
%     y=500;
% else
    
[x1,y1]=pathld(prev(1),prev(2));
[x2,y2]=pathld(curr(1),curr(2));
y=sqrt((x1-x2)^2+(y1-y2)^2)*(1+curr(2)^2 /100);

end