%remove first element of list
function out= rmv(list)
if size(list,1)>1
for i=2:size(list,1)
temp(i-1,:)=list(i,:);
end
else
temp=[[],[]];
end
out=temp;