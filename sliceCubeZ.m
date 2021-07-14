function [ slice2d ] = sliceCubeZ( cube3d,zaxis,z,config)
% Author: Gary (July 15, 2016)
%   Slice the 3D matrix of Gaussian cube file at the z value indicated, 
%   return a 2dslice and the closest value of the z-axis to z

z_0 = mean(config(:,5)); % where the molecule is on the z axis
if abs(z+z_0) > max(zaxis) % ensure within the CUBE data range
    slice2d = -1;
else
    diff = abs(zaxis-(z+z_0));
    [val ind] = min(diff);
    slice2d = cube3d(:,:,ind);
end

end

