function y=t_cost(list)
y=0;
for i=2:size(list,1)
    y=y+c_cost(list(i-1,:),list(i,:));
end
end