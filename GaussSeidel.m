function T = GaussSeidel(T,x,y,deltaX,deltaY,T1,c1,c2,kFactor)

    [rows,cols] = size(T);  
    
    %Predefining coefficients that handle boundary conditions
    eCoeff = ones(rows,cols);
    eCoeff(:,cols-1) = 0.5;
    wCoeff = ones(rows,cols);
    wCoeff(:,2) = 0.5;
    nCoeff = ones(rows,cols);
    nCoeff(rows-1,:) = 0;
    sCoeff = ones(rows,cols);
    sCoeff(2,:) = 0.5;
    
    %Performing Gauss-Seidel update    
    disp('hej')
    for j = 2:cols-1
        for i = 2:rows-1
            disp([i j])
            dXeast = (x(j+1) - x(j)) * eCoeff(i,j);
            dXwest = (x(j) - x(j-1)) * wCoeff(i,j);
            dYnorth = (y(i+1) - y(i)) * nCoeff(i,j);
            dYsouth = (y(i) - y(i-1)) * sCoeff(i,j);
            Te = T(i,j+1);
            Tw = T(i,j-1);
            Tn = T(i+1,j);
            Ts = T(i-1,j);
            Tp = T(i,j);
            ae = (deltaY(i)/dXeast) * 2 *(1 + 20*Te/T1)*kFactor;
            aw = (deltaY(i)/dXwest) * 2 *(1 + 20*Tw/T1)*kFactor;
            an = (deltaX(j)/dYnorth) * 2 *(1 + 20*Tn/T1)*kFactor;
            as = (deltaX(j)/dYsouth) * 2 *(1 + 20*Ts/T1)*kFactor;
            bp = -15*c2*Tp*deltaX(j)*deltaY(i);
            bu = 15*c1*deltaX(j)*deltaY(i);
            ap = ae + aw + an + as - bp;
            T(i,j) = (ae*Te + aw*Tw + an*Tn + as*Ts + bu)/ap;   
        end
    end

end