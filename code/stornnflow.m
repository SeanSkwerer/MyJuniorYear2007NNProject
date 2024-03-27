%  stornnflow.m
%  Subroutine computes flows from input to output
%
function[v1,v2] = stornnflow(p,s,q,u0,w0,w1,W0,W1,key2,key3);
u1 = zeros(s,1);
for k = 1:s
    for j = 1:p
        if W0(k,j) ~= 0
            u1(k) = u1(k) + w0(k,j)*u0(j);
        end
    end
    if W0(k,p+1) ~= 0
        u1(k) = u1(k) +  w0(k,p+1);
    end
end
% call transfer function for intermediate nodes
v1 = stornntrans(s,u1,key2);
% compute flows from intermediate nodes to output nodes
u2 = zeros(q,1);
for k = 1:q
    for j = 1:s
        if W1(k,j) ~= 0
            u2(k) = u2(k) + w1(k,j)*v1(j);
        end
    end
    if W1(k,s+1) ~= 0
        u2(k) = u2(k) +  w1(k,s+1);
    end
end
% call transfer function for output nodes
v2 = stornntrans(q,u2,key3);
