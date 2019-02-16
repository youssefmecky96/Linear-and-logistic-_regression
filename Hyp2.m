clc
clear
close all
parameters=xlsread('train.csv');
target=parameters(:,3);
m=length(parameters);

target_norm=(target-mean(target))./std(target);
p1=parameters(:,4:16);
p2=parameters(:,20:21);
p=[ones(m,1) p1 p2];
 
 n=length(p(1,:));
 theta=zeros(n,1);
 for w=2:n
    if max(abs(p(:,w)))~=0
    p(:,w)=(p(:,w)-mean((p(:,w))))./std(p(:,w));
    end
end
 alpha=0.1;
 iter=1;
 error(iter)=(1/(2*m))*sum((p*theta-target_norm).^2);
 converged=0
 while (converged~=1)
     theta=theta-(alpha/m)*p'*(p*theta-target_norm);
     iter=iter+1
     error(iter)=(1/(2*m))*sum((p*theta-target_norm).^2);
    
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
  parameters_cross=xlsread('crossvalid.csv');
 target_cross=parameters_cross(:,3);
 m_cross=length(target_cross);
 target_norm_cross=(target_cross-mean(target_cross))/std(target_cross);
p1_cross=parameters_cross(:,4:16);
p2_cross=parameters_cross(:,20:21);
p_cross=[ones(m_cross,1) p1_cross p2_cross];
error_cross=(1/(2*m_cross))*sum((p_cross*theta-target_norm_cross).^2);
