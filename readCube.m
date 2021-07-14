function [xaxis,yaxis,zaxis,cubedat,config,resolution ] = readCube( filename, print)
% Author: Gary (July 15, 2016)
%   Reads Gaussian cube file into a 3D matrix
%   Convert the units from Bohr Radius to Angstroms

% import file
fid = fopen([filename,'.cube']);

% remove headers lines 1-2
for i=1:2
    fgetl(fid);
end
% read cube parameters lines 3-6
param_bohr = fscanf(fid, '%f %f %f %f \n', [4,4])';
% read molecule configuration lines 7-(7+number of molecules)
config_bohr = fscanf(fid, '%f %f %f %f %f', [5,param_bohr(1,1)])';

% to angstroms
param = [param_bohr(:,1),param_bohr(:,[2:end])*0.529177];
config = [config_bohr(:,1), config_bohr(:,[2:end]) * 0.529177];

xstep = param(2,2); % step size (resolution)
ystep = param(3,3);
zstep = param(4,4);
nxstep = param(2,1); % number of steps
nystep = param(3,1);
nzstep = param(4,1);

resolution = [xstep, ystep, zstep];

xaxis = [0:xstep:xstep*(nxstep-1)];
yaxis = [0:ystep:ystep*(nystep-1)];
zaxis = [0:zstep:zstep*(nzstep-1)];

% save file in matrix
cubedat_bohr = zeros(nxstep,nystep,nzstep); % initialise 3D matrix
data = fscanf(fid, '%f %f %f %f %f %f', [6,Inf]); % read the rest of file
data_flat = reshape(data,1,[]);
for i=1:nxstep
    for j=1:nystep
        for k=1:nzstep
            cubedat_bohr(i,j,k) = data_flat(k+(j-1)*nzstep+(i-1)*nzstep*nystep);
        end
    end
end

% to V/Å
cubedat = cubedat_bohr * 51.42206;
% to V/nm conversion factor is 514.2206


end

