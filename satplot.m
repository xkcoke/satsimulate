function [ y ] = satplot( qt, xmem, episode )
%SATPLOT Summary of this function goes here
%   Detailed explanation goes here
    qt = reshape(qt, 1, 4);
    q = xmem(:,4:7);
    qt = repmat(qt, episode, 1);
    plot(1:episode, qt, '.');
    hold on;
    plot(1:episode, q);
end