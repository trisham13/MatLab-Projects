clc;
disp('The monthly precipitation totals are as follows...');
disp('(Note: Totals are in inches.)');
disp(' ');
Month = char('January','February','March','April','May','June','July',...
    'August','September','October','November','December');
inches = (MetroDCPrecip')./100;
total = sum(inches);
Total_Rainfall = total';
results = table(Month, Total_Rainfall);
disp(results);
maxDays = max(inches);
maxFinal = (max(maxDays));
Inches = maxFinal;
disp(' ');
disp(' ');
disp('Using the number of the month, the heaviest rainfall fell on the following date...')
disp(' ');
