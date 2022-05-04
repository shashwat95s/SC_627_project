function [list,list_b,o_cost]=addto(n_b,b_cost,list,list_b,o_cost,cand)

if(isempty(list))

    list(1,:)=cand;
    list_b(1,:)=n_b;
    o_cost(1)=h_cost(cand)+c_cost(n_b,cand);
    
else
    fl=0;
    for i=1:size(list,1)
    
    if (b_cost-h_cost(n_b)+c_cost(n_b,cand)+h_cost(cand))<o_cost(i)
        for j= i:size(list,1)
            temp(j-i+1,:)=list(j,:);
            tempb(j-i+1,:)=list_b(j,:);
            tempc(j-i+1)=o_cost(j);
        end
        list(i,:)=cand;
        list_b(i,:)=n_b;
        o_cost(i)=b_cost-h_cost(n_b)+c_cost(n_b,cand)+h_cost(cand);
        
        for j= i+1:size(list,1)+1
            list(j,:)=temp(j-i,:);
            list_b(j,:)=tempb(j-i,:);
            o_cost(j)=tempc(j-i);
        end
        fl=1;
        break;
        
    end
end
if fl==0
    list(end+1,:)=cand;
    list_b(end+1,:)=n_b;
    o_cost(end+1)=b_cost-h_cost(n_b)+c_cost(n_b,cand)+h_cost(cand);
end
end
end


    