function fList = spm_expand_nii_files(niiFile)

% Load HDR
HDR = spm_vol(niiFile);

% Expand Face Images
fList = cell(length(HDR),1);
for i = 1:length(HDR)
    fList{i,1} = sprintf('%s,%s',niiFile,num2str(i));
end

end