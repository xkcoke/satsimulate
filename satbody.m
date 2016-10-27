function [ dx ] = satbody( t, x, Torque, I, wio )
%SATBODY Summary of this function goes here
%   Detailed explanation goes here
    w = x(1:3);
    q = x(4:7);
    
    q(1) = sqrt(abs(1 - sum(q(2:4).^2)));%ºı…Ÿ¿€º∆ŒÛ≤Ó
    
    dw = satdynamic(t, w, I, Torque);
    dq = satkinematics(t, q, w, wio);
    dx = [dw;dq];
end