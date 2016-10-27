function [ C ] = calcC( q )
%CALCC Summary of this function goes here
%   Detailed explanation goes here
    qv = q(2:4);
    Q = [0 -qv(3) qv(2); qv(3) 0 -qv(1);-qv(2) qv(1) 0];
    C = (q(1)^2 - qv*qv')*eye(3) + 2*qv'*qv - 2*q(1) * Q;


end

