function [fitness_value] = fitness_function(X)
    % Fitness function for the ceiling fan design problem
    no_blades = X(1);
    length_blades = X(2);
    fitness_value = (no_blades + length_blades) * 12.3 * pi;
    
end