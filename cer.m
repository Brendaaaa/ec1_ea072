% Calcula as diferencas entre o esperado e o q obtivemos...
%

function [cer_per_class, cer_percentage] = cer(X_va, d_va, w)

    samples_per_class = zeros(1,10,'double');
    right_answer_per_class = zeros(1,10,'double');
    
    for i=1:size(X_va,1) % para cada imagem
        s = d_va(i,:); % now we have s: 1 x 10
        X = X_va(i,:); % now we have X: 1 x 785
        s_training = X*w;
        [M1, I1] = max(s);
        [M2, I2] = max(s_training);
        % verifica se a rede neural acerta a classe
        % Isto eh, se o indice maior elemento do vetor calculado eh o mesmo da solucao correta
        samples_per_class(I1) = samples_per_class(I1) + 1; % agora tem mais uma amostra dessa classe
        if (I1 == I2) 
            right_answer_per_class(I1) = right_answer_per_class(I1) + 1;
        end
    end
    
    % error per class
    cer_per_class = 1- (right_answer_per_class./samples_per_class);
    cer_percentage = sum(cer_per_class)/10;