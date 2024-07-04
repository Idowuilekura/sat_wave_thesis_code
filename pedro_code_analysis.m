Tp = table2array(mergedwaveimageslopedetails(:,7));
Tide = table2array(mergedwaveimageslopedetails(:,9));
Hs = table2array(mergedwaveimageslopedetails(:,6));
slope_data = table2array(mergedwaveimageslopedetails(:,"slope"));
wet_sand_line = table2array(mergedwaveimageslopedetails(:,"wetsand"));
water_line = table2array(mergedwaveimageslopedetails(:,"waterline"));
ws = wet_sand_line;
wl = water_line;
% Beta = 0.1;
[R_slope_data, setup_slope_data] = Runup_Stockdon(Hs, Tp, slope_data);
% stockfdon runp + tide
R2 = R_slope_data + Tide;
% set up computed with stockdon
Setup = setup_slope_data + Tide;
plot(wl,'r')
hold on
plot(ws,'g')
plot(R2,'k')
legend('waterline','wetsandline','R2')
title("waterline vs wetsandline vs R2")
% #average wet dry(ws) and waterline(wl) can be seen as setup
A = [wl ws];
%  B is the mean of waterline and wetsand
B = mean(A,2);
% # plot
plot(B,'b')
hold on
plot(R2,'k')
plot(Setup,'r')
% subplot(1,3,1);plot(wl,'b');hold on;plot(Setup,'r');title('waterline');plot(R2,'g')
% subplot(1,3,2);plot(ws,'b');hold on;plot(Setup,'r');title('Wet/Dry');plot(R2,'g')
% subplot(1,3,3);plot(B,'b');hold on;plot(Setup,'r');title('Average');plot(R2,'g')
% subplot(2,2,2);plot(ws,'r')
% hold on;plot(R2,'k');title('Wet/Dry')
% subplot(2,2,4);plot(ws,R2,'o');hold on;plot(0:1:5,0:1:5,'r')
subplot(1,3,1);plot(wl,'b');hold on;plot(Setup,'r');title('waterline vs Setup');plot(R2,'k'); legend("waterline","setup","Runup")
subplot(1,3,2);plot(ws,'b');hold on;plot(Setup,'r');title('Wet/Dry vs Setup');plot(R2,'k'); legend("wet/dry","setup","Runup")
subplot(1,3,3);plot(B,'b');hold on;plot(Setup,'r');title('Average Wet/Waterline vs Setup');plot(R2,'k'); legend("average wet/water", "setup","Runup")

plot(B,Setup,'o')
hold on;plot(0:1:5,0:1:5,'r')

subplot(2,2,1);plot(wl,'r')
hold on;plot(R2,'k');title('Waterline vs R2')
subplot(2,2,3);plot(wl,R2,'o');hold on;plot(0:1:5,0:1:5,'r')

subplot(2,2,2);plot(ws,'r')
hold on;plot(R2,'k');title('Wet/Dry vs R2')
subplot(2,2,4);plot(ws,R2,'o');hold on;plot(0:1:5,0:1:5,'r')