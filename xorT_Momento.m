#XOR NEURAL NETWORK WITH HYPERBOLIC TANGENT FUNCTION
#DEVELOPED BY JOAO PAULO V.M
#IF YOU WILL GOING TO COPY ME, CITE ME, ASSHOLE

x = [ 1 1 1 1;0 0 1 1; 0 1 0 1]
theta = (-1-1) * rand(3,2) +1
theta2 = (-1-1) * rand(3,1)+1
m = size(x,2);
y = [0 1 1 0];
grad = zeros(size(theta));
grad2 = zeros(size(theta2));
alfa = 0.8;
momento = 0.9;
count = 0;
bias = [1, 1, 1, 1];
cost = [];

for i = 1:10000
count = count +1;
#FORWARD PROPAGATION
z = theta'*x;

a2 = tanh(z); 
a2 = [bias;a2];
z2 = theta2'*a2;

a3 = tanh(z2);
#hipotese = tanh((2/3).*z2);
cost = [cost;-y*(log((a3+1)/2))'-(1-y)*(log(1-((a3+1)/2)))'];

#BACKPROPAGATION
ERRO = y-a3;
delta3 = sech(a3).^2 .* ERRO; #Local Gradient
delta2 = theta2*delta3 .* sech(a2).^2; #Local Gradient
delta2 = delta2(2:3,:);

grad2 = grad2 + a2*delta3';
grad = grad + x*delta2';

#grad = (1/m)*grad;
#grad2 = (1/m) * grad2 + (0.3/m)*theta2;

theta = momento*theta + alfa*grad;
theta2 = momento*theta2 + alfa*grad2;

if a3(:,2:3) >=0.9 && a3(:,1:3:4) <= 0.1 && a3(:,1:3:4) >= -0.1
	count
	break

endif
end

printf "A saida da rede eh: ", a3
