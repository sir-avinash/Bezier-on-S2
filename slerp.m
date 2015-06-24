function q_func=slerp(q,t)

%%% This function is the basis of all spherical interpolations.   %%%%
%%% Slerp generates a continuous and differentiable curve, that also lies of the 2-sphere, 
%%% connecting any two points on the 2-sphere.

phi = acos(q(:,1)'*q(:,2));
q_func = (sin((1-t)*phi)/sin(phi))*q(:,1) + (sin(t*phi)/sin(phi))*q(:,2);
end