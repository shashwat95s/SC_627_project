% gives path position as function of l (center line)

function [x,y,th]=pathl(l)

if l<10
    theta=45;
    x=l*cosd(theta);
    y=l*sind(theta)+10;
    th=theta;
elseif l<25
    theta=90+45-(l-10)*9;
    x1 =11.5683;
    y1 =12.5739;
    x=x1+6.36*cosd(theta);
    y=y1+6.36*sind(theta);
    if theta==90
        th=0;
    else
        th=atand(-1/tand(theta));
    end
else
    x2=17.9283;
    y2=12.5739;
    th=-90;
    x=x2;
    y=y2-(l-25);
end
end