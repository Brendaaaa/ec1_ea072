% qmean2.m
% Calcula as diferencas entre o esperado e o q obtivemos...
%

function [percentage] = validate(X_va, d_va, w)

    total = size(X_va,1);
    correct = 0;

    for i=1:size(X_va,1) % para cada imagem
        s = d_va(i,:); % now we have s: 1 x 10
        X = X_va(i,:); % now we have X: 1 x 785
        s_training = X*w;
        [M1, I1] = max(s);
        [M2, I2] = max(s_training);
        % verifica se a rede neural acerta a classe
        % Isto eh, se o indice maior elemento do vetor calculado eh o mesmo da solucao correta
        if (I1 == I2) 
            correct = correct + 1;
        end
    end

    % retorna qual a porcentagem de acertos
    percentage = 100*correct/total;
