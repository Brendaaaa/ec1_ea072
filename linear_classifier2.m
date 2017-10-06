% part1.m
% Calcula w e a soma para cada lambda...
%

function [w, table] = linear_classifier2(X_tr, d_tr, X_va, d_va, X_test, d_test, initial_lambda, final_lambda, step)

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
best_percentage = 0;
best_lambda = initial_lambda;
I = eye(n);
table = [0 ; 0];

for lambda=initial_lambda:step:final_lambda

    w = inv(X_tr_T*X_tr - lambda.*I)*X_tr_T*d_tr;

    disp(lambda);
    percentage = validate(X_va, d_va, w);
    disp(percentage); % aqui eh a porcentagem do q esta certo
    if (percentage > best_percentage)
        best_w = w;
        best_lambda = lambda;
        best_percentage = percentage;
    end
    disp('    ');
    table = [table [lambda; percentage]];
end

disp('RESULT OF VALIDATION');
disp(best_lambda);
disp(best_percentage);


percentage = validate(X_test, d_test, w);

disp('RESULT IN TESTING');
disp(best_lambda);
disp(best_percentage);