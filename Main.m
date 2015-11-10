%Main program in CFD assignment K1
clc;
clear variables;

%Declaration of scalar variables
maxIterations = 2000;
maxIterations = 50;
%maxIterations = 1;
meshSize = 10;
initialT = 5;
kFactor = 1;
L = 1;
H = 1;
T1 = 10;
T2 = 20;
c1 = 20;
c2 = 0.2;
edgesX = [0 .15 .2 .3 .4 .5 .6 .7 .8 .999 1.0];
edgesY = [0 .2 .4 .6 .8 1.0];

%Initializing mesh and temperature
[T, y, x] = initializeMesh(edgesY, edgesX,T1,T2);
deltaX = diff(edgesX);
deltaX = [1 deltaX 1];
deltaY = diff(edgesY);
deltaY = [1 deltaY 1];

[xMesh,yMesh] = meshgrid(x,y);



%Gauss-Seidel loop
for i = 1:maxIterations
   
    T = GaussSeidel(T,x,y,deltaX,deltaY,T1,c1,c2,kFactor);  

    pause(0.01)
    figure(1);
    contourf(xMesh,yMesh,T);
    drawnow
    
end


