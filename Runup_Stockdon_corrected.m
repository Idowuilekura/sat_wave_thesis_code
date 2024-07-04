function [R_corrected,Setup_corrected] = Runup_Stockdon_corrected(Hs,Tp,Beta)
    Lo = 1.56 * (Tp.^2);
    HLo = Hs.*Lo;
    A = 0.35 .* Beta.*(sqrt(HLo));
    B = sqrt(HLo.*(0.563.*((Beta.^2) + 0.004)))./2;
    R = 1.1.*(A + B);
    R_corrected = R - 0.41;
    Setup_corrected = 0.35.*Beta.*(sqrt(HLo));