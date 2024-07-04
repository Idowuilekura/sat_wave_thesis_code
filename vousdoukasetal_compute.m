function [R_with_tide, R_no_tide] = vousdoukasetal_compute(beta, Hs,Tp,tide_value)
    slope = beta;
    Lo = 1.56 .* (Tp.^2);
    HLo = Hs.*Lo;
    surf_similarity_holman = slope./sqrt(HLo);
    left_side_no_tide = 0.53 .* beta .* ((HLo) .^ 0.5);
    right_side_no_tide = 0.58 .* surf_similarity_holman .* sqrt((Hs.^3)./Lo);
    R_no_tide = left_side_no_tide +  right_side_no_tide + 0.45;

    left_side_with_tide = 0.503 .* beta .* ((HLo) .^ 0.5);
    right_side_with_tide = 0.878 .* surf_similarity_holman .* (((Hs.^3)./Lo).^0.5);
    R_with_tide = left_side_with_tide + right_side_with_tide + 0.188 .* tide_value + 0.457;

end



