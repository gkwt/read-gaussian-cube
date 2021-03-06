# read-gaussian-cube

Collection of MATLAB functions used to read Gaussian cube file. Cube format files generated from the Gaussian DFT package contain volumetric data (ie. molecular orbitals, charge distribution etc.). This program allows you to read the files into MATLAB as a matrix, and plot 2D slices of the data. Originally used for comparison with STM images.

### Utilities 

- `readCube.m`: Read a Gaussian cube file. Outputs the x, y, z axis and cube values along with the configuration of the file.
- `sliceCubeZ.m`: Slice the cube data generated from `readCube.m` at a specific z value.
- `plotSlice2d.m`: Plot a 2d slice in the plane of (x,y) generated by `sliceCubeZ.m`. Can plot atom positions as well if specified.
- `readXYZ.m`: Get the xyz coordinates from xyz file.


