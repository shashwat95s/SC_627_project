function in= find_in(list,cand)
f=0;
for i=1:size(list,1)
    if cand(1)== list(i,1) && cand(2)== list(i,2)
        in=i;
        f=1;
    end
end
if f==0
    in=0;
end
