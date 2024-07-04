data_name = PTPO620181227;
x = data_name(:,"X");
y =  data_name(:,"Y");
z = data_name(:, "Z_ZH");
znmm = data_name(:,"Z_NMM");
x = x{:,1};
y = y{:,1};
z = z{:,1};
znmm = znmm{:,1};
A(:,1) = x;
A(:,2) = y;
A(:,3) = z;
A(:,4) = znmm;
data_table = array2table(A);
filename = "profile_december_2018.xlsx";
data_table.Properties.VariableNames = {'X','Y','Z_H','Z_NMM'};
writetable(data_table, filename)