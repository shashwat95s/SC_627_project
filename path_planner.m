
clc;
clear all;
tic
% Let each state be defined as: [l,d,v]
% l is the step in the forward direction
% d is the lateral offset position
% v is the candidate velocities

% for each node calculate estimate of terminal cost
% step 1: Expand start node

D=[-1,0,1];
v=[0,2,4,6,8,10];

l=0:0.2:30;

Open(1,:)=[0,0;[]];
goal=[30,0];
o_cost=[h_cost([0,0])];
C=[];
o_back=[0,0];
c_back=[];
% A star
while ~isempty(Open)
n_best=Open(1,:);
n_best_back=o_back(1,:);
best_c=o_cost(1);

%remove open(1,:);
Open=rmv(Open);
o_back=rmv(o_back);
o_cost=rmv1(o_cost);

%add n_best to C
C(end+1,:)=n_best;
c_back(end+1,:)=n_best_back;

if n_best==goal
    break;
end

[Open, o_back,o_cost]=  expand(n_best,best_c,o_cost,D,Open,o_back);
%expand n_best--> this involves updating backpointer 
end

k=1;
inpath(1,:)=goal;
pt=goal;
while pt(1)~=0 || pt(2)~=0
    in=find_in(C,pt);
    pt=c_back(in,:);
    inpath(k+1,:)=pt;
    k=k+1;
end
toc
for i=1:30
    [x(i),y(i),th]=pathl(i);
    [xu(i),yu(i)]=pathld(i,2);
    [xl(i),yl(i)]=pathld(i,-2);
    [x2(i),y2(i)]=pathld(inpath(i,1),inpath(i,2));
end
set(groot,'defaultLineLineWidth',1.5)
set(0,'DefaultaxesLineWidth', 1)
set(0,'DefaultaxesFontSize', 16)
set(0,'DefaultTextFontSize', 16)

figure(1)
plot(x,y,'--',xu,yu,'k',xl,yl,'k')
hold on
plot(x2,y2,'-o')
% [ox,oy]=pathld(21,-1);
% plot(ox,oy,'h')
hold off
axis([-1,21,4,25]);

%total cost
for i=1:31
    path(i,:)=inpath(32-i,:);
end
t_cost(path)

for i=1:30
    xa(i)=x2(31-i);
    ya(i)=y2(31-i);
end
the(1)=45;
cvel(1)=0;
velo(1)=0;
velc(1)=0;

for i=2:30
    the(i)=atand((ya(i)-ya(i-1))/(xa(i)-xa(i-1)));
    cvel(i)=abs(the(i)-the(i-1));
    velo(i)=(0.25*i-cvel(i)*0.03);
    velc(i)=rd(velo(i));
end


velc(2)=2;
velc(3)=2;
velc(4)=2;
figure(2)
plot(velo)
hold on
plot(velc,'-o')
hold off
legend('Optimised Velocity','Original Velocity')
