function htkread_new(htkFolder, csvFolder)
% Output folder containig audio samples corrupted with reverb and noise
if(isempty(dir(csvFolder)))
    mkdir(csvFolder);
end
strFiles = strcat(htkFolder, '*.htk');
F = dir(strFiles);
for iFile = 1:length(F)
    fid = fopen(strcat(htkFolder, '/', F(iFile).name), 'rb', 'ieee-be');
    disp(F(iFile).name);
    %fid = fopen(filename, 'rb', 'ieee-be');
    nframes = fread(fid, 1, 'int32'); % number of frames
    frate   = fread(fid, 1, 'int32'); % frame rate in 100 nano-seconds unit
    nbytes  = fread(fid, 1, 'short'); % number of bytes per feature value
    feakind = fread(fid, 1, 'short'); % 9 is USER
    ndim = nbytes / 4; % feature dimension (4 bytes per value)
    data = fread(fid, [ndim, nframes], 'float');
    data_n = data';
    disp(data_n)
    fn=F(iFile).name(1:end-4)
    a=strcat(fn,'.csv')
%     csvwrite(a, data_n);
%     fclose(fid);
    pathfile = strcat(csvFolder, '/', a);
    csvwrite(pathfile, data_n);
    fclose(fid);
end