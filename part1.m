% part1.m
% Calcula w e a soma para cada lambda...
%

function [w] = part1(X_tr, d_tr, X_va, d_va, initial_lambda, final_lambda, step)
% X_tr : 40000 x 785
% d_tr : 40000 x 10


X_tr_T = X_tr;
X_tr = transpose(X_tr);
d_tr = transpose(d_tr);
X_va = transpose(X_va);
d_va = transpose(d_va);

n = size(X_tr,2); % numero de colunas de X_tr eh a dimensao da matriz identidade
correct_count = 0;
total = size(X_tr,1);
best_w = repelem([1],n);
best_percentage = 0;
best_lambda = initial_lambda;

for lambda=initial_lambda:step:final_lambda

    w = inv(X_tr_T*X_tr  - lambda.*eye(n))*X_tr_T*d_tr;

    sum_total = 0;
    correct_count = 0;

    for i=1:size(X_tr,1) % para cada linha da matriz, ou seja, para cada imagem
        X = X_tr(i,:); % now we have X: 1 x 784
        v2 = X*w;
        v1 = d_tr(i,:); % now we have v1 1 x 10
        [correct, sum] = qmean2(v1, v2);
        sum_total = sum_total + sum;
        correct_count = correct_count + correct;
    end
    
    disp(lambda);
    disp(sum_total);
    percentage = 100*correct_count/total;
    disp(percentage); % aqui eh a porcentagem do q esta certo
    if (percentage > best_percentage)
        best_w = w;
        best_lambda = lambda;
        best_percentage = percentage;
    end
    disp('    ');
end

disp('BEST IN TRAINING');
disp(best_lambda);
disp(sum_total);
disp(best_percentage);


% validation %%%%%%
sum_total = 0;
correct_count = 0;
total = size(X_va,1);
n = size(X_va,2);

for i=1:size(X_va,1) % para cada linha da matriz, ou seja, para cada imagem
    X = X_va(i,:); % now we have X: 1 x 784
    v2 = X*best_w;
    v1 = d_va(i,:); % now we have v1 1 x 10
    %[sum] = qmean2(v1, v2);
    [correct, sum] = qmean2(v1, v2);
    sum_total = sum_total + sum;
    correct_count = correct_count + correct;
end
    
disp('VALIDATION RESULTS');
disp(sum_total);
percentage = 100*correct_count/total;
disp(percentage); % aqui eh a porcentagem do q esta certo
    
