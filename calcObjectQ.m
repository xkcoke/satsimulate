function [ axis,q] = calcObjectQ( target, constraint )
%CALCOBJECTQ Summary of this function goes here
%   计算目标跟踪时的目标姿态四元数，以x轴跟踪太阳(target)并以z轴指向地面的限制为例
    target = target/norm(target);
    constraint = constraint/norm(constraint);
    n = cross(target, constraint);%target,constraint所在平面的法线
    axis_z = zeros(1, 3);%根据点法式方程求Z轴
    axis_z(1) = 1;
    axis_z(2) = (n(1)*target(3)-n(3)*target(1))/(n(3)*target(2)-n(2)*target(3));
    axis_z(3) = (n(1)*target(2)-n(2)*target(1))/(n(2)*target(3)-n(3)*target(2));
    if dot(constraint, axis_z) < 0%保证Z轴和限制轴同方向
        axis_z = -axis_z;
    end
    axis_z = axis_z/norm(axis_z);
    axis_y = cross(axis_z, target);%z轴和x轴的叉乘就是y轴
    axis = [target; axis_y; axis_z];
    A = axis*eye(3);
    
    q = dcm2quat(A);
end