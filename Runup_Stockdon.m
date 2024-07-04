function [R,Setup] = Runup_Stockdon(Hs,Tp,Beta)
Lo = 1.56 * (Tp.^2);
HLo = Hs.*Lo;
A = 0.35 .* Beta.*(sqrt(HLo));
B = sqrt(HLo.*(0.563.*((Beta.^2) + 0.004)))./2;
R = 1.1.*(A + B);
Setup = 0.35.*Beta.*(sqrt(HLo));