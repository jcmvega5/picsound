function out = getFileName(filepath, index)

out = strcat(filepath, sprintf('%03d', index), '.jpg');
