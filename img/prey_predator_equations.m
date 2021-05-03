%Most of the sample data was obtained from the paper itself. The time span
%and the variables used in the function were all chosen based on what the
%author used

time_span = [0,100];
initial_conditions =[0.5, 0.6, 0.5, 0.2];
[time,y_values] = ode45(@prey_predator,time_span,initial_conditions);

%After using the ode45, the solution to all the differential equations is
%kept in the matrix y_values


s_values = y_values(:,1);
i_values = y_values(:,2);
x_values = y_values(:,3);
y_values = y_values(:,4);

plot(time,s_values)
hold on

plot(time,i_values)
hold on

plot(time,x_values)
hold on


plot(time,y_values)
hold on
legend('s(t)','i(t)','x(t)','y(t)')



function yprime = prey_predator(t,Y)
%declaring the variables in the equations
a =0.4;b=1;c=0.1;d=0.5;e=0.2;f = 0.2;g=0.15;m=1.5;n=1.4;alpha = 0.5;sigma = 0.2;

%extracting the variables s,i,x,and y
s = Y(1);
i = Y(2);
x = Y(3);
y = Y(4);

yprime = zeros(size(Y));
%we are going to re-assign yprime with the values corresponding to s'  i'
%x'  and  y'

yprime(1)=s.*(1 -s -i) -a*s.*i -b*s.*x;
yprime(2)=a*s.*i -d*i - f*x.*i -m*i.*y;
yprime(3)= c*s.*x + g*i.*x - e*x.*y - sigma*x;
yprime(4)=e*x.*y - alpha*y + n*i.*y;

end