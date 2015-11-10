%function [T, pY, pX] = initializeMesh(edgesY, edgesX)

clc
clf
clear all
edgesX = [0 .15 .2 .3 .4 .5 .6 .7 .8 .999 1.0];
edgesY = [0 .2 .4 .6 .8 1.0];

edgesX = [2*edgesX(1)-edgesX(2) edgesX 2*edgesX(end)-edgesX(end-1)];
edgesY = [2*edgesY(1)-edgesY(2) edgesY 2*edgesY(end)-edgesY(end-1)];

ptPosX = edgesX(1:end-1) + 0.5*diff(edgesX);
ptPosY = edgesY(1:end-1) + 0.5*diff(edgesY);


outMesh = zeros(length(ptPosX),length(ptPosY));
outMesh(1,:) = 10;
outMesh(:,end) = 20;
% b3 is insulating, so it gets dealt with elsewhere
outMesh(:,1) = (1:length(ptPosX)) * (20/length(ptPosX));


T = outMesh;
pY = ptPosY;
pX = ptPosX;



   