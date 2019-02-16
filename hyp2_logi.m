clc
clear
close all
parameters=xlsread('train_logi.csv');
target=parameters(:,14);
m=length(parameters);

p1=parameters(:,1:10);
p=[ones(m,1) p1];
 
 n=length(p(1,:));
 theta=zeros(n,1);
 for w=2:n
    if max(abs(p(:,w)))~=0
    p(:,w)=(p(:,w)-mean((p(:,w))))./std(p(:,w));
    end
end
 alpha=0.1;
 iter=1;
 error(iter)=-(1/(m))*sum((target.*log(1./(1+exp(p*(-theta)))))+((1-target).*log(1./(1+exp(p*(-theta))))));
 converged=0;
 while (converged~=1)
     theta=theta-(alpha/m)*p'*(((log(1./(1+exp(p*(-theta)))))-target))
     iter=iter+1;
     error(iter)=-(1/(m))*sum((target.*log(1./(1+exp(p*(-theta)))))+((1-target).*log(1./(1+exp(p*(-theta))))));
    
      if error(iter-1)-error(iter)<0
          
    break
end 
q=(error(iter-1)-error(iter))./error(iter-1);
if q <.000001;
    converged=1;
end
  
 end
 iter=1:iter;
 figure();
 plot(iter,error);
 title('error');
 %testing
 parameters_test=xlsread('test_logi.csv');
target_test=parameters_test(:,14);
m_test=length(parameters_test);

p1_test=parameters_test(:,1:10);
p_test=[ones(m_test,1) p1_test];
 
 n=length(p_test(1,:));
 for w=2:n
    if max(abs(p_test(:,w)))~=0
    p_test(:,w)=(p_test(:,w)-mean((p_test(:,w))))./std(p_test(:,w));
    end
 end
 error_test=-(1/(m_test))*sum((target_test.*log(1./(1+exp(p_test*(-theta)))))+((1-target_test).*log(1./(1+exp(p_test*(-theta))))));