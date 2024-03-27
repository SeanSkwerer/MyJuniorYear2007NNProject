%   stornnbackprop.m
%  Subroutine that does backpropagation to compute changes in
%  weights
%
function[dw0,dw1] = stornnbackprop(p,s,q,x0,x1,x2,cr,w0,w1,W0,W1,key2,key3)
%
dw0 = zeros(s,p+1); dw1 = zeros(q,s+1);
% compute change in error function
cha = (cr - x2);
%  compute change in intermediate to output weights
if key3 == 1
    delta2 = cha.*x2.*(ones(q,1) - x2);
elseif key3 == 2
    delta2 = cha.*(ones(q,1) - x2.^2);
else
    delta2 = cha;
end
for k = 1:q
    for t = 1:s
        if W1(k,t) ~= 0
            dw1(k,t) = delta2(k,1)*x1(t);
        end
    end
    dw1(k,s+1) = delta2(k,1);
end
% compute change in input to intermediate weights
if key2 == 1
    for j = 1:s
        delta1(j) = 0;
        for m = 1:q
            if W1(m,j) ~= 0
                delta1(j) = delta1(j) + w1(m,j)*x1(j)*(1- x1(j))*delta2(m);
            end
        end
    end
elseif key2 == 2
    for j = 1:s
        delta1(j) = 0;
        for m = 1:q
            if W1(m,j) ~= 0
                delta1(j) = delta1(j) + w1(m,j)*(1- x1(j)^2)*delta2(m);
            end
        end
    end            
elseif key3 == 3
    for j = 1:s
        delta1(j) = 0;
        for m = 1:q
            if W1(m,j) ~= 0
                delta1(j) = delta1(j) + w1(m,j)*delta2(m);
            end
        end
    end
end
for k = 1:s
    for t = 1:p
        if W0(k,t) ~= 0
            dw0(k,t) = delta1(k)*x0(t);
        end
    end
    dw0(k,p+1) = delta1(k);
end
