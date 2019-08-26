clear; clc;

M = 10; % number of chromosomes (candidate solutions)
N = 8; % number of genes in each chromosome (variables)

for i = 1:M
    rand();
    population.Chromosomes(i).Gene(:) = [round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() ), round( rand() )];
    population.Chromosomes(i).fitness = fitness_function(population.Chromosomes(i).Gene(:));
end

[parent1, parent2] = selection(population)

P_c = 0.5  % Probability of crossover
crossoverName = 'double';
[child1, child2] = crossover(parent1, parent2, P_c, crossoverName)