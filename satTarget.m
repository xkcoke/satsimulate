function [ qe ] = satTarget( Q, Qt )
%SATTARGET Summary of this function goes here
%   Detailed explanation goes here
    invqt = [Qt(1) -Qt(2) -Qt(3) -Qt(4)];
    Q = reshape(Q, 1, 4);
    qe = quatmultiply(invqt, Q);

end