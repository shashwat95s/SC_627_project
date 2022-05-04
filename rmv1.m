%remove first element of vector
function out= rmv1(list)
if length(list)>1
for i=2:length(list)
temp(i-1)=list(i);
end
else
temp=[];
end
out=temp;