function [child1, child2] = crossover(parent1, parent2, P_c, crossoverName)
    
    Gene_no = length(parent1.Gene);
	ub = Gene_no - 1;
	lb = 1;
    
    switch crossoverName
        case 'single'
            Cross_P = round((ub - lb)*rand() + lb)
            Part1 = parent1.Gene(1: Cross_P);
            Part2 = parent2.Gene(Cross_P + 1:end);
            child1.Gene = [Part1, Part2];
            
            Part1 = parent2.Gene(1: Cross_P);
            Part2 = parent1.Gene(Cross_P + 1:end);
            child2.Gene = [Part1, Part2];
        case 'double'
            Cross_P1 = round((ub - lb)*rand() + lb);
            Cross_P2 = Cross_P1;
            
            while Cross_P2 == Cross_P1
                Cross_P2 = round((ub - lb)*rand() + lb);
            end
            
            % swap if Cross_P2 < Cross_P1
            if Cross_P1 > Cross_P2
                temp = Cross_P1;
                Cross_P1 = Cross_P2;
                Cross_P2 = temp;
            end
            Cross_P1
            Cross_P2
            
            Part1 = parent1.Gene(1: Cross_P1);
            Part2 = parent2.Gene(Cross_P1 + 1: Cross_P2);
            Part3 = parent1.Gene(Cross_P2 + 1:end);
            child1.Gene = [Part1, Part2, Part3];
            
            Part1 = parent2.Gene(1: Cross_P1);
            Part2 = parent1.Gene(Cross_P1 + 1: Cross_P2);
            Part3 = parent2.Gene(Cross_P2 + 1:end);
            child2.Gene = [Part1, Part2, Part3];
            
    end
    
    R1 = rand();
    R2 = rand();
    
    % if R1 <= Crossover prob. then no change req else, child1 = parent1
    if R1 > P_c
        child1 = parent1.Gene;
    end
    
    % if R2 <= Crossover prob. then no change req else, child2 = parent2
    if R2 > P_c
        child2 = parent2.Gene;
    end
    
end