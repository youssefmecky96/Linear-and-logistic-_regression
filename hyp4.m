clc
clear
close all
parameters=xlsread('train.csv');
target=parameters(:,3);
m=length(parameters);

target_norm=(target-mean(target))./std(target);
p1=parameters(:,4:5);
p2=parameters(:,6:7);
p2_square=parameters(:,6:7).^2;
p3=parameters(:,8:12);
p4=parameters(:,13:14);
p4_square=parameters(:,13:14).^2;
p5=parameters(:,15:19);
p6=parameters(:,20:21);
p6_square=parameters(:,20:21).^2;
p=[ones(m,1) p1 p2 p2_square p3 p4 p4_square p5 p6 p6_square];
 
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
p1_cross=parameters_cross(:,4:5);
p2_cross=parameters_cross(:,6:7);
p2_square_cross=parameters_cross(:,6:7).^2;
p3_cross=parameters_cross(:,8:12);
p4_cross=parameters_cross(:,13:14);
p4_square_cross=parameters_cross(:,13:14).^2;
p5_cross=parameters_cross(:,15:19);
p6_cross=parameters_cross(:,20:21);
p6_square_cross=parameters_cross(:,20:21).^2;

p_cross=[ones(m_cross,1) p1_cross p2_cross p2_square_cross p3_cross p4_cross p4_square_cross p5_cross p6_cross p6_square_cross];
for w=2:n
    if max(abs(p_cross(:,w)))~=0
    p_cross(:,w)=(p_cross(:,w)-mean((p_cross(:,w))))./std(p_cross(:,w));
    end
end
error_cross=(1/(2*m_cross))*sum((p_cross*theta-target_norm_cross).^2);