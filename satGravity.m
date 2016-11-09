function [ Tg ] = satGravity( I, wio, q )
%SATGRAVITY Summary of this function goes here
%   Detailed explanation goes here
    Tg = zeros(1,3);
    q = reshape(q,1,4);
    [yaw, pitch, ] = quat2angle(q, 'ZYX');
    Tg(1) = 3*wio(2)^2*((I(3,3) - I(2,2))*yaw + I(2,3) - I(1,2)*pitch);
    Tg(2) = 3*wio(2)^2*((I(3,3) - I(2,2))*pitch - I(1,3) - I(1,2)*yaw);
    Tg(3) = 3*wio(2)^2*(I(2,3)*pitch + I(1,3)*yaw);
end