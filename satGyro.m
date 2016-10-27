function [ wob_m ] = satGyro( wob, drift, noig )
%SATGYRO Summary of this function goes here
%   Detailed explanation goes here 都是三维向量 需要添加精度模块
%wob 为行向量 1*3
%drift 为行向量，漂移 1*3
%noig 为高斯白噪音系数
    wob_m = wob + drift + noig*rand([1,3]);
end