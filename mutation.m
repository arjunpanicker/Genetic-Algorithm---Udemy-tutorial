function [child] = mutation(child, Pm)

    Gene_No = length(child.Gene);
    for k = 1:Gene_No
       R = rand();
       if R < Pm
           child.Gene(k) = ~child.Gene(k);
       end
    end

end