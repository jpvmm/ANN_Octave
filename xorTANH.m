x = [ 1 1 1 1;0 0 1 1; 0 1 0 1]
theta = (-1-1) * rand(3,2) +1
theta2 = (-1-1) * rand(3,1)+1
m = size(x,2);
y = [0 1 1 0]
grad = zeros(size(theta));
grad2 = zeros(size(theta2));
alfa = 0.5;
count = 0;
bias = [1, 1, 1, 1];
count = 0;
cost = []

for i = 1:1000
count = count +1;
#FORWARD PROPAGATION
z = theta'*x;

a2 = tanh(z); 
a2 = [bias;a2];
z2 = theta2'*a2;

a3 = tanh(z2);
hipotese = tanh((2/3).*z2);
cost = [cost;-y*(log((hipotese+1)/2))'-(1-y)*(log(1-((hipotese+1)/2)))'];
 
#BackProp
delta3 = y-a3; #GRADIENTE LOCAL DA ULTIMA CAMADA
delta2 = theta2*delta3 .* (1-(a2.^2)); #GRADIENTE LOCAL DA SEGUNDA CAMADA
delta2 = delta2(2:3,:);
#Acumulador
grad = grad + x*delta2';
grad2 = grad2 + a2*delta3';

#Derivada Parcial
grad = (1/m)*grad ;

grad2 = (1/m)*grad2 + (0.1/m)*theta2;

#Atualizacao dos pesos
theta = theta + alfa*grad;
theta2 = theta2 + alfa*grad2;

if a3(:,2:3) >=0.7 && a3(:,1:3:4) <= 0.1
	 count
	break

endif

if any(isnan(a3))
	count
	printf "Ta errado otario: \n "
	break
else
	continue
endif

end
printf "a3 eh igual a: \n ", a3
figure;plot(cost)

