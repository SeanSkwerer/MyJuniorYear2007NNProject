%   stor582nnsu.m
%
clf
if key == 1
    disp('logical problem  (A_1 and ~A_2) or A_3')
    p = 3; q = 2; s = 2;  K = 8;
    saseed = 2;
    rand('state',saseed);
    %  true is 1, 0 is false
    E = [1,1,1,1,-1,-1,-1,-1;1,1,-1,-1,1,1,-1,-1;1,-1,1,-1,1,-1,1,-1];
    C = [1,0;0,1;1,0;1,0;1,0;0,1;1,0;0,1]';
    W0 = ones(s,p+1); W1 = ones(q,s+1);
    key2 = 1;
    key3 = 1;
    pause
    stor582nn
elseif key == 2
%  K points are generated randomly about a 2-dim region 
%    -2 <= x_1 <= 2, -2 <= x_2 <= 2
%  and classified as to whether they are in one of 3 disjoint regions
%  These regions are defined by:
%   (I)  (x_1 - 1)^2 + (x_2 + 1)^2 <= 1
%   (II)  (x_1 + 2)^2 + (x_2 - 2)^2 <= 5 and inside square
%   (III)  the remainder of square
%  plot regions
    p = 2; q = 3; s = 8; K = 1000;  
    saseed = 2;
    rand('state',saseed);
    hold on
    axis([-2,2,-2,2])
    xxx = linspace(0,2,300);
    yyy = - 1 + sqrt(1 - (xxx - 1).^2);
    yyyy = - 1 - sqrt(1 - (xxx - 1).^2);
    plot(xxx,yyy,'k',xxx,yyyy,'k')
    xx = linspace (-2,-2 + sqrt(5),300);
    yz = 2 - sqrt(5 - (xx + 2).^2);
    plot(xx,yz,'k')
    text(1,-1,'I')
    text(-1,1,'II')
    text(0,0,'III')
    pause
    % generate training set
    E = zeros(2,K); C = zeros(3,K);
    if randtest == 0
        for k = 1:K/20
            for j = 1:K/20
                xy(1) = -2 + (4/20)*k;
                xy(2) = -2 + (4/20)*j;
                vz = j + (k-1)*20;
                E(:,vz) = [xy(1);xy(2)];
            end
        end
    else
        for k = 1:K
            E(:,k) = [2-4*rand(1);2-4*rand(1)];
        end
    end
    for k = 1:K
        plot(E(1,k),E(2,k),'rd')
        if (E(1,k) - 1)^2 + (E(2,k) + 1)^2 <= 1
                C(1,k) = 1;
        elseif (E(1,k) + 2)^2 + (E(2,k) - 2)^2 <= 5
                C(2,k) = 1;
        else
                C(3,k) = 1;
        end
    end
    W0 = ones(s,p+1); W1 = ones(q,s+1);
    key2 = 1;
    key3 = 1;
    stor582nn
    stornntest1

end
