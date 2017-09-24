% qmean2.m
% Calcula as diferencas entre o esperado e o q obtivemos...
%

 function [correct, sum] = qmean2(v1,v2) % ao descomentar essa, comenta a debaixo
%function [sum] = qmean2(v1,v2)

sum = 0;
correct = 0;
for i=1:size(v1) % para cada elemento do vetor
    sum = sum + (v1(i) - v2(i))^2;
end

[M1, I1] = max(v1);
[M2, I2] = max(v2);
if (I1 == I2)
    correct = 1;
end

sum = sum/size(v1,2);
