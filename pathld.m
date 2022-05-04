% gives path position as function of l and d
function [x,y]=pathld(l,d)
[xl,yl,thl]= pathl(l);
    x=xl+d*cosd(thl+90);
    y=yl+d*sind(thl+90);
end
    