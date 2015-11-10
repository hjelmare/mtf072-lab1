function [T, pY, pX] = initializeMesh(edgesY, edgesX,T1,T2)


    edgesX = [2*edgesX(1)-edgesX(2) edgesX 2*edgesX(end)-edgesX(end-1)];
    edgesY = [2*edgesY(1)-edgesY(2) edgesY 2*edgesY(end)-edgesY(end-1)];

    ptPosX = edgesX(1:end-1) + 0.5*diff(edgesX);
    ptPosY = edgesY(1:end-1) + 0.5*diff(edgesY);

    outMesh = zeros(length(ptPosX),length(ptPosY));
    outMesh(1,:) = T1;
    outMesh(:,end) = T2;
    % b3 is insulating, so it gets dealt with elsewhere
    outMesh(:,1) = (1:length(ptPosX)) * (20/length(ptPosX));


    T = outMesh;
    pY = ptPosY;
    pX = ptPosX;

end


   