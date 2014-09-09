x = [ 1 1 1 1;0 0 1 1; 0 1 0 1]
theta = (0-0.2)*rand(3,2) + 0.2
theta2 = (0-0.2)*rand(3,1) + 0.2
m = size(x,2)
y = [0 1 1 0]
teste = []
teste2 = []
grad = zeros(size(theta))
grad2 = zeros(size(theta2))
alfa = 0.8
count = 0;
bias = [1, 1, 1, 1];
cost = [];

for i = 1:1000
count = count +1;
z = theta'*x;

a2 = 1./(1+exp(-z));
a2 = [bias;a2];
z2 = theta2'*a2;

a3 = 1./(1+exp(-z2));
cost = [(1./m).*y*(log(a3))' - (1-y)*(log(a3))';cost];
#BackProp
delta3 = y-a3; #GRADIENTE LOCAL DA ULTIMA CAMADA
delta2 = theta2*delta3 .* a2.*(1-a2); #GRADIENTE LOCAL DA SEGUNDA CAMADA
delta2 = delta2(2:3,:);
#Acumulador
grad = grad + x*delta2';
grad2 = grad2 + a2*delta3';


#Derivada Parcial
grad = (1/m)*grad ;
grad2 = (1/m)*grad2 + (0.3/m)*theta2;


#Atualizacao dos pesos
theta = theta + alfa*grad;
theta2 = theta2 + alfa*grad2;

if a3(:,2:3) >=0.7 && a3(:,1:3:4) <= 0.0001
	printf "Por erro, a3 eh igual a: \n ", a3
	 count
	break
else
	continue

endif


end


