function [R2_corrected,Swash_corrected] = holman_compute_corrected(slope, Hs, Tp)
    Lo = 1.56 * (Tp.^2);
    HLo = Hs.*Lo;
    surf_similarity_holman = slope./sqrt(HLo);
    R2_corrected = Hs .* (0.20 + 0.86 .* surf_similarity_holman);
    R2_corrected = R2_corrected +  0.35;
    Swash_corrected = Hs .* (0.06 + 0.85 .* surf_similarity_holman);
 end