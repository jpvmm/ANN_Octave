#XOR NEUiRAL NETWORK WITH HYPERBOLIC SIGMOID FUNCTION
#DEVELOPED BY JOAO PAULO V.M MARTINS
#IF YOU WILL GOING TO COPY ME, CITE ME, ASSHOLE

#dbstop('xornormal',7)
x = [ 1 1 1 1;0 0 1 1; 0 1 0 1]
theta =  rand(3,2) 
theta2 = rand(3,1)
m = size(x,2);
y = [0 1 1 0];
n = 0.5;
momento = 0.8;
count = 0;
bias = 1;
cost = [];
a1 = [];
epochs = 20000;
thetaN = zeros(size(theta));
theta2N = zeros(size(theta2));

for item = 1:epochs
err = 0;
count = count +1;
aS = [];
	for i = 1:m
	

	a11 = [a1, x(:,i)];

	net1 = (a11(1) * theta(1,1) + a11(2) * theta(2,1) + a11(3) * theta(3,1)); 
	net2 = (a11(1) * theta(1,2) + a11(2) * theta(2,2) + a11(3) * theta(3,2));

	a21 = 1/(1+exp(-net1));
	a22 = 1/(1+exp(-net2));

	net3 = (a21 * theta2(2,1) + a22 * theta2(3,1) + bias * theta2(1,1));

	a3 =  1/(1+exp(-net3));
	aS = [aS;a3];

	#BackProp

	ERRO = y(:,i) - a3;
	delta3 =  ERRO * (a3 * (1-a3));
	delta21 = theta2(2,1) * delta3 * a21 * (1-a21);
	delta22 = theta2(3,1) * delta3 * a22 * (1-a22);
	
		

	#Weights Update
	theta2(1,1) = momento * theta2N(1,1) + (n * (delta3 * bias));
	theta2(2,1) = momento * theta2N(2,1) + (n * (delta3 * a21));
	theta2(3,1) = momento * theta2N(3,1) + (n * (delta3 * a22));
	
	theta(1,1) = momento * thetaN(1,1) + (n * (delta21 * a11(1))) ;
	theta(2,1) = momento * thetaN(2,1) + (n * (delta21 * a11(2))) ;
	theta(3,1) = momento * thetaN(3,1) + (n * (delta21 * a11(3))) ;

	theta(1,2) = momento * thetaN(1,2) + (n * (delta22 * a11(1)))  ;
	theta(2,2) = momento * thetaN(2,2) + (n * (delta22 * a11(2)))  ;
	theta(3,2) = momento * thetaN(3,2) + (n * (delta22 * a11(3)))  ;

	thetaN = thetaN + theta;
	theta2N = theta2N + theta2;
	

	
		
	err = err + 0.5 * (ERRO).^2;
	cost = [cost;err];
	if item == epochs
		a3
	endif



	end
if err <= 0.01
	printf "Finalizado por erro \n"
	count
	aS
	 
	break
else 
	continue
endif

end


