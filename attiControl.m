function [ T ] = attiControl( wobm, dq, kd, kp )
%ATTICONTROL Summary of this function goes here
%   Detailed explanation goes here
% wobm,dq,kd,kp 均为行向量 1*3
    dq = [dq(2) dq(3) dq(4)];
    kd = reshape(kd, 1, 3);
    kp = reshape(kp, 1, 3);
    wobm = reshape(wobm, 1, 3);
    T = -(kp.*dq + kd.*wobm);

end