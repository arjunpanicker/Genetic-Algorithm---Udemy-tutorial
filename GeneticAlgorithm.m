function [BestChromosome] = GeneticAlgorithm(M, N, MaxGen, Pc, Pm, Er, objF)
    %% Initialization of the population randomly
    [population] = initialization(M, N);
    % Calculate the fitness values
    for i = 1:M
        population.Chromosomes(i).fitness = objF(population.Chromosomes(i).Gene(:));
    end
    g = 1;
    disp(['Generation #', num2str(g)]);

    %% Main Loop
    for g = 2: MaxGen
        disp(['Generation #', num2str(g)]);

        for k = 1:2:M
            % Selection
            [parent1, parent2] = selection(population);

            % Crossover
            [child1, child2] = crossover(parent1, parent2, Pc, 'single');

            % Mutation
            [child1] = mutation(child1, Pm);
            [child2] = mutation(child2, Pm);

            newPopulation.Chromosomes(k).Gene = child1.Gene;
            newPopulation.Chromosomes(k+1).Gene = child2.Gene;
        end

        for i = 1:M
            newPopulation.Chromosomes(i).fitness = objF(newPopulation.Chromosomes(i).Gene(:));
        end

        % Elitism
        [newPopulation] = elitism(newPopulation, Er);

        population = newPopulation;
    end
    %%
    
    %% Returning the fittest value
    [~, index] = sort([population.Chromosomes(:).fitness], 'descend');
    
    BestChromosome.Gene = population.Chromosomes(index(1)).Gene;
    BestChromosome.Fitness = population.Chromosomes(index(1)).fitness;
end