function q=gen_vec_s2(n)

%% this files generates 'n' random vectors that ie on S^2 %%%

q=zeros(3,n);
for z=1:n
i=randperm(360);
i=i(1);
theta=i*(pi/180);
j=randperm(360);
j=j(1);
phi=j*(pi/180);
e3=[0 0 1]';
q0=Rx(phi)*Ry(theta)*e3;
q(:,z)=q0;
end

end