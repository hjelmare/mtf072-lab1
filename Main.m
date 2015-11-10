%Main program in CFD assignment K1

%Declaration of scalar variables
maxIterations = 2000;
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


%Gauss-Seidel loop
for i = 1:maxIterations
   
    T = GaussSeidel(T,x,y,deltaX,deltaY,T1,c1,c2,kFactor);  
    
end

%Plotting result
figure();
contourf(y,x,T);