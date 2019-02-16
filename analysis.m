clc
clear
close all
parameters=xlsread('train.csv');
target=parameters(:,3);
target_norm=(target-mean(target))./std(target);
p0=ones(17999,1);
bedrooms=parameters(:,4);
bathrooms=parameters(:,5);
sqftliving=parameters(:,6);
sqftiot=parameters(:,7);
floors=parameters(:,8);
waterfront=parameters(:,9);
view=parameters(:,10);
conditon=parameters(:,11);
grade=parameters(:,12);
sqftabove=parameters(:,13);
sqftbase=parameters(:,14);
yrbuilt=parameters(:,15);
yrrenov=parameters(:,16);
zipcode=parameters(:,17);
lat=parameters(:,18);
long=parameters(:,19);
sqftliving2=parameters(:,20);
sqftiot2=parameters(:,21);
i=1:17999;
figure();
scatter(target,bedrooms);
figure();
scatter(target,bathrooms);
figure();
scatter(target,sqftliving);
figure();
scatter(target,sqftiot);
figure();
scatter(target,floors);
figure();
scatter(target,waterfront);
figure();
scatter(target,view);
figure();
scatter(target,conditon);
figure();
scatter(target,grade);
figure();
scatter(target,sqftabove);
figure();
scatter(target,sqftbase);
figure();
scatter(target,yrbuilt);
figure();
scatter(target,yrrenov);
figure();
scatter(target,zipcode);
figure();
scatter(target,lat);
figure();
scatter(target,long);
figure();
scatter(target,sqftliving2);
figure();
scatter(target,sqftiot2);





% p1_norm=(p1-mean(p1))./std(p1);
% p2_norm=(p2-mean(p2))./std(p2);
% p3_norm=(p3-mean(p3))./std(p3);
% p4_norm=(p4-mean(p4))./std(p4);
% x=[p0,p1,p2,p3,p4]
% m=17999;
% theta= zeros(5,1);
% k=1
% c(k)=(1/(2*m))*sum(x*theta-target_norm);
% 
% alpha=0.1;
% coverged =0
% while converged~=1
%     theta=theta-(alpha/m)*x'*(x*theta-target_norm);
%     k=k+1
%     c(k)=(1/(2*m))*sum(x*theta-target_norm);