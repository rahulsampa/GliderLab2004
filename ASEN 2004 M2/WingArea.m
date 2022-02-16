%% Varying S_REF (Planform Area of the Wing) 

C_D_min = 0.0180

C_D_range = linspace(0,0.0345,100); 

S_WET = linspace(200,1319,100) %[in^2]
S_WET = S_WET/1550 %[conversion to m^2]

C_F_E = 0.003


S_REF = (C_F_E * S_WET)./(C_D_range)


Wing_Loading = 2.3./S_REF 

%plot(S_REF,C_D_range); 


%% R_max velocity (CD0 = kCL^2)

k = 1/(pi*3.33333*.85)

CL = sqrt(0.016/k)

v_max_range = sqrt((2 * 2.3)/CL*1.225*S_REF) 


plot(Wing_Loading,v_max_range) 








