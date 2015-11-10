clc
clf
clear all
%Main program in CFD assignment K1

%Declaration of scalar variables
maxIterations = 1000;
meshSize = 10;
initialT = 10;
kFactor = 1;
L = 1;
H = 1;
T1 = 10;
T2 = 20;
c1 = 20;
c2 = 0.2;

% Give initializeMesh y- and x-locations of edges between cells
distX = [0 1 2 3 4];
distY = [0 1 2 3 4 5 6];

%Initializing mesh
[x,y] = initializeMesh(meshSize);

%Initializing temperature
T = ones(gridSize) * initialT;

%Gauss-Seidel loop
for i = 1:maxIterations
   
    T = GaussSeidel(T,T1,T2,c1,c2,L,H,kFactor);
    
    
    
end

