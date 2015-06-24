function [Q q] = slerp_highdeg(d,t)

%%% given a degree 'd', this fucntion generates random intermidiate points
%%% to eventualy generate a 'd' degree between the two points given by 'q' 

syms t
Q=gen_vec_s2(d+1);
q_expr=sym('qt',[size(Q,1),d+1]);
   for k=2:d+1
     for l=1:(d+1)-(k-1)
         if k==2
     q_expr(:,l)=slerp(Q(:,l:l+1),t);
         else
     q_expr(:,l)=slerp(q_expr(:,l:l+1),t);
         end
     end
   end
q=q_expr(:,1);
end