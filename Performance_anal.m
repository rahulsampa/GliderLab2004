h = 40;

%% calculating endurance


%% calculating range
range  = (C_L./C_D_min)*h./3.281;

range2 = (.26057/0.01598)*h

plot(C_D_min,range)