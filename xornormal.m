#XOR NEUiRAL NETWORK WITH HYPERBOLIC SIGMOID FUNCTION
#DEVELOPED BY JOAO PAULO V.M MARTINS
#IF YOU WILL GOING TO COPY ME, CITE ME, ASSHOLE

x = [ 1 1 1 1;0 0 1 1; 0 1 0 1]
theta = (-0.2-0.2)*rand(3,2) + 0.2 
theta2 = (-0.2-0.2) *rand(3,1) + 0.2
m = size(x,2);
y = [0 1 1 0];
grad = zeros(size(theta));
grad2 = zeros(size(theta2));
n = 0.7;
momento = 0.9;
count = 0;
bias = 1;
cost = [];
a1 = [];
epochs = 20000;
for item = 1:epochs
err = 0;
count = count +1;
	for i = 1:m
	

	a11 = [a1, x(:,i)];

	net1 = (a11(1) * theta(1,1) + a11(2) * theta(2,1) + a11(3) * theta(3,1)); 
	net2 = (a11(1) * theta(1,2) + a11(2) * theta(2,2) + a11(3) * theta(3,2));

	a21 = 1/(1+exp(-net1));
	a22 = 1/(1+exp(-net2));

	net3 = (a21 * theta2(2,1) + a22 * theta2(3,1) + bias * theta2(1,1));

	a3 =  1/(1+exp(-net3));

	#BackProp

	ERRO = y(:,i) - a3;
	delta3 =  ERRO * (a3 * (1-a3));
	delta21 = theta2(2,1) * delta3 * (a21 * (1-a21));
	delta22 = theta2(3,1) * delta3 * (a22 * (1-a22));

	

	theta2(1,1) = n * (delta3 * bias) + momento * theta2(1,1);
	theta2(2,1) = n * (delta3 * a21) +  momento * theta2(2,1);
	theta2(3,1) = n * (delta3 * a22) +  momento * theta2(3,1);

	theta(1,1) = n * (delta21 * a11(1)) + momento * theta(1,1);
	theta(2,1) = n * (delta21 * a11(2)) + momento * theta(2,1);
	theta(3,1) = n * (delta21 * a11(3)) + momento * theta(3,1);

	theta(1,2) = n * (delta22 * a11(1)) + momento * theta(1,2);
	theta(2,2) = n * (delta22 * a11(2)) + momento * theta(2,2);
	theta(3,2) = n * (delta22 * a11(3)) + momento * theta(3,2);
	
	err = err + 0.5 * (ERRO).^2;
	cost = [cost;(1./m).*y(:,i)*(log(a3)) - (1-y(:,i)*(log(a3)))];
	if item == epochs
		a3
	end



	end
if err <= 0.01
	printf "Finalizado por erro \n"
	count
	for i = 1:m


		a11 = [a1, x(:,i)];

        	net1 = (a11(1) * theta(1,1) + a11(2) * theta(2,1) + a11(3) * theta(3,1));
        	net2 = (a11(1) * theta(1,2) + a11(2) * theta(2,2) + a11(3) * theta(3,2));

        	a21 = 1/(1+exp(-net1));
        	a22 = 1/(1+exp(-net2));

       		 net3 = (a21 * theta2(2,1) + a22 * theta2(3,1) + bias * theta2(1,1));

        	a3 =  1/(1+exp(-net3))
	end
 
	break
else 
	continue
endif

end


