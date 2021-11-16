%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 12);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["fixedAcidity", "volatileAcidity", "citricAcid", "residualSugar", "chlorides", "freeSulfurDioxide", "totalSulfurDioxide", "density", "pH", "sulphates", "alcohol", "quality"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
data = readtable("winequality-red.csv", opts);
%% Convert to output type
data = table2array(data);

D = data(:, 1:end-1);
y = data(:, end);

%% Clear temporary variables
clear opts

% Insert new lines if required

%% Test1: Find the number of instances (n) and number of dimensions (k)
% Hint: use original data (D) without adding d0
n = size(D, 1);
k = size(D, 2);

%% Test2: Compute matrices X and Y
% Hint: refer to the problem description and (Y and y are different)

D0 = [ones(n,1) D];
X = D0'*D0;
Y = D0'*y;

%% Test3: Compute the estimated value of beta (B)
% Hint: use the function linsolve(X, Y) to solve the linear equations
% for more details on linsolve use help
B = X^(-1);
B = B*Y;

%% Test4: Predict the wine quality for given sample
% Hint: Check the dimensions
sampleX = [7.9000    0.2900    0.3900    6.7000    0.0360    6.0000  117.0000    0.9938    3.1200    0.4200   10.7000];
sampleY = 7;
inp = [1 sampleX];

predSampleY = inp*B;

%% Test5: Compute the error in prediction
% Hint: error = sampleY - predSampleY
error = abs(sampleY - predSampleY);
