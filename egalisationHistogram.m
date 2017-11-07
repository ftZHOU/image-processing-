

I = double(imread('lena512.bmp'))/255.0;
[CI,XI]=imhist(I,256);
CI=CI/numel(I);
figure,plot(XI,CI)
figure, imshow(I)

J=histeq(I,256);
[CJ,XJ]=imhist(J,256);
CJ=CJ/numel(J);
figure,plot(XJ,CJ);
figure,imshow(J)




