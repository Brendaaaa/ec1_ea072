% part1.m
% Calcula w e a soma para cada lambda...
%

function [w, table] = linear_classifier(X_tr, d_tr, X_va, d_va, X_test, d_test, X, S, initial_lambda, final_lambda, step)

% adding line of 1s in the transpose matrix
X_tr_T = [X_tr; repelem([1],size(X_tr,2))];
% this is the 'H' matrix: 40000 x 785
X_tr = transpose(X_tr_T);
% this is the 's' matrix: 40000 x 10
d_tr = transpose(d_tr);
% this is the H matrix for validation
X_va = transpose([X_va; repelem([1],size(X_va,2))]);
% this is the 's' matrix for validation
d_va = transpose(d_va);
% this is the H matrix for testing
X_test = transpose([X_test; repelem([1],size(X_test,2))]);
% this is the 's' matrix for testing
d_test = transpose(d_test);

n = size(X_tr,2);  % numero de colunas de X_tr eh a dimensao da matriz identidade
best_w = repelem([1],n);
best_cer_percentage = 1.0;
best_lambda = initial_lambda;
I = eye(n);
table = [0 ; 0];

% searching for the best lambda
for lambda=initial_lambda:step:final_lambda

    w = inv(X_tr_T*X_tr - lambda.*I)*X_tr_T*d_tr;

    [cer_per_class, cer_percentage] = cer(X_va, d_va, w);
    if (cer_percentage < best_cer_percentage)
        best_w = w;
        best_lambda = lambda;
        best_cer_percentage = cer_percentage;
    end
    disp(sprintf('lambda = %f -> CER = %f\n', lambda, cer_percentage));
    table = [table [lambda; cer_percentage]];
end

disp('RESULT OF VALIDATION');
disp(sprintf('best_lambda = %f -> CER = %f\n', best_lambda, best_cer_percentage));

% aqui tem q calcular o w de novo com todo o conjunto e o melhor lambda
X_T = transpose(X);
X_T = [X_T; repelem([1],size(X_T,2))]; % adiciona linha d 1...
X = transpose(X_T);

n = size(X,2);  % numero de colunas de X eh a dimensao da matriz identidade
I = eye(n);

w = inv(X_T*X - best_lambda.*I)*X_T*S;

[cer_per_class, cer_percentage] = cer(X, S, w);

disp('RESULT IN TESTING');
disp('CER per class');
disp(transpose(cer_per_class));
disp(sprintf('CER = %f', cer_percentage));
stem(table(1, :), table(2, :));