#XOR NEURAL NETWORK WITH HYPERBOLIC SIGMOID FUNCTION
#DEVELOPED BY JOAO PAULO V.M MARTINS
#IF YOU WILL GOING TO COPY ME, CITE ME, ASSHOLE

x = [ 1 1 1 1;0 0 1 1; 0 1 0 1]
theta = rand(3,2) 
theta2 = rand(3,1)
m = size(x,2);
y = [0 1 1 0];
grad = zeros(size(theta));
grad2 = zeros(size(theta2));
alfa = 0.8;
momento = 0.9;
count = 0;
bias = 1;
cost = [];
a1 = [];
epochs = 20
for item = 1:epochs

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
	delta3 = (a3 * (1-a3))*ERRO;
	delta21 = theta2(2,1) * delta3 * (a21 * (1-a21));
	delta22 = theta2(3,1) * delta3 * (a22 * (1-a22));

	

	theta2(1,1) = alfa * delta3 * bias + momento * theta2(1,1);
	theta2(2,1) = alfa * delta3 * a21 + momento * theta2(2,1);
	theta2(3,1) = alfa * delta3 * a22 + momento * theta2(3,1);

	theta(1,1) = alfa * delta21 * a11(1) + momento * theta(1,1);
	theta(2,1) = alfa * delta21 * a11(2) + momento * theta(2,1);
	theta(3,1) = alfa * delta21 * a11(3) + momento * theta(3,1);

	theta(1,2) = alfa * delta22 * a11(1) + momento * theta(1,2);
	theta(2,2) = alfa * delta22 * a11(2) + momento * theta(2,2);
	theta(3,2) = alfa * delta22 * a11(3) + momento * theta(3,2);
	a3

	if item == epochs
		a3
	end



	end

end


