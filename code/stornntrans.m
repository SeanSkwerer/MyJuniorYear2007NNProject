%  stornntrans.m
%  Subroutine that computes transfer function
%
function[vs] = stornntrans(t,u,key)
%
vs = zeros(t,1);
v = zeros(t,1);
if key == 1
    % 0-1 sigmoid function
    vs = 1./(1 + exp(-u));
elseif key == 2
    % -1 -1 sigmoid function
    vs = (exp(u) - exp(-u))./(exp(u) + exp(-u));
elseif key == 3 
    % linear transfer function
    vs = u;
end
