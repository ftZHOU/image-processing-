% generemesures.m

function generemesures(baseref,baseappr)
if nargin==0
    baseref='reference';
    baseappr='appr';
end
close all
N=600;
sigma=0.05;
DeltaX=22;
DeltaY=22;
NX=10;
NY=10;
liste=dir(fullfile(baseref,'*.bmp'));
Nfile=length(liste);
for n=1:N
    classe=1+floor(Nfile*rand(1));
    nom=fullfile(baseref,liste(classe).name);
    ima=~imread(nom);
    [L,C]=size(ima);
    rota=pi*rand(1);
    ech=0.2+0.8*rand(1);
    R=[cos(rota) -sin(rota);sin(rota) cos(rota)];
    M=ech*R;
    U0=[C/2;L/2];X0=[C/2;L/2];
    TR=X0-M*U0;
    A=[M TR]';
    T = maketform('affine',A);
    ima=imtransform(ima,T,'bicubic','XData',[1 C],'Ydata',[1 L]);
    for nx=1:NX
        for ny=1:NY
            liste_points{nx,ny}=[(nx-1)*DeltaX+(DeltaX/8)*randn(1) (ny-1)*DeltaY+(DeltaY/8)*randn(1)];
        end
    end
    ima_transf=transf_deform (ima,DeltaX,DeltaY,liste_points);
    ima=zeros(L,C);
    ima(1:size(ima_transf,1),1:size(ima_transf,2))=ima_transf;
    nivmin=0.3*rand(1);
    nivmax=nivmin+0.4+0.3*rand(1);
    mes=(ima<0.5)*nivmin+(ima>=0.5)*nivmax;
    mes=mes+sigma*(1-2*rand(size(mes)));
    imshow(mes),drawnow
    imwrite(mes,fullfile(baseappr,['mesure' sprintf('%03d',n) '.png']));
    fid=fopen(fullfile(baseappr,['mesure' sprintf('%03d',n) '.txt']),'w');
    fprintf(fid,'%d',1+floor((classe-1)/3));
    fclose(fid);
end