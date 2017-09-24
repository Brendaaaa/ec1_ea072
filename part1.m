% part1.m
% Calcula w e a soma para cada lambda...
%

function [lambda] = part1(X_tr, d_tr)
% X_tr : 40000 x 785
% d_tr : 40000 x 10

n = size(X_tr,2); % numero de colunas de X_tr eh a dimensao da matriz identidade
X_tr_T = transpose(X_tr);
correct_count = 0;
total = size(X_tr,1);

for lambda=1:2:5

    w = inv(X_tr_T*X_tr  - lambda.*eye(n))*X_tr_T*d_tr;

    sum_total = 0;

    for i=1:size(X_tr,1) % para cada linha da matriz, ou seja, para cada imagem
        X = X_tr(i,:); % now we have X: 1 x 784
        v2 = X*w;
        v1 = d_tr(i,:); % now we have v1 1 x 10
        [sum] = qmean2(v1, v2);
        %[correct, sum] = qmean2(v1, v2);
        sum_total = sum_total + sum;
        %correct_count = correct_count + correct;
    end
    % print lambda e a soma obtida
    disp(lambda);
    disp(sum_total);
    % disp(100*correct_count/total); % aqui eh a porcentagem do q esta certo
    disp('    ');
end
