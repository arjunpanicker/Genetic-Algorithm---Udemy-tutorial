function [fitness_value] = sphere(X)
    fitness_value = sum(X.^2);
end