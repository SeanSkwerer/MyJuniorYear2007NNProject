%Two Circles Separation 
p = 2; q = 3; s = 6; K = 1000;  
    saseed = 2;
    rand('state',saseed);
    hold on
    axis([0 1 0 1])
    circle_key = 9;
    [Xa,Ya_top,Ya_bottom,Xa0,Ya0,Ra2,Xb,Yb_top,Yb_bottom,Xb0,Yb0,Rb2] = Two_Circles(circle_key);
    plot(Xa,Ya_top,'k',Xa,Ya_bottom,'k',Xb,Yb_top,'k',Xb,Yb_bottom,'k');
    pause
    % generate training set
    E = zeros(2,K); C = zeros(3,K);
    if randtest == 0
        vz = 0;
        for k = 1:K/20
            for j = 1:K/20
                xy(1) = (1/(K/20))*k;
                xy(2) = (1/(K/20))*j;
                vz = vz+1;
                E(:,vz) = [xy(1);xy(2)];
            end
        end
    else
        for k = 1:K
            E(:,k) = [rand(1);rand(1)];
        end
    end
    for k = 1:length(E)
     
        if (E(1,k) - Xa0)^2 + (E(2,k) - Ya0)^2 <= Ra2
                C(1,k) = 1;
                plot(E(1,k),E(2,k),'rd')
        elseif (E(1,k) - Xb0)^2 + (E(2,k) - Yb0)^2 <= Rb2
                C(2,k) = 1;
                plot(E(1,k),E(2,k),'bd')
        else
                C(3,k) = 1;
                plot(E(1,k),E(2,k),'kd')
        end
    end
    pause
    W0 = ones(s,p+1); W1 = ones(q,s+1);
    
    key2 = 2;
    key3 = 2;
    stor582nn
    stornntest1


