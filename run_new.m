% % filename ='/home/shruti/Documents/MFCC/Devel_04_E1_4_1_1.htk'
% % 
% % for i = 1:len(filename)
% % htkread(filename)
% 
% D = '/home/shruti/Documents/MFCC/try/';
% %S = dir(fullfile(D,'*.csv'));
% files = dir('*.csv') ;    % you are in folder of csv files
% N = length(files) ;   % total number of files 
% % loop for each file 
% for i = 1:N
%     htkread(filename);
%     % do what you want
% end

sourcefolder = '/home/shruti/Documents/MFCC/try/';
enhancefolder = '/home/shruti/Documents/MFCC/new/';
htkread_new(sourcefolder, enhancefolder);
