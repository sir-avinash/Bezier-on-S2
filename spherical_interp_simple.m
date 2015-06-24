function spherical_interp_simple

%%%% The file depicts a simple degree one spherical bezier curve between
%%%% two points on a sphere

theta = [-pi,pi];
phi = [-pi/3,pi];
% theta = sin(theta);   % goes non-linearly from -50 to 50 degs
q1=[];

for i = 1:size(theta,2)
q1(:,i) = Rx(phi(i))*Ry(theta(i))*[0 0 1]'; % test points on S^2
end

q=[];
for j=1:100
    t=linspace(0,1);
    q(:,j)=slerp(q1,t(j));
end

[x,y,z]=sphere;
figure
meshc(x,y,z)
colormap([0 0 0]);
hold on
line(q(1,:)',q(2,:)',q(3,:)');
end

function q_func=slerp(q,t)
%% spherical bezier curves
% degree = size(q,2);
% points = size(q,1);
phi = acos(q(:,1)'*q(:,2));
q_func = (sin((1-t)*phi)/sin(phi))*q(:,1) + (sin(t*phi)/sin(phi))*q(:,2);

end
