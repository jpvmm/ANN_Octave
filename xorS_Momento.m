#XOR NEURAL NETWORK WITH HYPERBOLIC SIGMOID FUNCTION
#DEVELOPED BY JOAO PAULO V.M
#IF YOU WILL GOING TO COPY ME, CITE ME, ASSHOLE

x = [ 1 1 1 1;0 0 1 1; 0 1 0 1]
theta =  rand(3,2) 
theta2 = rand(3,1)
m = size(x,2);
y = [0 1 1 0];
grad = zeros(size(theta));
grad2 = zeros(size(theta2));
alfa = 0.5;
momento = 0.9;
count = 0;
bias = [1, 1, 1, 1];
cost = [];
E = [];

for i = 1:50000
err = 0;
count = count +1;
#FORWARD PROPAGATION
z = theta'*x;

a2 = 1./(1+exp(-z));

a2 = [bias;a2];
z2 = theta2'*a2;

a3 = 1./(1+exp(-z2));


#BACKPROPAGATION
ERRO = y-a3;
delta3 = (a3.*(1-a3)) .* ERRO; #Local Gradient
delta2 = theta2*delta3 .* a2.*(1-a2);  #Local Gradient
delta2 = delta2(2:3,:);

grad2 = grad2 + a2*delta3';
grad = grad + x*delta2';


theta = momento.*theta + alfa*grad;
theta2 = momento.*theta2 + alfa*grad2;

err = sum (0.5 .* (ERRO).^2);

E = [E;err];

if err < 0.01
	count
	break
end
end

figure; plot(E)

printf "A saida da rede eh: ", a3

