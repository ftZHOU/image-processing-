N=400;
ima=zeros(N,N); %register each point's élairement by their position in the matrix : initialization
%ima=rand(N,N);
I = 1;
h=1;
for m=1:N
    for n=1:N
        ima(m,n)= I*h/((((m/N)-0.5)^2+((n/N)-0.5)^2)+1)^(3/2);
    end
end
imshow(ima);