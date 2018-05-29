function re=renorm(input_vector,mass)
    re=zeros(size(input_vector));
    le=length(mass);
    for i=1:le
        re(i,1:end)=input_vector(i,1:end)*sqrt(mass(i));
    end
    s=sum(sum(re.^2),2);
    re=re/sqrt(s);
end