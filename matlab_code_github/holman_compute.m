function [R2,Swash] = holman_compute(slope, Hs, Tp)
   Lo = 1.56 * (Tp.^2);
   HLo = Hs.*Lo;
   surf_similarity_holman = slope./sqrt(HLo);
   R2 = Hs .* (0.20 + 0.86 .* surf_similarity_holman);
   Swash = Hs .* (0.06 + 0.85 .* surf_similarity_holman);
end

