h = 40;
W = 2.67; %lbs
Sref = 231.5577; %in ^2



%% calculating range
range  = (C_L./C_D_min)*h./3.281;

range2 = (.26057/0.01598)*h



%% calculating endurance
Wload = W/Sref

% theta = arctan(range2/h)
% Vvert = V*cos(theta)
% E = h/Vvert;

plot(C_D_min,range)