function [ Td ] = satSunray( wio, t, dt, satPath )
%SATSUN Summary of this function goes here
%   Detailed explanation goes here
    Kn = 1*10^(-5);
    Kt = 5*10^(-6);
    rx = 0.5;
    rz = 0.5;
    ry = 2;
    sunVector = zeros(1,3);%1:x, 2:y, 3:z
    Td = zeros(1,3);%Sun Density Torque
    temp = stkReport(satPath, 'SunVector', t, t, dt);
    for i = 2:4;
        sunVector(i) = temp{1}(i).data;
    end
    deltaX = acos(sunVector(1)/sqrt(sum(sunVector.^2)));
    deltaZ = acos(sunVector(3)/sqrt(sum(sunVector.^2)));
    eta =  acos(sunVector(3)/sqrt(sunVector(1)^2+sunVector(3)^2));
    xi = acos(sunVector(1)/sqrt(sunVector(1)^2+sunVector(3)^2));
    Tox = -Kt*sin(2*deltaX)*rz;
    Toz = Kt*sin(2*deltaZ)*rx;
    Ts = Kn * ry;
    Tss = Kn * (rx+rz)^0.5;
    Td(1) = Tox + Ts*cos(wio(2)*t+eta);
    Td(2) = Tss*cos(wio(2)*t+eta+xi);
    Td(3) = Toz - Ts*sin(wio(2)*t+eta);
end