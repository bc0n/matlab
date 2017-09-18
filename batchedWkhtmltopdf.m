cd C:\Users\ben\kb\2009\2009_ZarchanMusoff_FundamentalsOfKalmanFiltering
a = rdir('*.htm')
fprintf('"C:\\Program Files\\wkhtmltopdf\\bin\\wkhtmltopdf.exe" --zoom .75 '); for i = 1:length(a); fprintf('%s ',a(i).name); end; fprintf('combined.pdf\n\n')