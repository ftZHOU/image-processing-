% exemple.m

function exemple

chemin='appr';

close all

liste=dir(fullfile(chemin,'*.png'));

figure
for n=1:length(liste)
    nom=liste(n).name;
    X=double(imread(fullfile(chemin,nom)))/255.0;
    fid=fopen(fullfile(chemin,[nom(1:findstr(nom,'.')-1) '.txt']),'r');
    classe=fscanf(fid,'%d');
    fclose (fid);
    imagesc(X)
    colormap(gray(256))
    axis equal
    switch(classe)
        case 1
            nomclasse='cercle';
        case 2
            nomclasse='rectangle';
        case 3
            nomclasse='ellipse';
        case 4
            nomclasse='etoile';
        case 5
            nomclasse='lettre H';
        case 6
            nomclasse='lettre Y';
    end
    title(['fichier ' nom ', classe ' nomclasse])
    drawnow
    pause
end