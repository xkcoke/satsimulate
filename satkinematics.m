function [ dq ] = satkinematics( t, q, wib, wio )
%SATKINEMATICS Summary of this function goes here
%   Detailed explanation goes here
%q 为行向量 1*4
%wio 为行向量 1*3
%dq 为列向量 4*1

% wio = [wio 0];
    wib = reshape(wib, 1, 3);
    wio = reshape(wio, 1, 3);%保证格式正确
    w = wib - (calcC(q) * wio')';
    w = [w 0];
    dq = 0.5 * quatmultiply(q', w)';

end