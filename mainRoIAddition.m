path = '/Users/jcmvega5/Desktop/Frames/';
filePrefix = 'ezgif-frame-';
outpath = '/Users/jcmvega5/Desktop/Frames/Outputs/';
f_sample = 44000;
f_low = 100;
f_high = 6000;
amp_mod = 0.00002;
sample_t = 10;

if ~exist(outpath, 'dir')
   mkdir(outpath)
end

for i = 1:20 % TODO: get the count of files or range of list of files with 
    % functions
    fname = getFileName(filePrefix, i);
    % disp(fname);
    fullFilePath = sprintf('%s%s', path, fname);
    % disp(fullFilePath)
    I = imread(fullFilePath);
    imshow(I);
    h = images.roi.Ellipse(gca,'Center',[300 255],'Semiaxes',[45 60],'Color','r','FaceAlpha',0.0);
    mask = createMask(h);
    I(~mask) = NaN;
    j = imread(fullFilePath);
    % disp(h);
    mergedImg = imadd(j,I);
    % imshow(I);
    outfile = sprintf('%s-out.jpg', fname);
    imwrite(mergedImg, sprintf('%s%s', outpath, outfile));
    
    fnameNoExtn = strcat(path, filePrefix, sprintf('%03d', i));
    ext = 'jpg';
    soundFile = im2sound(fnameNoExtn, ext, f_sample, f_low, f_high, amp_mod, sample_t);
end

movefile(sprintf('%s*wav', path), outpath);