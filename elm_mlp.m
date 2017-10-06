% part1.m
% Calcula w e a soma para cada lambda...
%

function [w_aleatorio, w_saida, table] = elm_mlp(X_tr, d_tr, X_va, d_va, X_test, d_test, X, S, initial_lambda, final_lambda, step)

w_aleatorio = randn(size(X_tr, 1),1200);
Z = tanh(transpose(X_tr)*w_aleatorio);

[w_saida, table] = linear_classifier(transpose(Z),d_tr,transpose(tanh(transpose(X_va)*w_aleatorio)),d_va,transpose(tanh(transpose(X_test)*w_aleatorio)),d_test, tanh(X*w_aleatorio),S, initial_lambda,final_lambda,step);
