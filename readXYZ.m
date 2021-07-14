function xyz = readXYZ( filename, nmolec)
%Author: Gary (July 13, 2016)
%   Enter filename of xyz file (leave out ".xyz")
%   Return the matrix of XYZ, or -1 if error

% load data file
fid = fopen([filename,'.xyz']);

% remove headers
nline = linecount([filename,'.xyz']);
headers=nline-nmolec;
for i=1:headers
    fgetl(fid);
end

% read data
[xyz,count] = fscanf(fid,'%*s %f %f %f',[3,Inf]);
if count/3 ~= nmolec % ensure all molecules are read
    xyz = -1;
    display('Error in readXYZ() input');
else
    xyz = xyz';
end

fclose(fid);

end

function n = linecount(name)
n = 0;
fid = fopen(name);
tline = fgetl(fid);
while ischar(tline)
  tline = fgetl(fid);
  n = n+1;
end
fclose(fid);
end
