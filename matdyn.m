dataall=importdata("eigev.txt");
atomborn=importdata("atomeffect.txt");
fileID = fopen('modeeffect.txt','w');
eigvector=dataall(1:end,1:2:end);
atom=5;
mass=zeros(1,atom);
for i=1:atom/5*3
    mass(i)=15.999;
end
for i=atom/5*3+1:atom/5*4
    mass(i)=91.224;
end
for i=atom/5*4+1:atom
    mass(i)=137.33;
end;
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
