dataall=importdata("eigv.txt");
atomborn=importdata("atomeffect.txt");
fileID = fopen('modeeffect.txt','w');
eigvector=dataall(1:end,1:end);
atom=94;
mass=zeros(1,atom);
for i=1:2
    mass(i)=207.2;
end
for i=3:10
    mass(i)=126.90;
end
for i=11:14
    mass(i)=35.45;
end;
for i=15:18
    mass(i)=14.007;
end
for i=19:62
    mass(i)=1.008;
end
for i=63:94
    mass(i)=12.011;
end
vol=(8.386494280/2)^3;
for mu=1:atom*3
a_mu=renorm(eigvector(atom*(mu-1)+1:atom*(mu-1)+atom,1:end),mass);
modeff=zeros(3,1);
for i=1:atom
    i_born=atomborn(3*(i-1)+1:3*(i-1)+3,1:end);
    a_mu_i=a_mu(i,1:end);
    contr_i=i_born*(a_mu_i')/sqrt(mass(i));
    modeff=modeff+contr_i;
end
for j=1:3
    fprintf(fileID,"%f ",modeff(j));
end
fprintf(fileID,'\n');
end
borne=importdata("modeeffect.txt");
freq=importdata("fre.txt");
len=length(freq);
epsall=zeros(3,3);
fileID = fopen('alldie.txt','w');
tempadd=zeros(3,3);
for i=4:len
    add=die(borne(i,1:end),freq(i),vol);
    tempadd=tempadd+add;
    if(mod(i,3)==0)
        tempadd
        tempadd=zeros(3,3)
    end
    for j=1:9
        fprintf(fileID,'%f ',add(j));
    end
    fprintf(fileID,'\n');
    epsall=epsall+add;
end
epsall
fclose(fileID);
