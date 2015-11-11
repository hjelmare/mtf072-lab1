%Main program in CFD assignment K1
clc;
clear variables;

%Declaration of scalar variables
maxDiff = 1e-3;
meshSize = 10;
initialT = 5;
kFactor = 1;
L = 1;
H = 1;
T1 = 10;
T2 = 20;
c1 = 20;
c2 = 0.2;

% Non-uniform grid
edgesX = [0:0.01:0.2 0.25:0.05:0.85 0.855:0.01:1];
edgesY = [0:0.01:0.2 0.25:0.05:1];

% Finer but uniform
edgesX = [0:0.01:1];
edgesY = [0:0.01:1];

% Overly coarse grid
edgesX = [0:0.1:1];
edgesY = [0:0.1:1];


tic
%Initializing mesh and temperature
[T, y, x] = initializeMesh(edgesY, edgesX,T1,T2);
deltaX = diff(edgesX);
deltaX = [1 deltaX 1];
deltaY = diff(edgesY);
deltaY = [1 deltaY 1];



%Gauss-Seidel loop
epsilon = inf;
while (epsilon > maxDiff)
   
    [T,epsilon] = GaussSeidel(T,x,y,deltaX,deltaY,T1,c1,c2,kFactor);  
    
end

T = T(2:end-1,2:end-1);
[xMesh,yMesh] = meshgrid(x(2:end-1),y(2:end-1));

%Plotting result
figure(1);
contourf(xMesh,yMesh,T,20);
colorbar;
hold on
% Grid points
plot(xMesh,yMesh,'r.')

% Boundary conditions (green for heat flux (Dirichlet), red for Neumann)
plot([0.05 0.95],[0.05 0.05],'g','LineWidth',3)
plot([0.95 0.95],[0.05 0.95],'g','LineWidth',3)
plot([0.05 0.95],[0.95 0.95],'r','LineWidth',3)
plot([0.05 0.05],[0.05 0.95],'g','LineWidth',3)
hold off

time = toc;
disp([num2str(length(x)) 'x' num2str(length(y)) ' pts in ' num2str(time) ' s' ])

saveas(gcf,[num2str(length(x)) 'x' num2str(length(y)) '.png'],'png')