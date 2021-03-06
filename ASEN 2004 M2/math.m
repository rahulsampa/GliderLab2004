%% Glider Lab Oswald's Efficiency Calculator 

clc;
clear;
% Tracker for the number of points to look at
    n = 10;
    
% cord length varations 
    chord_length = linspace(6, 20, n)';  % [in]
    
% Wing length variations 
    b = linspace(20, 40, n)';   % [in]
    
%Coefficient of friction for material
C_fe = 0.003;

S_wet = 1319.39; %in^2

S_ref = 231.5577; %in^2
    
% Drag coefficient at zero lift (parasite drag)
   CD_0 = C_fe * (S_wet / S_ref); 
   

   
% Coefficientt of Lift 

   C_L = 0.54112833;
   
    
% Creating the matrix of AR with its corresponding dimensions 
    for i = 1:n
        s = area_calc(chord_length(i), b);
        ratios = b.^2 ./ s;
        chord_length_2 = linspace(chord_length(i), chord_length(i), n)';
        e_factor = linspace(0,.85,n);
        
        if i == 1
            ratios_w_measurments = [ratios, chord_length_2, b];
            AR = ratios_w_measurments;
        else
            ratios_w_measurments = [ratios, chord_length_2, b];
            AR = [AR; ratios_w_measurments];
        end
        
        
        for j = 1:n
           k = 1./(pi*e_factor.*AR(:,1));
            
           C_D = CD_0 + (k * C_L^2)
           
           
           if C_D(j+1) < C_D(j)
               
               C_D_min = C_D(:,j) 
               AR_optimal = AR(j,1) 
               e_factor_optimal = e_factor(j)
               Chord_optimal = AR(j,2)
               Wing_Optimal = AR(j,3)
               j_idx = j
               
           end 
         end   
        
    end

% determing the max AR, dimensions
   [max_ar, idx] = max(AR(:,1));
    max_chord = AR(idx, 2)
    max_wing_length = AR(idx, 3)
    C_D_min
    e_factor_optimal
    Chord_optimal
    Wing_Optimal
    


function a = area_calc(b, L)
    a = (b.*L);
end
