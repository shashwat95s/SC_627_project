function [Open, o_back,o_cost]=  expand(n_best,best_c,o_cost,D,Open,o_back)
l=n_best(1);
d=n_best(2);
D=[-1,-0.75,-0.5,-0.25,0,1];
for i=1:length(D)
        cand(i,:)=[l+1,D(i)];
end

for i=1:size(cand,1)
    
    [Open, o_back,o_cost]=addto(n_best,best_c,Open,o_back,o_cost,cand(i,:));
    
    
end

end
        
