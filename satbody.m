function [ dx ] = satbody( t, x, Torque, I, wio, sunVector )
%SATBODY Summary of this function goes here
%   Detailed explanation goes here
    w = x(1:3);
    q = x(4:7);
    Td = satSunray(wio, t, sunVector);%Notice: Sun is visible or not
    Tg = satGravity(I, wio, q);
    Ta = satAeroTorque(wio, t);
    Torque = Torque + Td + Tg + Ta;
    dw = satdynamic(t, w, I, Torque);
    dq = satkinematics(t, q, w, wio);
    dx = [dw;dq];
end