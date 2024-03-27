% stornntest1.m
%  test of region identification in stor582nn (key = 2)
%
clf
% plot figures
    hold on
    axis([0 1 0 1])
    plot(Xa,Ya_top,'k',Xa,Ya_bottom,'k',Xb,Yb_top,'k',Xb,Yb_bottom,'k');
% generate test points
L = 1000;
for k = 1:L
    T(:,k) = [rand(1);rand(1)];
    u0 = T(:,k);
    [v1,v2] = stornnflow(p,s,q,u0,w0,w1,W0,W1,key2,key3);
    [mm,I] = max(v2);
    if mm > .6
        if I == 1
            plot(T(1,k),T(2,k),'rd')
        elseif I == 2
            plot(T(1,k),T(2,k),'gs')
        else
            
            plot(T(1,k),T(2,k),'bo')
        end
    else
        disp(mm)
        plot(T(1,k),T(2,k),'kx')
    end
end