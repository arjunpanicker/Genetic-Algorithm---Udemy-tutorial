clear; clc;

M = 10; % number of chromosomes (candidate solutions)
N = 8; % number of genes in each chromosome (variables)

for i = 1:M
    rand();
    population.Chromosomes(i).Gene(:) = [round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() )];
    population.Chromosomes(i).fitness = sphere(population.Chromosomes(i).Gene(:));
end

for k = 1:2:M
    
    % Selection
    [parent1, parent2] = selection(population)
    
    % Crossover
    P_c = 0.5;  % Probability of crossover
    [child1, child2] = crossover(parent1, parent2, P_c, 'single');
    
    % Mutation
    Pm = 0.2;
    [child1] = mutation(child1, Pm);
    [child2] = mutation(child2, Pm);
    
    newPopulation.Chromosomes(k).Gene = child1.Gene;
    newPopulation.Chromosomes(k+1).Gene = child2.Gene;
end