function y= h_cost(curr)
l=curr(1);
d=curr(2);
if l==30
    y=0;
elseif l<10 || l>25
    y=(29-l)+sqrt(d^2 +1);
else
    y=(135-9*(l-10))*2*pi*(6.36+d)/360+4+sqrt(d^2 +1);
end