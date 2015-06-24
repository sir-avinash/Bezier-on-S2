%%% To recurse or not to recurse %%%

%%%% In this file, a degree 4 spherical bezier curve is generated. Now, the
%%%% end point is perturbed to check the effect of that on the curve
%%%% generated. The plot gives a good visualization of it. 

function spherical_interp_higher_degree

theta0 = [3*pi/2,-pi/3,pi/6,-pi/2,-pi/5];
phi0 = [-pi/3,+pi/6,-pi/6,pi/3,-pi/5];
% theta = sin(theta);   % goes non-linearly from -50 to 50 degs

q0 = [];
for i = 1:size(theta0,2)
q0(:,i) = Rx(phi0(i))*Ry(theta0(i))*[0 0 1]'; % test points on S^2
end

q1=[];
eps= linspace(-1,1,30); %[0.1 -0.1];   %%perturb
theta = theta0;
phi = phi0;
for j = 1:size(eps,2)
    theta(end) = theta0(end)+(eps(j)*pi/5);
    phi(end) = phi0(end)+(eps(j)*pi/5);
for i = 1:size(theta,2)
q1(:,i,j) = Rx(phi(i))*Ry(theta(i))*[0 0 1]'; % test points on S^2
end
end

t=linspace(0,1);
degrees = size(q1,2)-1;
q=zeros(3,degrees+1,degrees+1);
qf = zeros(3,size(t,2));
 
for s=1:size(eps,2)
    qj = q1(:,:,s);
for j=1:size(t,2)
    q(:,:,1)= qj;
    qt0(:,:,1)=q0;
    for k=2:degrees+1
        for l=1:degrees+1-(k-1)
    q(:,l,k)=slerp(q(:,l:l+1,k-1),t(j));
    qt0(:,l,k)=slerp(qt0(:,l:l+1,k-1),t(j));
        end
    end
    
qf(:,j,s) = q(:,1,end);
qf0(:,j)= qt0(:,1,end);
end
end

[x,y,z]=sphere;
figure
meshc(x,y,z)
colormap([0 0 0])
hold on
plot3(qf0(1,:)',qf0(2,:)',qf0(3,:)','-or','LineWidth',2.5);


for s=1:size(eps,2)
plot3(qf(1,:,s)',qf(2,:,s)',qf(3,:,s)','-b','LineWidth',2-abs(eps(s)));
hold on
end

hold off
end

% eps = [1/sqrt(3) 0 sqrt(2/3)];
% eta = linspace(-1,1);
% for i=1:size(eta,2)
%     pert(:,i)=exp(eta(i)*eps');
% end



function q_func=slerp(q,t)
phi = acos(q(:,1)'*q(:,2));
q_func = (sin((1-t)*phi)/sin(phi))*q(:,1) + (sin(t*phi)/sin(phi))*q(:,2);
end
