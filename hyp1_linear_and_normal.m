clc
clear
close all
parameters=xlsread('train.csv');
target=parameters(:,3);
target_norm=(target-mean(target))./std(target);
p0=1;
p1=parameters(:,6);
p2=parameters(:,7);
p3=parameters(:,13);
p4=parameters(:,14);
p1_norm=(p1-mean(p1))./std(p1);
p2_norm=(p2-mean(p2))./std(p2);
p3_norm=(p3-mean(p3))./std(p3);
p4_norm=(p4-mean(p4))./std(p4);
m=length(parameters);
  theta0=50;
  theta1=100;
  theta2=150;
  theta3=200;
  theta4=250;
 output=theta0+p1_norm*theta1+p2_norm*theta2+p3_norm*theta3+p4_norm*theta4;
 cost=sum((1/(2*m))*(target_norm-output).^2)
 alpha=0.1;
 error=[cost];
 iter=1;
 converged=0
 while (converged~=1)
     theta0_updated=theta0-(alpha*1/m)*sum(output-target_norm);
     theta1_updated=theta1-(alpha*1/m)*sum((output-target_norm).*p1_norm);
     theta2_updated=theta2-(alpha*1/m)*sum((output-target_norm).*p2_norm);
     theta3_updated=theta3-(alpha*1/m)*sum((output-target_norm).*p3_norm);
     theta4_updated=theta4-(alpha*1/m)*sum((output-target_norm).*p4_norm);
     output=theta0_updated+p1_norm*theta1_updated+p2_norm*theta2_updated+p3_norm*theta3_updated+p4_norm*theta4_updated;
     cost=sum((1/(2*m))*(target_norm-output).^2)
     theta0=theta0_updated;
     theta1=theta1_updated;
     theta2=theta2_updated;
     theta3=theta3_updated;
     theta4=theta4_updated;
      iter=iter+1;
     error(iter)=cost;
    
      if error(iter-1)-error(iter)<0
          
    break
end 
q=(error(iter-1)-error(iter))./error(iter-1)
if q <.000001;
    converged=1;
end
  
 end
 iter=1:iter;
 figure();
 plot(iter,error);
 title('error');
 %testing
  parameters=xlsread('crossvalid.csv');
 target=parameters(:,3);
 m_test=length(target);
 target_norm=(target-mean(target))/std(target);
 p0_test=1;
 p1_test=parameters(:,6);
 p2_test=parameters(:,7);
 p3_test=parameters(:,13);
 p4_test=parameters(:,14);
 p1_norm_test=(p1_test-mean(p1_test))/std(p1_test);
 p2_norm_test=(p2_test-mean(p2_test))/std(p2_test);
 p3_norm_test=(p3_test-mean(p3_test))/std(p3_test);
 p4_norm_test=(p4_test-mean(p4_test))/std(p4_test);
 output=theta0+p1_norm_test*theta1+p2_norm_test*theta2+p3_norm_test*theta3+p4_norm_test*theta4;
 error_cross=sum((1/(2*m_test))*(target_norm-output).^2);
%using normal equation uncomment and comment testing to see it work 
% p0=ones(m,1);
% theta0=50;
% theta1=100;
% theta2=150;
% theta3=200;
% theta4=250;
% output=theta0+p1*theta1+p2*theta2+p3*theta3+p4*theta4;
% cost=sum((1/(2*m))*(target-output).^2);
% x=[p0,p1,p2,p3,p4];
% x_t=transpose(x);
% theta_array=inv(x_t*x)*x_t*target;    
    