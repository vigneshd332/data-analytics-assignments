% File I/O and Variable Initialization:

rawData = importdata('BikeSales.csv');
headers = rawData.colheaders;
[inquiries] = rawData.data(:,1);
[sales] = rawData.data(:,2);
n=length(sales);

% Initial Data Scatter Plot:

plot(inquiries, sales, '.','LineWidth',1.5);
hold on;

% Linear Regression:

x = [ones(n,1), inquiries];
y = sales;
% Optimization for theta = inv(x'*x)*x'*y
theta = (x'*x)\(x'*y);
title('Bike Sales Data (Linear Regression)');
xlabel('Inquiries');
ylabel('Sales');
plot(inquiries, theta(1)+theta(2)*inquiries, '-', 'LineWidth',2);