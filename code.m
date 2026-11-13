%% RAS_2012
%待调整数据   
temp1= xlsread('D:\OneDrive_new\OneDrive - sdu.edu.cn\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2012-v1.xlsx','Adjusted_Provinces data','C17:N18');                                                                                                                    
temp2= xlsread('D:\OneDrive_new\OneDrive - sdu.edu.cn\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2012-v1.xlsx','Adjusted_Provinces data','C21:N21');
temp3= xlsread('D:\OneDrive_new\OneDrive - sdu.edu.cn\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2012-v1.xlsx','Adjusted_Provinces data','C26:N26');                                                                                                                    

Z_RAS = [temp1',temp2',temp3'];

%列约束       
Cons_row_RAS = xlsread('D:\OneDrive_new\OneDrive - sdu.edu.cn\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2012-v1.xlsx','Adjusted_Provinces data','C30:N30');
Cons_row_RAS  = Cons_row_RAS';

%行约束       
temp11 = xlsread('D:\OneDrive_new\OneDrive - sdu.edu.cn\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2012-v1.xlsx','Adjusted_Provinces data','R32:R33');                                                                                                              
temp12 =xlsread('D:\OneDrive_new\OneDrive - sdu.edu.cn\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2012-v1.xlsx','Adjusted_Provinces data','R36');
temp13 =xlsread('D:\OneDrive_new\OneDrive - sdu.edu.cn\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2012-v1.xlsx','Adjusted_Provinces data','R41');
column = [temp11',temp12',temp13']; 

unestimated0 = Z_RAS;
eta=1;
temp_r1 =1;
temp_s1=1;

while  (sum(temp_r1)>0.02 & sum(temp_s1)>0.02) || eta<1000000

    UT = Cons_row_RAS;
    U1 = sum(Z_RAS,2);
    R1 = UT./U1;
    R1(U1==0) = 0;
    for i =1:length(R1)
        Z_RAS(i,:) = Z_RAS(i,:).*R1(i);
    end

    VT = column;
    V1 = sum(Z_RAS,1);
    S1 = VT./V1;
    S1(V1==0) = 0;
    for j =1:length(S1)
        Z_RAS(:,j) = Z_RAS(:,j).*S1(j);   
    end

    temp_r1 = abs(sum(Z_RAS,2)-UT)./UT;
    temp_r1(UT==0) = 0;
    
    temp_s1 = abs(sum(Z_RAS,1)-VT)./VT;
    temp_s1(VT==0) = 0;

        eta=eta+1;

end
[v,l] = max(temp_r1)  

%%输出
estimated = Z_RAS';


%% RAS_2015
%待调整数据  
temp1= readmatrix('D:\Onedrive_2026\OneDrive\Desktop\2_1_估计沿海省份和城市各海洋产业增加值-2015-v1.xlsx','Sheet','Adjusted_Provinces data','Range','C16:N18'); 
temp2= readmatrix('D:\Onedrive_2026\OneDrive\Desktop\2_1_估计沿海省份和城市各海洋产业增加值-2015-v1.xlsx','Sheet','Adjusted_Provinces data','Range','C21:N21'); 
temp3= readmatrix('D:\Onedrive_2026\OneDrive\Desktop\2_1_估计沿海省份和城市各海洋产业增加值-2015-v1.xlsx','Sheet','Adjusted_Provinces data','Range','C26:N26'); 
Z_RAS = [temp1',temp2',temp3'];

%列约束       
Cons_row_RAS = readmatrix('D:\Onedrive_2026\OneDrive\Desktop\2_1_估计沿海省份和城市各海洋产业增加值-2015-v1.xlsx','Sheet','Adjusted_Provinces data','Range','C30:N30');
Cons_row_RAS  = Cons_row_RAS';

%行约束       
temp11 = readmatrix('D:\Onedrive_2026\OneDrive\Desktop\2_1_估计沿海省份和城市各海洋产业增加值-2015-v1.xlsx','Sheet','Adjusted_Provinces data','Range','R31:R33');                                                                                                              
temp12 = readmatrix('D:\Onedrive_2026\OneDrive\Desktop\2_1_估计沿海省份和城市各海洋产业增加值-2015-v1.xlsx','Sheet','Adjusted_Provinces data','Range','R36:R36');
temp13 = readmatrix('D:\Onedrive_2026\OneDrive\Desktop\2_1_估计沿海省份和城市各海洋产业增加值-2015-v1.xlsx','Sheet','Adjusted_Provinces data','Range','R41:R41');
column = [temp11',temp12',temp13']; 

unestimated0 = Z_RAS;
eta=1;
temp_r1 =1;
temp_s1=1;

while  (sum(temp_r1)>0.04 & sum(temp_s1)>0.04) || eta<1000000

    UT = Cons_row_RAS;
    U1 = sum(Z_RAS,2);
    R1 = UT./U1;
    R1(U1==0) = 0;
    for i =1:length(R1)
        Z_RAS(i,:) = Z_RAS(i,:).*R1(i);
    end
   
    VT = column;
    V1 = sum(Z_RAS,1);
    S1 = VT./V1;
    S1(V1==0) = 0;
    for j =1:length(S1)
        Z_RAS(:,j) = Z_RAS(:,j).*S1(j);  
    end

    temp_r1 = abs(sum(Z_RAS,2)-UT)./UT;
    temp_r1(UT==0) = 0;
    
    temp_s1 = abs(sum(Z_RAS,1)-VT)./VT;
    temp_s1(VT==0) = 0;
   
        eta=eta+1;

end
[v,l] = max(temp_r1)  

estimated = Z_RAS';


%% RAS_2018
%待调整数据   
Z_RAS= xlsread('D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2018.xlsx','Adjusted_Provinces data','C31:N41');                                                                                                                                                                                                                                     

%列约束       
Cons_row_RAS = xlsread('D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2018.xlsx','Adjusted_Provinces data','R31:R41');

%行约束       
column = xlsread('D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2018.xlsx','Adjusted_Provinces data','C30:N30');                                                                                                              

unestimated0 = Z_RAS;
eta=1;
temp_r1 =1;
temp_s1=1;

while  (sum(temp_r1)>0.1 & sum(temp_s1)>0.1) || eta<1000000

    UT = Cons_row_RAS;
    U1 = sum(Z_RAS,2);
    R1 = UT./U1;
    R1(U1==0) = 0;
    for i =1:length(R1)
        Z_RAS(i,:) = Z_RAS(i,:).*R1(i);
    end

    VT = column;
    V1 = sum(Z_RAS,1);
    S1 = VT./V1;
    S1(V1==0) = 0;
    for j =1:length(S1)
        Z_RAS(:,j) = Z_RAS(:,j).*S1(j);   
    end

    temp_r1 = abs(sum(Z_RAS,2)-UT)./UT;
    temp_r1(UT==0) = 0;
    
    temp_s1 = abs(sum(Z_RAS,1)-VT)./VT;
    temp_s1(VT==0) = 0;
    
        eta=eta+1;

end
[v,l] = max(temp_r1)  


%% RAS_2020
%待调整数据   
Z_RAS= xlsread('D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2020.xlsx','Adjusted_Provinces data','C31:N41');                                                                                                                                                                                                                                     

%列约束       
Cons_row_RAS = xlsread('D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2020.xlsx','Adjusted_Provinces data','R31:R41');

%行约束       
column = xlsread('D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\2_1_估计沿海省份和城市各海洋产业增加值-2020.xlsx','Adjusted_Provinces data','C30:N30');                                                                                                              
unestimated0 = Z_RAS;

eta=1;
temp_r1 =1;
temp_s1=1;

while ((max(temp_r1)>0.1) || (max(temp_s1)>0.1)) && eta<1000000
 
    UT = Cons_row_RAS;
    U1 = sum(Z_RAS,2);
    R1 = UT./U1;
    R1(U1==0) = 0;
    for i =1:length(R1)
        Z_RAS(i,:) = Z_RAS(i,:).*R1(i);
    end

    VT = column;
    V1 = sum(Z_RAS,1);
    S1 = VT./V1;
    S1(V1==0) = 0;
    for j =1:length(S1)
        Z_RAS(:,j) = Z_RAS(:,j).*S1(j);   
    end
 
    temp_r1 = abs(sum(Z_RAS,2)-UT)./UT;
    temp_r1(UT==0) = 0;
    
    temp_s1 = abs(sum(Z_RAS,1)-VT)./VT;
    temp_s1(VT==0) = 0;
    
        eta=eta+1;

end
[v,l] = max(temp_r1)  


%% C_Construct
%定义关键参数
list_new =[2 3 6 9 10 11 13 15 19 20 21];
filename = 'D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\3_new_C matrix_provinces_2020-v1.xlsm';
blockRows = 42; 
blockCols = 42; 
readRange = 'D3:AS57'; 

sheets = sheetnames(filename); 
sheets = string(sheets); 

resultMatrix = [];
missingCount = 0;
record = [];
idx = 1;

for i = 1:31
        
    if list_new(idx) ==i
       
        try
            data = readmatrix(filename, 'Sheet', idx, 'Range', readRange);
           
            if size(data,1) ~= 55 || size(data,2) ~= 42
                data = data(1:55, 1:42);
            end
        catch
            data = zeros(55, 42); 
        end
        if idx<length(list_new)
        idx = idx+1;
        end
    else
    
        data = eye(blockRows, blockCols); 
        missingCount = missingCount + 1; 
    end
    
    if isempty(resultMatrix)
        resultMatrix = data;
    else
        resultMatrix= [resultMatrix                           ,zeros(size(resultMatrix,1),size(data,2));
                      zeros(size(data,1),size(resultMatrix,2)),         data]; 
    end

end

C = resultMatrix;
save('2020_C.mat','C')    

fprintf('成功提取%d个Sheet，生成%d个对角矩阵\n', ...
        length(list_new) - missingCount, missingCount);

%检查大C矩阵是否有负值  
hasNegative = any(C(:) < 0);
[row, col] = find(C < 0);
%检查大C矩阵是否有Nan值  
[row_nan, col_nan] = find(isnan(C));
disp('=== NaN位置 ===');
disp(table(row_nan, col_nan));


%% Calculate
load 'D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\2020_C.mat'; 
C_2020 = C;

Z_2020 = xlsread('D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2020_42 CEADS.xlsx','Table','D5:AXE1306');
VA_2020 = xlsread('D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2020_42 CEADS.xlsx','Table','D1313:AXE1313');
Im1_2020 = xlsread('D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2020_42 CEADS.xlsx','Table','D1307:AXE1307');
Im2_2020 = xlsread('D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2020_42 CEADS.xlsx','Table','AXG1307:BDE1307');
FD_2020 = xlsread('D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2020_42 CEADS.xlsx','Table','AXG5:BDE1306');
Ex_2020 = xlsread('D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2020_42 CEADS.xlsx','Table','BDF5:BDF1306');
Tot_2020 = xlsread('D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2020_42 CEADS.xlsx','Table','BDI5:BDI1306');

Z = C_2020*Z_2020*C_2020';
Output = Tot_2020'*C_2020';
VA = VA_2020*C_2020';
FD = C_2020*FD_2020;
Export = C_2020*Ex_2020;
Import_Z = Im1_2020*C_2020';
Import_FD = Im2_2020;

%检查L对角线是否大于1
A=(Z./Output);
A(~isfinite(A)) = 0; 
L = inv(eye(1445) - A);
N = diag(L);

%检查拆分前后总值是否相等
ans = sum(VA)-sum(VA_2020);

%检查拆分前误差 
total_row = sum(Z_2020, 2) + sum(FD_2020, 2) + Ex_2020;
err1 = (total_row - Tot_2020)./ Tot_2020;
err1(isnan(err1)) = 0;
total_col = sum(Z_2020, 1) + VA_2020 + Im1_2020;
err2 = (total_col - Tot_2020')./ Tot_2020';
err2(isnan(err2)) = 0;

%检查拆分后误差
total_row = sum(Z, 2) + sum(FD, 2) + Export;
err1 = (total_row - Output')./Output';
err1(isnan(err1)) = 0;
total_col = sum(Z, 1) + VA + Import_Z;
err2 = (total_col - Output)./Output;
err2(isnan(err2)) = 0;

%按误差绝对值降序排列
[~, idx1_abs] = sort(abs(err1), 'descend');
[~, idx2_abs] = sort(abs(err2), 'descend');

err1_sorted_abs = err1(idx1_abs);
err2_sorted_abs = err2(idx2_abs);

%err1对应的原始数据（检查用）
result_err1 = table( ...
    idx1_abs(:), ...
    err1_sorted_abs(:), ...
    sum(Z(idx1_abs, :), 2), ...
    sum(FD(idx1_abs, :), 2), ...
    Export(idx1_abs), ...
    total_row(idx1_abs), ...
    Output(idx1_abs)', ...
    'VariableNames', { ...
    'Index', 'err1', 'Z_row', 'FD', 'Export', ...
    'total_row', 'Output'});

%err2对应的原始数据（检查用）
result_err2 = table( ...
    idx2_abs(:), ...
    err2_sorted_abs(:), ...
    sum(Z(:, idx2_abs), 1)', ...
    VA(idx2_abs)', ...
    Import_Z(idx2_abs)', ...
    total_col(idx2_abs)', ...
    Output(idx2_abs)', ...
    'VariableNames', { ...
    'Index', 'err2', 'Z_col', 'VA', 'Import_Z', ...
    'total_col', 'Output'});

clearvars -except Z FD Export VA Import_Z Import_FD Output
save('results_2020_province.mat');


%% sensitive analysis
%参数设置
list_new = [2 3 6 9 10 11 13 15 19 20 21];

filename_C = 'D:\Onedrive_2026\OneDrive\【2】Disaggregate MIOT\3_new_C matrix_provinces_2012-v1.xlsm';
filename_IO = 'D:\Onedrive_2026\OneDrive\【1】IO表和资料\IO表\MRIO2012_42 CEADS.xlsx';

nProv = 31;
oldBlock = 42;
newBlock = 55;
readRange = 'D3:AS57';

%建立省份和sheet对应关系
prov2sheet = zeros(1, nProv);
prov2sheet(list_new) = 1:length(list_new);

%构造两套拆分矩阵
C_VA_cell = cell(1, nProv);
C_other_cell = cell(1, nProv);

for i = 1:nProv
    
    if prov2sheet(i) > 0
        
        sheetIdx = prov2sheet(i);
        data = readmatrix(filename_C, 'Sheet', sheetIdx, 'Range', readRange);
        
        if size(data,1) < newBlock || size(data,2) < oldBlock
            error('第 %d 个省对应的 sheet %d 尺寸不足，应至少为55×42。', i, sheetIdx);
        end
        
        C_VA_cell{i} = data(1:newBlock, 1:oldBlock);
        C_other_cell{i} = data(1:newBlock, 1:oldBlock);
        
    else
        
        % 非沿海省不拆分
        C_VA_cell{i} = eye(oldBlock);
        C_other_cell{i} = eye(oldBlock);
        
    end
end

%计算拆分后每个省的行列位置
rowSize_new = zeros(1, nProv);

for i = 1:nProv
    if prov2sheet(i) > 0
        rowSize_new(i) = newBlock;   %沿海省55部门
    else
        rowSize_new(i) = oldBlock;   %非沿海省42部门
    end
end

rowStart_new = [1, cumsum(rowSize_new(1:end-1)) + 1];
rowEnd_new = cumsum(rowSize_new);

newTotal = sum(rowSize_new);   %1445
oldTotal = nProv * oldBlock;   %1302

fprintf('拆分前总部门数 oldTotal = %d\n', oldTotal);
fprintf('拆分后总部门数 newTotal = %d\n', newTotal);

%读取原始MRIO数据
sheet_IO = 'Table';

Z_2012 = readmatrix(filename_IO, 'Sheet', sheet_IO, 'Range', 'D5:AXE1306');
VA_2012 = readmatrix(filename_IO, 'Sheet', sheet_IO, 'Range', 'D1313:AXE1313');
Im1_2012 = readmatrix(filename_IO, 'Sheet', sheet_IO, 'Range', 'D1307:AXE1307');
Im2_2012 = readmatrix(filename_IO, 'Sheet', sheet_IO, 'Range', 'AXG1307:BDE1307');
FD_2012 = readmatrix(filename_IO, 'Sheet', sheet_IO, 'Range', 'AXG5:BDE1306');
Ex_2012 = readmatrix(filename_IO, 'Sheet', sheet_IO, 'Range', 'BDF5:BDF1306');
Tot_2012 = readmatrix(filename_IO, 'Sheet', sheet_IO, 'Range', 'BDI5:BDI1306');

%检查原始矩阵维度
if size(Z_2012,1) ~= oldTotal || size(Z_2012,2) ~= oldTotal
    error('Z_2012 维度错误，应为1302×1302。');
end

if size(VA_2012,2) ~= oldTotal
    error('VA_2012 维度错误，应为1×1302。');
end

if size(Im1_2012,2) ~= oldTotal
    error('Im1_2012 维度错误，应为1×1302。');
end

if size(Tot_2012,1) ~= oldTotal
    error('Tot_2012 维度错误，应为1302×1。');
end

if size(FD_2012,1) ~= oldTotal
    error('FD_2012 行数错误，应为1302行。');
end

if size(Ex_2012,1) ~= oldTotal
    error('Ex_2012 行数错误，应为1302行。');
end

%拆分
Z = zeros(newTotal, newTotal);

for i = 1:nProv
    
    oldRowIdx = (i-1)*oldBlock + 1 : i*oldBlock;
    newRowIdx = rowStart_new(i) : rowEnd_new(i);
    
    Ci = C_other_cell{i};
    
    for j = 1:nProv
        
        oldColIdx = (j-1)*oldBlock + 1 : j*oldBlock;
        newColIdx = rowStart_new(j) : rowEnd_new(j);
        
        Cj = C_other_cell{j};
        Zij = Z_2012(oldRowIdx, oldColIdx);
        
        Z(newRowIdx, newColIdx) = Ci * Zij * Cj';
        
    end
end

%拆分
VA = zeros(1, newTotal);

for i = 1:nProv
    
    oldIdx = (i-1)*oldBlock + 1 : i*oldBlock;
    newIdx = rowStart_new(i) : rowEnd_new(i);
    
    Ci_VA = C_VA_cell{i};
    
    VA(newIdx) = VA_2012(oldIdx) * Ci_VA';
    
end

%拆分Output和Import_Z
Output = zeros(1, newTotal);
Import_Z = zeros(1, newTotal);

for i = 1:nProv
    
    oldIdx = (i-1)*oldBlock + 1 : i*oldBlock;
    newIdx = rowStart_new(i) : rowEnd_new(i);
    
    Ci_other = C_other_cell{i};
    
    Output(newIdx) = Tot_2012(oldIdx)' * Ci_other';
    Import_Z(newIdx) = Im1_2012(oldIdx) * Ci_other';
    
end

%拆分FD和Export
FD = zeros(newTotal, size(FD_2012, 2));
Export = zeros(newTotal, 1);

for i = 1:nProv
    
    oldIdx = (i-1)*oldBlock + 1 : i*oldBlock;
    newIdx = rowStart_new(i) : rowEnd_new(i);
    
    Ci_other = C_other_cell{i};
    
    FD(newIdx, :) = Ci_other * FD_2012(oldIdx, :);
    Export(newIdx, :) = Ci_other * Ex_2012(oldIdx, :);
    
end

%Import_FD不拆
Import_FD = Im2_2012;

%清理浮点误差
tol = 1e-6;
Z(abs(Z) < tol) = 0;
VA(abs(VA) < tol) = 0;
Output(abs(Output) < tol) = 0;
FD(abs(FD) < tol) = 0;
Export(abs(Export) < tol) = 0;
Import_Z(abs(Import_Z) < tol) = 0;
Import_FD(abs(Import_FD) < tol) = 0;

%总量检查
fprintf('\n=== 总量检查 ===\n');

fprintf('Z 拆分前总量：%.6f\n', sum(Z_2012(:)));
fprintf('Z 拆分后总量：%.6f\n', sum(Z(:)));
fprintf('Z 总量差异：%.6f\n\n', sum(Z(:)) - sum(Z_2012(:)));

fprintf('VA 拆分前总量：%.6f\n', sum(VA_2012(:)));
fprintf('VA 拆分后总量：%.6f\n', sum(VA(:)));
fprintf('VA 总量差异：%.6f\n\n', sum(VA(:)) - sum(VA_2012(:)));

fprintf('Output 拆分前总量：%.6f\n', sum(Tot_2012(:)));
fprintf('Output 拆分后总量：%.6f\n', sum(Output(:)));
fprintf('Output 总量差异：%.6f\n\n', sum(Output(:)) - sum(Tot_2012(:)));

fprintf('FD 拆分前总量：%.6f\n', sum(FD_2012(:)));
fprintf('FD 拆分后总量：%.6f\n', sum(FD(:)));
fprintf('FD 总量差异：%.6f\n\n', sum(FD(:)) - sum(FD_2012(:)));

fprintf('Export 拆分前总量：%.6f\n', sum(Ex_2012(:)));
fprintf('Export 拆分后总量：%.6f\n', sum(Export(:)));
fprintf('Export 总量差异：%.6f\n\n', sum(Export(:)) - sum(Ex_2012(:)));

fprintf('Import_Z 拆分前总量：%.6f\n', sum(Im1_2012(:)));
fprintf('Import_Z 拆分后总量：%.6f\n', sum(Import_Z(:)));
fprintf('Import_Z 总量差异：%.6f\n\n', sum(Import_Z(:)) - sum(Im1_2012(:)));

fprintf('Import_FD 拆分前总量：%.6f\n', sum(Im2_2012(:)));
fprintf('Import_FD 拆分后总量：%.6f\n', sum(Import_FD(:)));
fprintf('Import_FD 总量差异：%.6f\n\n', sum(Import_FD(:)) - sum(Im2_2012(:)));

%负值检查
fprintf('\n=== 负值检查 ===\n');

fprintf('Z 拆分前负值个数：%d\n', sum(Z_2012(:) < -tol));
fprintf('Z 拆分后负值个数：%d\n', sum(Z(:) < -tol));

fprintf('VA 拆分前负值个数：%d\n', sum(VA_2012(:) < -tol));
fprintf('VA 拆分后负值个数：%d\n', sum(VA(:) < -tol));

fprintf('Output 拆分前负值个数：%d\n', sum(Tot_2012(:) < -tol));
fprintf('Output 拆分后负值个数：%d\n', sum(Output(:) < -tol));

fprintf('FD 拆分前负值个数：%d\n', sum(FD_2012(:) < -tol));
fprintf('FD 拆分后负值个数：%d\n', sum(FD(:) < -tol));

fprintf('Export 拆分前负值个数：%d\n', sum(Ex_2012(:) < -tol));
fprintf('Export 拆分后负值个数：%d\n', sum(Export(:) < -tol));

fprintf('Import_Z 拆分前负值个数：%d\n', sum(Im1_2012(:) < -tol));
fprintf('Import_Z 拆分后负值个数：%d\n', sum(Import_Z(:) < -tol));


%检查拆分矩阵
fprintf('\n=== C矩阵检查 ===\n');

for i = 1:nProv
    
    Ci = C_other_cell{i};
    colsum = sum(Ci, 1);
    
    fprintf('省 %2d: C列和最大误差 = %.12f, 负值个数 = %d, 最小值 = %.6f\n', ...
        i, max(abs(colsum - 1)), sum(Ci(:) < -tol), min(Ci(:)));
    
end

%敏感性分析：桥矩阵拆分系数整体扰动
% 目的：
% 对所有沿海省份桥矩阵中的海洋拆分系数进行 ±5%、±10% 扰动，
% 重新构造拆分后的 MMRIO 组件，
% 并与 baseline 结果比较相对差异。

%保存baseline结果
Z_base        = Z;
FD_base       = FD;
Export_base   = Export;
Import_Z_base = Import_Z;
Output_base   = Output;
VA_base       = VA;

%设置扰动情景
delta_list = [-0.10, -0.05, 0.05, 0.10];

%对所有沿海省份桥矩阵做扰动
perturbProvList = list_new;

%初始化敏感性分析结果表
Sensitivity_Result = table();

%开始循环不同扰动情景
for s = 1:length(delta_list)

    delta = delta_list(s);

    fprintf('\n===Sensitivity scenario: delta = %.0f%% ===\n', delta * 100);

    %复制 baseline 桥矩阵
    C_sens = C_other_cell;

    %对沿海省份桥矩阵进行扰动
    for pp = 1:length(perturbProvList)

        provID = perturbProvList(pp);

        C0 = C_other_cell{provID};

        if size(C0,1) == newBlock && size(C0,2) == oldBlock

            C_new = zeros(newBlock, oldBlock);

            %前13行：海洋部门拆分系数
            marineCoef = C0(1:13, :);

            %扰动
            marineCoef_new = marineCoef * (1 + delta);

            %一般敏感性分析中，保持非负约束
            marineCoef_new(marineCoef_new < 0) = 0;

            %重新计算剩余部门系数，保证每列和为1
            residualDiag = zeros(1, oldBlock);

            for q = 1:oldBlock

                colSumMarine = sum(marineCoef_new(:, q));

                if colSumMarine > 1
                    marineCoef_new(:, q) = marineCoef_new(:, q) / colSumMarine;
                    residualDiag(q) = 0;
                else
                    residualDiag(q) = 1 - colSumMarine;
                end

            end

            %重建桥矩阵
            C_new(1:13, :) = marineCoef_new;
            C_new(14:55, :) = diag(residualDiag);

            C_sens{provID} = C_new;

        end
    end

    %用扰动后的C_sens重新拆分Z
    Z_sens = zeros(newTotal, newTotal);

    for i = 1:nProv

        oldRowIdx = (i-1)*oldBlock + 1 : i*oldBlock;
        newRowIdx = rowStart_new(i) : rowEnd_new(i);

        Ci = C_sens{i};

        for j = 1:nProv

            oldColIdx = (j-1)*oldBlock + 1 : j*oldBlock;
            newColIdx = rowStart_new(j) : rowEnd_new(j);

            Cj = C_sens{j};
            Zij = Z_2012(oldRowIdx, oldColIdx);

            Z_sens(newRowIdx, newColIdx) = Ci * Zij * Cj';

        end
    end

    %用扰动后的C_sens重新拆分VA
    VA_sens = zeros(1, newTotal);

    for i = 1:nProv

        oldIdx = (i-1)*oldBlock + 1 : i*oldBlock;
        newIdx = rowStart_new(i) : rowEnd_new(i);

        Ci = C_sens{i};

        VA_sens(newIdx) = VA_2012(oldIdx) * Ci';

    end

    %用扰动后的C_sens重新拆分Output和Import_Z
    Output_sens = zeros(1, newTotal);
    Import_Z_sens = zeros(1, newTotal);

    for i = 1:nProv

        oldIdx = (i-1)*oldBlock + 1 : i*oldBlock;
        newIdx = rowStart_new(i) : rowEnd_new(i);

        Ci = C_sens{i};

        Output_sens(newIdx) = Tot_2012(oldIdx)' * Ci';
        Import_Z_sens(newIdx) = Im1_2012(oldIdx) * Ci';

    end

    %用扰动后的C_sens重新拆分FD和Export
    FD_sens = zeros(newTotal, size(FD_2012, 2));
    Export_sens = zeros(newTotal, 1);

    for i = 1:nProv

        oldIdx = (i-1)*oldBlock + 1 : i*oldBlock;
        newIdx = rowStart_new(i) : rowEnd_new(i);

        Ci = C_sens{i};

        FD_sens(newIdx, :) = Ci * FD_2012(oldIdx, :);
        Export_sens(newIdx, :) = Ci * Ex_2012(oldIdx, :);

    end

    %清理浮点误差
    Z_sens(abs(Z_sens) < tol) = 0;
    VA_sens(abs(VA_sens) < tol) = 0;
    Output_sens(abs(Output_sens) < tol) = 0;
    FD_sens(abs(FD_sens) < tol) = 0;
    Export_sens(abs(Export_sens) < tol) = 0;
    Import_Z_sens(abs(Import_Z_sens) < tol) = 0;

    %计算相对差异
    RD_Z = sum(abs(Z_sens(:) - Z_base(:))) / sum(abs(Z_base(:)));
    RD_FD = sum(abs(FD_sens(:) - FD_base(:))) / sum(abs(FD_base(:)));
    RD_Export = sum(abs(Export_sens(:) - Export_base(:))) / sum(abs(Export_base(:)));
    RD_Import_Z = sum(abs(Import_Z_sens(:) - Import_Z_base(:))) / sum(abs(Import_Z_base(:)));
    RD_Output = sum(abs(Output_sens(:) - Output_base(:))) / sum(abs(Output_base(:)));
    RD_VA = sum(abs(VA_sens(:) - VA_base(:))) / sum(abs(VA_base(:)));

    %总量守恒误差
    TotalDiff_Z = sum(Z_sens(:)) - sum(Z_2012(:));
    TotalDiff_FD = sum(FD_sens(:)) - sum(FD_2012(:));
    TotalDiff_Export = sum(Export_sens(:)) - sum(Ex_2012(:));
    TotalDiff_Import_Z = sum(Import_Z_sens(:)) - sum(Im1_2012(:));
    TotalDiff_Output = sum(Output_sens(:)) - sum(Tot_2012(:));
    TotalDiff_VA = sum(VA_sens(:)) - sum(VA_2012(:));

    %负值检查
    Neg_Z = sum(Z_sens(:) < -tol);
    Neg_FD = sum(FD_sens(:) < -tol);
    Neg_Output = sum(Output_sens(:) < -tol);
    Neg_Export = sum(Export_sens(:) < -tol);
    Neg_Import_Z = sum(Import_Z_sens(:) < -tol);
    Neg_VA = sum(VA_sens(:) < -tol);

    %检查扰动是否真的发生
    diff_C = 0;

    for pp = 1:length(perturbProvList)

        provID = perturbProvList(pp);

        diff_C = diff_C + sum(abs(C_sens{provID}(:) - C_other_cell{provID}(:)));

    end

    %输出当前情景结果
    fprintf('diff_C = %.12f\n', diff_C);

    fprintf('RD_Z        = %.12e\n', RD_Z);
    fprintf('RD_FD       = %.12e\n', RD_FD);
    fprintf('RD_Export   = %.12e\n', RD_Export);
    fprintf('RD_Import_Z = %.12e\n', RD_Import_Z);
    fprintf('RD_Output   = %.12e\n', RD_Output);
    fprintf('RD_VA       = %.12e\n', RD_VA);

    fprintf('TotalDiff_Z        = %.12f\n', TotalDiff_Z);
    fprintf('TotalDiff_FD       = %.12f\n', TotalDiff_FD);
    fprintf('TotalDiff_Export   = %.12f\n', TotalDiff_Export);
    fprintf('TotalDiff_Import_Z = %.12f\n', TotalDiff_Import_Z);
    fprintf('TotalDiff_Output   = %.12f\n', TotalDiff_Output);
    fprintf('TotalDiff_VA       = %.12f\n', TotalDiff_VA);

    fprintf('Neg_Z        = %d\n', Neg_Z);
    fprintf('Neg_FD       = %d\n', Neg_FD);
    fprintf('Neg_Output   = %d\n', Neg_Output);
    fprintf('Neg_Export   = %d\n', Neg_Export);
    fprintf('Neg_Import_Z = %d\n', Neg_Import_Z);
    fprintf('Neg_VA       = %d\n', Neg_VA);

    %保存结果
    newRow = table(delta, ...
        diff_C, ...
        RD_Z, RD_FD, RD_Export, RD_Import_Z, RD_Output, RD_VA, ...
        TotalDiff_Z, TotalDiff_FD, TotalDiff_Export, TotalDiff_Import_Z, TotalDiff_Output, TotalDiff_VA, ...
        Neg_Z, Neg_FD, Neg_Output, Neg_Export, Neg_Import_Z, Neg_VA);

    Sensitivity_Result = [Sensitivity_Result; newRow];

end

%显示并保存结果
disp(Sensitivity_Result)
save('sensitivity_bridge_coefficients_2012.mat', 'Sensitivity_Result');
writetable(Sensitivity_Result, 'sensitivity_bridge_coefficients_2012.xlsx');




