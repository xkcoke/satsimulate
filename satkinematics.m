function [ dq ] = satkinematics( t, q, wib, wio )
%SATKINEMATICS Summary of this function goes here
%   Detailed explanation goes here
%q 为行向量 1*4
%wio 为行向量 1*3
%dq 为列向量 4*1

q = reshape(q,1,4);

% wio = [wio 0];
    w = wib2wob(wib, q, wio);
    w = [0 w];
    dq = 0.5 * quatmultiply(q, w)';

end