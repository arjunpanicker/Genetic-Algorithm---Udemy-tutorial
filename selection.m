function [parent1, parent2] = selection(population)

    M = length(population.Chromosomes(:));
    
    if any([population.Chromosomes(:).fitness] < 0)
        % Fitness Scaling: Solves issues due to negative fitness values (maps
        % negative value to positive value) f = a*f + b, a = 1
        a = 1;
        b = min( [population.Chromosomes(:).fitness] );
        b = abs(b);
        
        scaled_fitness = a*[population.Chromosomes(:).fitness]+b+1; % +1 can be used to overcome divide by zero error
        normalized_fitness = scaled_fitness ./ sum(scaled_fitness);
        
    else % No negative fitness values
        normalized_fitness = [population.Chromosomes(:).fitness] ./ sum([population.Chromosomes(:).fitness]);
    end
    
    [sorted_normalized_fitness, sorted_idx] = sort(normalized_fitness, 'descend');
    
    % Sorting the population according to the fitness
    for i=1:length(population.Chromosomes)
       temp_population.Chromosomes(i).Gene = population.Chromosomes(sorted_idx(i)).Gene;
       temp_population.Chromosomes(i).fitness = population.Chromosomes(sorted_idx(i)).fitness;
       temp_population.Chromosomes(i).normalized_fitness = normalized_fitness(sorted_idx(i));
    end
    
    % Finding cumulative sum of the normalized fitness using the sorted
    % array
    cumsum = zeros(1, M);
    
    for i=1: M
        for j=i: M
            cumsum(i) = cumsum(i) + temp_population.Chromosomes(j).normalized_fitness;
        end
    end
    
    
    % Parent selection
    R = rand(); % in [0,1]
    parent1_idx = 0;
    for i = 1: length(cumsum)
        if R > cumsum(i)
            parent1_idx = i-1;
            break;
        end
    end
    
    parent2_idx = parent1_idx;
    while parent2_idx == parent1_idx
        R = rand(); % in [0, 1]

        for i = 1: length(cumsum)
            if R > cumsum(i)
                parent2_idx = i-1;
                break;
            end
        end
    end
    
    parent1 = temp_population.Chromosomes(parent1_idx);
    parent2 = temp_population.Chromosomes(parent2_idx);

end