
h=[0 -1 0; -1 4 -1;0 -1 0];
[H,W1,W2]=freqz2(h,50,50);
mesh(W1/2,W2/2,H)
rotate3d

I=double(imread('lena512.bmp'))/255.0;
figure,imshow(I);
J=filter2(h,I);
figure,imshow(abs(J),[0 0.5])