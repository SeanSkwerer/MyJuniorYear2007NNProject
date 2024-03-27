%Two Cirlces
function [Xa,Ya_top,Ya_bottom,Xa0,Ya0,Ra2,Xb,Yb_top,Yb_bottom,Xb0,Yb0,Rb2] = Two_Circles(circle_key);
if circle_key == 1;
Xa0 = 0; Ya0 = 1; Xb0 = 1; Yb0 = 0; Ra2 = 0.5; Rb2 = 0.5;
Xa = linspace(0,sqrt(0.5),100);
Xb = linspace(1-sqrt(0.5),1,100);
Ya_top = sqrt(0.5-Xa.^2)+1;
Ya_bottom = -sqrt(0.5-Xa.^2)+1;
Yb_top = sqrt(0.5 - (Xb-1).^2);
Yb_bottom = -sqrt(0.5 - (Xb-1).^2);
end

if circle_key == 2;
    Xa0 = 1/4; Ya0 = 3/4; Xb0 = 3/4; Yb0 = 1/4;Ra2 = 0.125; Rb2 = 0.125;
    Xa = linspace(0,.25+sqrt(0.125),100);
    Xb = linspace(0.75-sqrt(0.125),1,100);
    Ya_top = 0.75 + sqrt(0.125-(Xa-1/4).^2);
    Ya_bottom = 0.75 - sqrt(0.125-(Xa-1/4).^2);
    Yb_top = 0.25 + sqrt(0.125-(Xb-3/4).^2);
    Yb_bottom = 0.25 - sqrt(0.125-(Xb-3/4).^2);
end

if circle_key == 3;
    Xa0 = 3/8; Ya0 = 5/8; Xb0 = 5/8; Yb0 = 3/8;Ra2 = 1/32; Rb2 = 1/32;
Xa = linspace(3/8-sqrt(1/32),3/8+sqrt(1/32),100);
    Xb = linspace(5/8-sqrt(1/32),5/8+sqrt(1/32),100);
    Ya_top = 5/8 + sqrt(1/32-(Xa-3/8).^2);
    Ya_bottom = 5/8 - sqrt(1/32-(Xa-3/8).^2);
    Yb_top = 3/8 + sqrt(1/32-(Xb-5/8).^2);
    Yb_bottom = 3/8 - sqrt(1/32-(Xb-5/8).^2);
end

if circle_key == 4;
    Xa0 = 7/16; Ya0 = 9/16; Xb0 = 9/16; Yb0 = 7/16;Ra2 = 1/128; Rb2 = 1/128;
   Xa = linspace(7/16-sqrt(1/128),7/16+sqrt(1/128),100);
    Xb = linspace(9/16-sqrt(1/128),9/16+sqrt(1/128),100);
    Ya_top = 9/16 + sqrt(1/128-(Xa-7/16).^2);
    Ya_bottom = 9/16 - sqrt(1/128-(Xa-7/16).^2);
    Yb_top = 7/16 + sqrt(1/128-(Xb-9/16).^2);
    Yb_bottom = 7/16 - sqrt(1/128-(Xb-9/16).^2); 
end

if circle_key ==5;
    Xa0 = 15/32; Ya0 = 17/32; Xb0 = 17/32; Yb0 = 15/32;Ra2 = 1/512; Rb2 = 1/512;
    Xa = linspace(15/32-sqrt(1/512),15/32+sqrt(1/512),100);
    Xb = linspace(17/32-sqrt(1/512),17/32+sqrt(1/512),100);
    Ya_top = 17/32 + sqrt(1/512-(Xa-15/32).^2);
    Ya_bottom = 17/32 - sqrt(1/512-(Xa-15/32).^2);
    Yb_top = 15/32 + sqrt(1/512-(Xb-17/32).^2);
    Yb_bottom = 15/32 - sqrt(1/512-(Xb-17/32).^2);
end

if circle_key ==6;
    Xa0 = 14/32; Ya0 = 18/32; Xb0 = 18/32; Yb0 = 14/32;Ra2 = 1/512; Rb2 = 1/512;
    Xa = linspace(14/32-sqrt(1/512),14/32+sqrt(1/512),100);
    Xb = linspace(18/32-sqrt(1/512),18/32+sqrt(1/512),100);
    Ya_top = 18/32 + sqrt(1/512-(Xa-14/32).^2);
    Ya_bottom = 18/32 - sqrt(1/512-(Xa-14/32).^2);
    Yb_top = 14/32 + sqrt(1/512-(Xb-18/32).^2);
    Yb_bottom = 14/32 - sqrt(1/512-(Xb-18/32).^2);
end

if circle_key == 7;
    Xa0 = 6/16; Ya0 = 10/16; Xb0 = 10/16; Yb0 = 6/16;Ra2 = 1/128; Rb2 = 1/128;
    Xa = linspace(6/16-sqrt(1/128),6/16+sqrt(1/128),100);
    Xb = linspace(10/16-sqrt(1/128),10/16+sqrt(1/128),100);
    Ya_top = 10/16 + sqrt(1/128-(Xa-6/16).^2);
    Ya_bottom = 10/16 - sqrt(1/128-(Xa-6/16).^2);
    Yb_top = 6/16 + sqrt(1/128-(Xb-10/16).^2);
    Yb_bottom = 6/16 - sqrt(1/128-(Xb-10/16).^2); 
end

if circle_key == 8;
    Xa0 = 2/8; Ya0 = 6/8; Xb0 = 6/8; Yb0 = 2/8;Ra2 = 1/32; Rb2 = 1/32;
Xa = linspace(2/8-sqrt(1/32),2/8+sqrt(1/32),100);
    Xb = linspace(6/8-sqrt(1/32),6/8+sqrt(1/32),100);
    Ya_top = 6/8 + sqrt(1/32-(Xa-2/8).^2);
    Ya_bottom = 6/8 - sqrt(1/32-(Xa-2/8).^2);
    Yb_top = 2/8 + sqrt(1/32-(Xb-6/8).^2);
    Yb_bottom = 2/8 - sqrt(1/32-(Xb-6/8).^2);
end

if circle_key == 9;
    Xa0 = 1/8; Ya0 = 7/8; Xb0 = 7/8; Yb0 = 1/8;Ra2 = 1/8; Rb2 = 1/8;
    Xa = linspace(0,1/8+sqrt(0.125),100);
    Xb = linspace(7/8-sqrt(0.125),1,100);
    Ya_top = 7/8 + sqrt(1/8-(Xa-1/8).^2);
    Ya_bottom = 7/8 - sqrt(0.125-(Xa-1/8).^2);
    Yb_top = 1/8 + sqrt(0.125-(Xb-7/8).^2);
    Yb_bottom = 1/8 - sqrt(0.125-(Xb-7/8).^2);
end

%plot(Xa,Ya_top,'k',Xa,Ya_bottom,'k',Xb,Yb_top,'k',Xb,Yb_bottom,'k');
%axis([0 1 0 1]);
