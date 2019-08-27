% Genetic Algorithm V1.0

clear; clc;

%% controlling parameters of GA
Problem.objF = @sphere;
Problem.nVar = 10;
objF = @sphere; % Objective function address

M = 100; % number of chromosomes (candidate solutions)
N = Problem.nVar; % number of genes in each chromosome (variables)
MaxGen = 10; % Maximum generation
Pc = 0.85;  % Probability of crossover
Pm = 0.01; % Probability of mutation
Er = 0.2; % Elitism Ratio

%%

%% Calling the GA function

[BestChromosome] = GeneticAlgorithm(M, N, MaxGen, Pc, Pm, Er, Problem.objF)