%*****************************************************************
%  stor582nn.m
%
%  Input  =  key  that determines the problem to be run
%
%  Common inputs to all problems
%     p = number of inputnodes
%     s = number of intermediate (hidden) nodes
%     q = number of output nodes
%     K = number of training vectors
%     E = p x K matrix that contains training vectors as columns
%     C = q x K vector that contains correct responses for 
%         training vectors
%     W0 = s x (p+1) incidence matrix for input to 
%         intermediate nodes
%        Extra dimension indicates bias on intermediate node
%        W0(j,i) = 1 if there is an arc from input node i  to 
%          intermediate node j,  i = p+1 indicates bias on node j
%     W1 = q x (s+1) incidence matrix for input to output nodes
%        Extra dimension indicates bias on output nodes 
%        W1(j,i) = 1 if there is an arc from intermediate node i  
%         to output node  j,  i = q+1 indicates bias on node j
%     w0 = s x (p+1) initial weight matrix for input to 
%         intermediate nodes
%     w1 = p x (q+1)  initial weight matrix for intermediate to 
%        output nodes
%     maxit = maximum number of iterations
%     gamma = algorithm terminates if total error is less than 
%          gamma
%     rho = step length parameter
%     sa = choice of sampling procedures 
%        = 0  if sequential
%        = 1  if uniform random
%     saseed for random number generator (to reproduce results)
%     factor = total error checked after factor iterations
%     key2 = type of transfer function from intermediate nodes
%       see subroutine stornntrans.m
%     key3 = type of transfer fucntion from output nodes
%       see subroutine stornntrans.m
%
%   Output
%     
%   Subroutines called
%
w0 = rand(s,p+1); w1 = rand(q,s+1);
maxit = 500000;  sa = 1; factor = 100000; kfactor = 1; rho = .75;
gamma = .1; toterr = 2*gamma; it = 1; 
while it <= maxit & toterr > gamma
    % choose training vector
    if sa == 0 
        k = mod(it,K)+1;
    else
        v = rand(1);
        k = floor(K*v) + 1;  % choose index of training vector 
        % at random
    end
    u0 = E(:,k); cr = C(:,k);  % obtain training vector and 
    %    response
    % compute flows from in put nodes to output nodes
    [v1,v2] = stornnflow(p,s,q,u0,w0,w1,W0,W1,key2,key3);
    % call subroutine that computes change in weights 
    [dw0,dw1] = stornnbackprop(p,s,q,u0,v1,v2,cr,w0,w1,W0,W1,key2,key3);
    % change weights on arcs
    for j = 1:q
        for k = 1:s
            if W1(j,k) ~= 0
                w1(j,k) = w1(j,k) + rho*dw1(j,k);
            end
        end
        if W1(j,s+1) ~= 0
            w1(j,s+1) = w1(j,s+1) + rho*dw1(j,s+1);
        end
    end
    for j = 1:s
        for k = 1:p
            if W0(j,k) ~= 0
                w0(j,k) = w0(j,k) + rho*dw0(j,k);
            end
        end
        if W0(j,p+1) ~= 0
            w0(j,p+1) = w0(j,p+1) + rho*dw0(j,p+1);
        end
    end
   %  if factor new iterations have been taken compute total error
    if it == kfactor + factor | it == maxit
        toterr = 0; yy = zeros(q,K);
        for m = 1:K
            u0 = E(:,m);
            [v1,v2] = stornnflow(p,s,q,u0,w0,w1,W0,W1,key2,key3);
            yy(:,m) = v2;
        end
        toterr = norm(C - yy,'fro');
        disp('total error after')
        disp(it)
        disp('iterations is')
        disp(toterr)
        kfactor = it;
        rho = rho/1.1;
    end
    % update iteration counter
    it = it + 1;           
end
