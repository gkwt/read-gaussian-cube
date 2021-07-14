function plotSlice2d( xaxis,yaxis, slice2d, surface,overlay,config )
% Author: Gary (July 15, 2016)
%   Given the X and Y axis and the slice of data of the Gaussian cube, map
%   the values on a surface plot
%
%   Inputs:
%     - xaxis : the values of the X axis of data file
%     - yaxis : the values of the Y axis of data file
%     - slice2d : the 2D matrix of values of x and y
%     - surface : 0/1 toggles the 3D plot if wanted
%     - overlay : 0/1 toggles the overlay of atom positions with circles
%     - config : the configuration of atoms from the Gaussian cube file

figure;
if surface % plot surface plot if specified
    surf(xaxis,yaxis,slice2d');
end

% plot heatmap plot
hold on;
xlim = [min(xaxis),max(xaxis)];
ylim = [min(yaxis),max(yaxis)];
imagesc(xlim,ylim,slice2d');	
colormap(gray);
set(gca,'YDir','normal');
axis([min(xaxis) max(xaxis) min(yaxis) max(yaxis)]);
cbar = colorbar;
% add labels to axes
xlabel('x (Å)');
ylabel('y (Å)');
xlabel(cbar,'E_z (V/Å)');

if overlay % overlay the atomic postiions if necessary
    scatter(config(:,3),config(:,4),100,'w');
end

hold off;
    

end

