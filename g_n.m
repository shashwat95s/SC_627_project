function y= g_n(list,can)
cost=0;
for i=2:length(list)
    cost=cost+c_cost(list(i-1),list(i));
end
y=cost+cost(list(end),can);