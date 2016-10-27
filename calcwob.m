function [ wob ] = calcwob( wib, wio, q )
%CALCWBO Summary of this function goes here
%   Detailed explanation goes here
    wob = wib - calcC(q)*wio;

end

