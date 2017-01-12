clear;
clc;

format long;
try
    stkClose(conid);
    stkColse();
catch ME
    disp('stkClose Message');
end
satPath = '*/Satellite/Satellite1';
scenario = 'Scenario/test2';
cb = 'Earth';
t = 0;
dt = 1;
stkInit;
conid = stkOpen(stkDefaultHost);
stkExec(conid, ['Animate ' scenario ' Reset']);
stkExec(conid, ['SetAnimation ' scenario ' TimeStep ' num2str(dt)]);
temp = stkReport(satPath, 'SunVector', t, t, dt);
q = zeros(1, 4);
earthVector = zeros(1, 3);
sunVector = zeros(1, 3);
for i = 2:5
    q(i-1) = temp{1}(i).data;
end
for i = 2:4
    earthVector(i-1) = temp{2}(i).data;
    sunVector(i-1) = temp{3}(i).data;
end
