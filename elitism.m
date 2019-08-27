function [newPopulation] = elitism(population, Er)

    Elite_no = round(10*Er);
    [~, index] = sort([population.Chromosomes(:).fitness], 'descend');
    for i = 1:Elite_no
        newPopulation.Chromosomes(i).Gene = population.Chromosomes(index(i)).Gene;
        newPopulation.Chromosomes(i).fitness = population.Chromosomes(index(i)).fitness;
    end
    
    for i = Elite_no+1:length(population.Chromosomes)
        newPopulation.Chromosomes(i).Gene = population.Chromosomes(i).Gene;
        newPopulation.Chromosomes(i).fitness = population.Chromosomes(i).fitness;
    end

end