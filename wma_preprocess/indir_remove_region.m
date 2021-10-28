function indir_remove_region(indir_file,otdir_file,region_file)
%   Copyright(c) 2021
%	Written by Sun Jia-Wei 210816
% 	Mail to Authors: jiaweisun0512@163.com
fun_mkdir(otdir_file);
[region_data,region_voxdim] = rp_readfile(region_file);
[data,voxdim,head] = rp_readfile(indir_file);
if voxdim~=region_voxdim
    error(['dimension of nifiy: ' fun_str(voxdim) '¡Ù' 'dimension of mask: ' fun_str(region_voxdim)])
end
data(region_data~=0) = 0;
rp_WriteNiftiImage(data,head,otdir_file);
end