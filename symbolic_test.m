function symbolic_test

% just a symbolic test to see how complicated the curve function becomes,
% in term of 't', as the degree goes up.
% clear all
clc
%% choose the degree of the spherical polynomial curve
d=3;
syms t;
[Q q]=slerp_highdeg(d,t);
t0=linspace(0,1);
qval = zeros(3,size(t0,2));
for i=1:size(t0,2)
   qval(:,i) = double(subs(q,t,t0(i)));
end

[x,y,z]=sphere;
figure
meshc(x,y,z)
colormap([0 0 0])
hold on
for i=1:size(Q,2)
plot3(Q(1,:)',Q(2,:)',Q(3,:)','-or','LineWidth',2.5);
end
for i=1:size(q,2)
plot3(qval(1,:)',qval(2,:)',qval(3,:)','-b','LineWidth',2.5);
end
hold off