%M=100;
N=400;
ima=zeros(N,N,3);
for m=1:N
    for n=1:N
        ima(m,n,1)=n/N;
        ima(m,n,2)=m/N;
        ima(m,n,3)=1-n/N-m/N;
    end
end
imshow(ima);
