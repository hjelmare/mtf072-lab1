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
edgesX = [0:0.01:1];
edgesY = [0:0.01:1];

%Initializing mesh and temperature
[T, y, x] = initializeMesh(edgesY, edgesX,T1,T2);
deltaX = diff(edgesX);
deltaX = [1 deltaX 1];
deltaY = diff(edgesY);
deltaY = [1 deltaY 1];

[xMesh,yMesh] = meshgrid(x,y);



%Gauss-Seidel loop
epsilon = inf;
while (epsilon > maxDiff)
   
    [T,epsilon] = GaussSeidel(T,x,y,deltaX,deltaY,T1,c1,c2,kFactor);  

%    pause(0.01)
%    figure(2);
%    contourf(xMesh,yMesh,T);
%    drawnow
    
end

T = T(2:end-1,2:end-1);
[xMesh,yMesh] = meshgrid(x(2:end-1),y(2:end-1));
%Plotting result
figure(1);
contourf(xMesh,yMesh,T,20);
