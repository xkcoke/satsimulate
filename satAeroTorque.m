function [ Ta ] = satAeroTorque( wio, t )
%SATAEROTORQUE Summary of this function goes here
%   Detailed explanation goes here
    i = deg2rad(45);%inclination
    R = 300*10^3;
    mu = 3.986*10^14;
    rho = 2.418*10^(-11);
    Cd = 2.5;%2.2-2.6
    Ap_x = 0.02;
    Ap_y = 0.02;
    Ap_z = 0.01;
    lx = 0.2*(rand()-0.5)*2;
    ly = 0.2*(rand()-0.5)*2;
    lz = 0.1*(rand()-0.5)*2;%random definition of lx, ly, lz
    we = deg2rad(15/3600);
    am = 1.5*we/wio(2)*sin(i);
    alpha = am * cos(wio(2)*t);
    Vr = mu/R*(1 - 3*we/wio(2)*cos(i));
    Ta(1) = -rho*Vr/2*Cd*Ap_x*lz*alpha;
    Ta(2) = -rho*Vr/2*Cd*Ap_y*lz;
    Ta(3) = -rho*Vr/2*Cd*Ap_z*(lx*alpha+ly);

end