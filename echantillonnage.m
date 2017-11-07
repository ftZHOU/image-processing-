N=400;
ima=zeros(N,N);
for m=1:N
    for n=1:N
        ima(m,n)=0.5+0.5*cos(pi*0.5*(m^2+n^2)/N);
        
    end
end
% imshow(ima);

ima2=imresize(ima,0.5,'nearest');
imshow(ima2);

ima2=imresize_old(ima,0.5,'bilinear');
imshow(ima2);

ima2=imresize_old(ima,0.5,'bilinear',51);
imshow(ima2);
